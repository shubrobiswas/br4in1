# Security policy

## Reporting a vulnerability

Please do **not** open a public issue. Report privately via GitHub's
"Report a vulnerability" (Security tab → Advisories) or email the owner,
@shubrobiswas. Expect an acknowledgement within 72 hours.

## Scope and handling

- Only the default branch is supported.
- Secrets must never be committed. If one is, treat it as compromised:
  rotate it first, then remove it from history.
- Dependencies are tracked by Dependabot; security updates are reviewed
  before merge.
