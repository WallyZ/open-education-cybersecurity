[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$runId = ('{0:yyyyMMdd_HHmmss}_{1}' -f (Get-Date), [Guid]::NewGuid().ToString('N').Substring(0, 8))
$cacheRoot = Join-Path $repo '.codex-cache'
$logRoot = Join-Path $cacheRoot 'logs'
$tmpRoot = Join-Path (Join-Path $cacheRoot 'tmp') $runId
$logPath = Join-Path $logRoot ("codex-verify_{0}.log" -f $runId)

[void](New-Item -ItemType Directory -Force -Path $logRoot, $tmpRoot)

$previousTemp = $env:TEMP
$previousTmp = $env:TMP
$pushed = $false
$exitCode = 1

function Write-VerifyLog {
    param([string]$Message)
    $Message | Tee-Object -FilePath $script:logPath -Append
}

function Assert-FileExists {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Missing required file: $Path"
    }
    Write-VerifyLog "ok file $Path"
}

function Assert-DirectoryExists {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        throw "Missing required directory: $Path"
    }
    Write-VerifyLog "ok dir  $Path"
}

function Assert-Contains {
    param(
        [string]$Path,
        [string]$Pattern,
        [string]$Message
    )
    $content = Get-Content -LiteralPath $Path -Raw
    if ($content -notmatch $Pattern) {
        throw $Message
    }
    Write-VerifyLog "ok content $Path $Pattern"
}

