# CYB-101 Cybersecurity Defense Foundations

## Course Role

CYB-101 is a foundations course for defensive cybersecurity. It teaches learners to reason from assets, threats, trust boundaries, logs, controls, and evidence instead of memorizing tool names.

## Duration

16 weeks. Each week includes one lecture or guided lab, source reading, retrieval practice, a written security artifact, and a hands-on or tabletop practice loop. Full lecture media should target 45 to 55 minutes; short fixtures may be shorter.

## Prerequisites

Learners should know basic computer use and be willing to practice only in owned, authorized, or intentionally provided lab environments. The course does not require prior security experience.

## Learning Outcomes

By the end of the course, the learner can:

- `cybersecurity:objectives/course/cyb-101/security-thinking`: Explain cybersecurity as protecting people, systems, data, availability, integrity, and trust.
- `cybersecurity:objectives/course/cyb-101/network-and-identity-basics`: Trace basic network, DNS, account, authentication, and authorization flows.
- `cybersecurity:objectives/course/cyb-101/threat-modeling`: Build a simple threat model with assets, actors, entry points, trust boundaries, threats, mitigations, and assumptions.
- `cybersecurity:objectives/course/cyb-101/control-selection`: Select preventive, detective, corrective, and recovery controls for a scenario.
- `cybersecurity:objectives/course/cyb-101/application-risk`: Explain common application security risks using OWASP-style categories and safe examples.
- `cybersecurity:objectives/course/cyb-101/log-triage`: Triage basic security events and write evidence-grounded incident notes.
- `cybersecurity:objectives/course/cyb-101/incident-response`: Plan first-response steps that preserve evidence, reduce harm, and avoid panic.
- `cybersecurity:objectives/course/cyb-101/risk-communication`: Write a clear risk memo for a technical and nontechnical audience.
- `cybersecurity:objectives/course/cyb-101/ethics-and-authorization`: Distinguish authorized learning from harmful testing, intrusion, or surveillance.
- `cybersecurity:objectives/course/cyb-101/capstone-defense`: Defend a small security improvement plan with evidence, tradeoffs, and residual risk.

## Weekly Plan

| Week | Topic | Lecture / Video | Reading | Practice | Evidence |
| --- | --- | --- | --- | --- | --- |
| 1 | Security as defensive responsibility | Intro board lecture | NIST CSF overview | Personal security baseline | Baseline essay |
| 2 | Systems, assets, and trust | Diagram lecture | CISA basics and local network references | Asset inventory | Asset map |
| 3 | Network and identity flows | Packet and account flow board work | DNS, HTTP, MFA, password guidance | Trace a login path | Flow explanation |
| 4 | Threat modeling | Worked model lecture | OWASP threat modeling sources | Model a login page | Threat model |
| 5 | Controls and defense in depth | Control selection seminar | NIST CSF functions | Map controls to risks | Control matrix |
| 6 | Application risk | Safe examples lecture | OWASP Top 10 overview | Risk categorization | App-risk memo |
| 7 | Vulnerability management | Patch and exposure lecture | CISA known exploited vulnerabilities guidance | Prioritize fixes | Vulnerability memo |
| 8 | Midterm risk memo | Writing workshop | Review sources | Draft and revise | Midterm memo |
| 9 | Logs and detection | Log triage lecture | MITRE ATT&CK overview | Analyze synthetic logs | Triage notes |
| 10 | Incident first response | Tabletop lecture | NIST incident handling guide | First-hour tabletop | Response checklist |
| 11 | Recovery and resilience | Board lecture | Backup and recovery guidance | Recovery plan | Recovery memo |
| 12 | Human factors | Seminar | Phishing, social engineering, and training sources | Design safe training | Awareness plan |
| 13 | Governance and policy | Risk governance lecture | NIST CSF and CIS Controls overview | Policy critique | Policy revision |
| 14 | Security communication | Writing studio | Plain-language risk examples | Executive summary drill | Risk communication memo |
| 15 | Capstone rehearsal | Coaching lab | Review chosen sources | Plan defense | Draft capstone |
| 16 | Capstone defense | Oral defense | None beyond review | Present, critique, revise | Final portfolio |

## Practice

All technical practice must stay in authorized labs, owned devices, or deliberately synthetic examples. Practice includes diagrams, tabletop exercises, synthetic log review, safe configuration checks, and written risk communication. Live practice must be ordinary, consent-respecting, low-stakes, and never hidden testing.

## Quizzes

Quizzes support retrieval of vocabulary, network flow, security control types, incident steps, and common misconceptions. They are calibration tools only; mastery requires written analysis, practical evidence, and a defended capstone.

## Tests

Major tests:

- Baseline essay: explain a security failure without blaming only users or tools.
- Midterm risk memo: diagnose a scenario, select controls, explain tradeoffs, and name residual risk.
- Incident tabletop: write first-hour response notes from synthetic evidence.
- Capstone defense: present a security improvement plan, answer objections, and revise.

## Projects

Projects:

- Personal or small-organization asset map.
- Login-page threat model.
- Defensive control matrix.
- Synthetic log triage packet.
- Incident response tabletop checklist.
- Capstone security improvement portfolio.

## Portfolio Evidence

The portfolio must show drafts, feedback, revisions, diagrams, tabletop records, synthetic log notes, and risk memos. Passive watching is not mastery; passive watching cannot substitute for practice evidence.

## Accessibility Notes

Lectures need captions, transcript, board close-ups for dense diagrams, text alternatives for diagrams, keyboard-friendly lab alternatives, and non-timed versions of assessments unless timing is part of an incident-response objective.

## Adaptive Remediation

If a learner struggles, the teacher should route back to the objective that failed, use a simpler scenario, ask for retrieval, apply the idea to a new safe case, and collect a revised artifact. Remediation should change examples and pacing without lowering the security or ethics standard.

## External Source Links

Use `resources/reading-library.md` as the link-only source shelf. Do not copy third-party text into course materials.

| Provider | Title | URL | SourceType | BorrowedPattern | LicenseUseBoundary | LastReviewed | BrokenLinkStatus |
| --- | --- | --- | --- | --- | --- | --- | --- |
| National Institute of Standards and Technology | Cybersecurity Framework | [https://www.nist.gov/cyberframework](https://www.nist.gov/cyberframework) | framework | Organize security outcomes, functions, and risk communication | Link only; respect NIST publication terms | 2026-06-21 | not-checked |
| CISA | Cybersecurity Resources | [https://www.cisa.gov/resources-tools/resources](https://www.cisa.gov/resources-tools/resources) | guidance | Public-sector defensive guidance and awareness resources | Link only; do not imply endorsement | 2026-06-21 | not-checked |
| OWASP Foundation | OWASP Top 10 | [https://owasp.org/www-project-top-ten/](https://owasp.org/www-project-top-ten/) | reference | Application security risk categories and teaching examples | Link only; follow OWASP license terms | 2026-06-21 | not-checked |
| MITRE | ATT&CK | [https://attack.mitre.org/](https://attack.mitre.org/) | knowledge-base | Tactics and techniques language for detection reasoning | Link only; follow MITRE terms | 2026-06-21 | not-checked |
| NIST Computer Security Resource Center | SP 800-61 Computer Security Incident Handling Guide | [https://csrc.nist.gov/publications/detail/sp/800-61/rev-2/final](https://csrc.nist.gov/publications/detail/sp/800-61/rev-2/final) | guidance | Incident handling lifecycle and first-response structure | Link only; respect NIST publication terms | 2026-06-21 | not-checked |
