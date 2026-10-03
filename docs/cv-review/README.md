# CV review – 2026 positioning

Target: permanent position, full remote, any sector, 50/50 tech / leadership split.

## Where the proposals live

The fixes that apply to every target are in `main.tex`. Each positioning is a CV variant (see "Variants" in `AGENTS.md`):

| Variant | Target | Build |
|---------|--------|-------|
| `variants/default.tex` | Generic CV (previous positioning) | `./build.sh` |
| `variants/tech-lead.tex` | Tech Lead Fullstack Java/Angular | `./build.sh tech-lead` |
| `variants/platform.tex` | Platform Engineer / DevOps | `./build.sh platform` |
| `variants/staff.tex` | Staff Engineer / Hands-on architect | `./build.sh staff` |

`\afaire{...}` placeholders are printed in red: replace them with real figures or delete them.
The original proposals as diff files are in git history (commit `a672a1e`).

## Overall assessment

**Strengths**
- Clear progression: Java developer, then DevOps, then global tech lead. This story is easy to follow.
- 7 years leading teams in India, Poland and France: this is concrete proof that you can work remotely and asynchronously. The current CV never says so.
- Up-to-date stack (Kubernetes, ArgoCD, Terraform, OpenTelemetry, Angular), plus the craftsmanship culture inherited from Ippon (TDD, BDD, hexagonal architecture).
- TOEIC 945 and an international context.

**Weaknesses**
- No figures at all: team size is the only number. A recruiter cannot measure impact (deployment frequency, lead time, incidents, number of services, users).
- No cloud provider (AWS / GCP / Azure). Most remote job ads require one.
- No versions (Java, Spring Boot, Angular). Recruiters' search filters use them.
- The current position is written in first-person prose. It is long, and the 50/50 split appears only at the end of a paragraph.
- Only certification: Core Spring 3.2 (2014). It is dated, and it shows that nothing newer was taken.
- The 2007–2013 missions take up half a page with no results.
- Full street address in the header. It is useless for a remote role, and it is personal data.
- Typos: "Developper", "Notatriat", "acorhotels", "courbe", "features teams", "crédits structurés"/"crédit structurés".
- Education comes before experience. After 19 years, experience should come first.

## Hypothesis 1 – Tech Lead Fullstack Java / Angular

Most natural fit with the current job. Targets: product companies, scale-ups, software publishers.

| Strengths | Weaknesses |
|-----------|------------|
| Current title is a direct match | "Tech lead" is crowded on the market: impact figures are needed to stand out |
| Real fullstack (Release Tool in Java/Angular) | No Java/Spring/Angular versions |
| Craftsmanship: TDD, BDD, Leagues/Chapters | Mentoring and code reviews are mentioned without any concrete detail |
| 18 developers, 3 countries | No mention of product work (working with a PO, delivery) |

Variant `tech-lead`: tech-lead title, a profile summary that mentions full remote, a skills table that puts versions first, more concrete key points (roadmap with examples of migrations, Release Tool usage), a deployment metric.

## Hypothesis 2 – Platform Engineer / DevOps (dev-oriented)

Strong market for full remote. A developer background is valued for building internal tooling (the Release Tool is a good example).

| Strengths | Weaknesses |
|-----------|------------|
| Complete GitOps chain (GitHub Actions, ArgoCD, Helm, K8s) | No public cloud: a blocker for many job ads |
| IaC (Terraform, Ansible) and observability (OTel, Elastic) | No CKA/CKAD/Terraform Associate certification |
| Credible move from dev to DevOps (2017) | No SRE indicators: SLO, MTTR, incidents, on-call |
| Release Tool = developer platform | Scale not stated (number of services, clusters, environments) |

Variant `platform`: platform title, a profile that tells the dev-to-DevOps story, skills split into CI/CD / Infra / Monitoring, platform key points first, with before/after placeholders.

Suggested action outside the CV: CKA or CKAD certification, plus a cloud certification if you have real experience with that provider.

## Hypothesis 3 – Staff Engineer / Hands-on architect

Matches a technical scope across several teams without becoming a manager. Fits the 50/50 split.

| Strengths | Weaknesses |
|-----------|------------|
| Global Technical Leader across 4 teams = staff-level scope | No architecture decision is described |
| Technical roadmap, group standards, cross-project forums | No visible artifacts (ADR, RFC, talks, blog posts, open source) |
| Still writes code | "Staff Engineer" is less common in France: also target "Architecte logiciel" or "Principal Engineer" |
| | Conferences you attend are not a strength; giving a talk would be one |

Variant `staff`: Staff/Architect title, a profile focused on technical decisions, an Architecture row in the skills, a key point to fill with a real architecture decision (context, choice, result).

## Assumptions to check

- The 2007–2009 job (no employer mentioned) was merged with ERDF (Capgemini) as `2007--2011`.
- "Full remote" is shown in the header next to the city.
- In `tech-lead`, `platform` and `staff`, the paragraph "Mon rôle m'assure… 50 %" is removed because the profile summary covers it, and the conference paragraph is shortened.