try {
    $env:TEMP = $tmpRoot
    $env:TMP = $tmpRoot

    Push-Location $repo
    $pushed = $true
    Write-VerifyLog "codex-verify start repo=$repo"

    foreach ($file in @(
        '.\AGENTS.md',
        '.\README.md',
        '.\.gitignore',
        '.\content-repo.json',
        '.\docs\TODO.md',
        '.\resources\reading-library.md',
        '.\resources\course-delivery-practice-and-progress-guide.md',
        '.\assessments\machine-addressable-assessment-items.json',
        '.\misconceptions\misconceptions.md',
        '.\fixtures\learner-scenarios.json',
        '.\generated-lectures\intro-foundations\persona-reference.json',
        '.\generated-lectures\intro-foundations\lecture-video.json'
    )) {
        Assert-FileExists $file
    }

    foreach ($dir in @(
        '.\study-plans',
        '.\study-plans\courses',
        '.\resources',
        '.\objectives',
        '.\assessments',
        '.\misconceptions',
        '.\fixtures',
        '.\generated-lectures'
    )) {
        Assert-DirectoryExists $dir
    }

    $manifest = Get-Content -LiteralPath '.\content-repo.json' -Raw | ConvertFrom-Json
    if ($manifest.schemaVersion -ne 1) { throw 'content-repo.json schemaVersion must be 1.' }
    if ($manifest.role -ne 'content-repository') { throw 'content-repo.json role must be content-repository.' }
    if ($manifest.compatibleSuite -ne 'open-education-suite') { throw 'content-repo.json compatibleSuite must be open-education-suite.' }
    if ($manifest.status -ne 'complete-delivery-ready') { throw 'content-repo.json status must be complete-delivery-ready.' }
    foreach ($key in @('studyPlans', 'resources', 'objectives', 'assessments', 'misconceptions', 'fixtures', 'generatedLectures')) {
        if (-not ($manifest.paths.PSObject.Properties.Name -contains $key)) { throw "content-repo.json missing paths.$key." }
        Assert-DirectoryExists $manifest.paths.$key
    }

    $courseFiles = @(Get-ChildItem -LiteralPath '.\study-plans\courses' -Filter '*.md' -File)
    if ($courseFiles.Count -lt 1) { throw 'Expected at least one course file.' }

    foreach ($courseFile in $courseFiles) {
        $courseText = Get-Content -LiteralPath $courseFile.FullName -Raw
        foreach ($marker in @(
            '## Learning Outcomes',
            '## Weekly Plan',
            '## Quizzes',
            '## Tests',
            '## Projects',
            '## Portfolio Evidence',
            '## Accessibility Notes',
            '## Adaptive Remediation',
            '## External Source Links'
        )) {
            if ($courseText -notmatch [regex]::Escape($marker)) {
                throw "Course missing marker $marker in $($courseFile.Name)."
            }
        }
        if ($courseText -notmatch ([regex]::Escape([string]$manifest.id) + ':objectives/course/')) {
            throw "Course missing suite objective ids in $($courseFile.Name)."
        }
        foreach ($column in @('Provider', 'Title', 'URL', 'SourceType', 'BorrowedPattern', 'LicenseUseBoundary', 'LastReviewed', 'BrokenLinkStatus')) {
            if ($courseText -notmatch [regex]::Escape($column)) {
                throw "Course External Source Links table missing $column in $($courseFile.Name)."
            }
        }
    }

    $objectiveText = (Get-ChildItem -LiteralPath '.\objectives' -Filter '*.md' -File | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join "`n"
    if ($objectiveText -notmatch ([regex]::Escape([string]$manifest.id) + ':objectives/course/')) {
        throw 'Objective index missing suite objective ids.'
    }

    $assessmentText = (Get-ChildItem -LiteralPath '.\assessments' -Filter '*.md' -File | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join "`n"
    foreach ($required in @('essay', 'synthesis', 'project', 'Rubric')) {
        if ($assessmentText -notmatch $required) { throw "Assessment bank missing $required." }
    }

    $items = Get-Content -LiteralPath '.\assessments\machine-addressable-assessment-items.json' -Raw | ConvertFrom-Json
    if ($items.schemaVersion -ne 1) { throw 'Assessment items schemaVersion must be 1.' }
    if (@($items.items).Count -lt 6) { throw 'Expected at least six machine-addressable assessment items.' }
    if (@($items.items | Where-Object { $_.type -eq 'essay' }).Count -lt 1) { throw 'Expected at least one essay assessment item.' }

    $persona = Get-Content -LiteralPath '.\generated-lectures\intro-foundations\persona-reference.json' -Raw | ConvertFrom-Json
    if ($persona.voiceMatchPolicy -ne 'match-generated-instructor-gender') { throw 'Persona reference missing voice match policy.' }
    if ([string]::IsNullOrWhiteSpace([string]$persona.disclosureLanguage) -or -not ([string]$persona.disclosureLanguage).Contains('generated instructor')) {
        throw 'Persona reference must disclose generated instructor.'
    }

    $lecture = Get-Content -LiteralPath '.\generated-lectures\intro-foundations\lecture-video.json' -Raw | ConvertFrom-Json
    if ($lecture.schemaVersion -ne 1) { throw 'Lecture video schemaVersion must be 1.' }
    if (@($lecture.segments).Count -lt 3) { throw 'Lecture fixture must contain at least three segments.' }
    if (@($lecture.segments | Where-Object { $_.kind -eq 'checkpoint' }).Count -lt 1) { throw 'Lecture fixture must include a checkpoint segment.' }

    Assert-Contains -Path '.\resources\course-delivery-practice-and-progress-guide.md' -Pattern 'No hidden testing' -Message 'Delivery guide must include no hidden testing.'
    Assert-Contains -Path '.\docs\TODO.md' -Pattern '\[x\]' -Message 'TODO must include completed evidence items.'

    Write-VerifyLog 'content repository verification passed.'
    $exitCode = 0
}
catch {
    Write-VerifyLog ("codex-verify failed: {0}" -f $_.Exception.Message)
    $exitCode = 1
}
finally {
    if ($pushed) { Pop-Location }
    $env:TEMP = $previousTemp
    $env:TMP = $previousTmp
    Remove-Item -LiteralPath $tmpRoot -Recurse -Force -ErrorAction SilentlyContinue
}

if ($exitCode -ne 0) {
    Write-Output ("codex-verify failed: exit={0} log={1}" -f $exitCode, $logPath)
    exit $exitCode
}

Write-Output ("codex-verify passed: log={0}" -f $logPath)
exit 0
