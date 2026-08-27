# TODO

The foundational cybersecurity program now follows the suite content-repo format and is ready for ingestion. Remaining work expands depth and media production.

## Foundation

- [x] Upgrade manifest to the full suite content-repo path contract. <!-- ms:evidence id=cyb-manifest path=content-repo.json strings=complete-delivery-ready,generatedLectures,misconceptions -->
- [x] Add CYB-101 course object with objectives, weekly plan, practice, essays, tests, projects, accessibility, remediation, and external source links. <!-- ms:evidence id=cyb-course path=study-plans/courses/CYB-101-cybersecurity-defense-foundations.md strings=Learning Outcomes,Weekly Plan,External Source Links -->
- [x] Add source shelf, delivery/progress guide, objective index, misconception library, assessment bank, learner fixtures, and lecture metadata. <!-- ms:evidence id=cyb-support path=resources/reading-library.md;resources/course-delivery-practice-and-progress-guide.md;objectives/cybersecurity-objectives.md;assessments/cybersecurity-assessment-bank.md;misconceptions/misconceptions.md strings=no hidden testing,essay,adaptive -->
- [x] Add local verifier and pass `.\scripts\codex-verify.ps1`. <!-- ms:evidence id=cyb-verify path=scripts/codex-verify.ps1 strings=complete-delivery-ready,External Source Links,errorCount -->

## Next Production Work

- [ ] Produce archived lecture media for CYB-101 with checksums and publish-gate review. <!-- ms:evidence id=cyb-media path=generated-lectures/intro-foundations strings=checksum,publish,operator --> <!-- ms:meta priority=p2 owner=@owner stale-days=30 automation-level=assisted human-checkpoint=review rollout-scope=single validation-profile=cloud safe-autofix=review updated=2026-06-21 -->
- [ ] Add dedicated courses for secure networking, application security, cloud security, incident response, digital forensics, and governance/risk/compliance. <!-- ms:evidence id=cyb-expansion path=study-plans/courses strings=networking,application,cloud,incident,forensics,governance --> <!-- ms:meta priority=p3 owner=@owner stale-days=45 automation-level=assisted human-checkpoint=review rollout-scope=single validation-profile=cloud safe-autofix=review updated=2026-06-21 -->

## Repository Maintenance

- [x] Normalize seven maintained PowerShell command templates for unattended startup. <!-- ms:evidence id=cyb-powershell-startup-001 path=repo-standards/lint/language_lint_matrix.json;scripts/lint/run_changed_scope.ps1 strings=NonInteractive -->
  - Scope: six v1 lint-matrix recipes and one synthetic TODO verification command; preserve schema, arguments, optional tools, and the local verifier.
  - Verification: `pwsh -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\codex-verify.ps1`; full shared startup inventory and independent review required before closure.
  - Evidence: ignored local verification logs and the `00-repo-kit` Wave67 benchmark/review packet. This maintenance does not certify curriculum quality or close production work.
