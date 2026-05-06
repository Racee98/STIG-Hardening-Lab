# STIG Hardening Lab — Ubuntu 22.04 LTS

## Connection
  vagrant ssh
  su - analyst          # password: Analyst123!
  VM IP (for Nessus): 192.168.56.10

## 10 Staged STIG Findings

| #  | STIG ID        | Finding                                | File to Fix                        |
|----|----------------|----------------------------------------|------------------------------------|
|  1 | UBTU-22-255010 | SSH PermitRootLogin enabled            | /etc/ssh/sshd_config               |
|  2 | UBTU-22-255015 | SSH MaxAuthTries = 6 (must be ≤ 3)    | /etc/ssh/sshd_config               |
|  3 | UBTU-22-255035 | No SSH warning banner                  | /etc/ssh/sshd_config + /etc/issue.net |
|  4 | UBTU-22-255045 | SSH ClientAliveInterval = 0            | /etc/ssh/sshd_config               |
|  5 | UBTU-22-255050 | SSH PermitEmptyPasswords enabled       | /etc/ssh/sshd_config               |
|  6 | UBTU-22-611025 | No password complexity (pwquality)     | /etc/security/pwquality.conf       |
|  7 | UBTU-22-011010 | No system login banner                 | /etc/issue and /etc/issue.net      |
|  8 | UBTU-22-653010 | auditd not enabled or running          | systemctl enable/start auditd      |
|  9 | UBTU-22-411010 | PASS_MAX_DAYS = 99999 (must be ≤ 60)  | /etc/login.defs                    |
| 10 | UBTU-22-412025 | No session timeout (TMOUT not set)     | /etc/profile.d/tmout.sh (create)   |

## Lab Workflow
  1. Run Nessus scan against 192.168.56.10   →  save HTML/PDF to evidence/before/
  2. Open DISA Ubuntu 22.04 STIG in STIG Viewer  →  create .ckl in checklists/
  3. Remediate each finding above
  4. Track changes:  bash ~/stig-lab/scripts/diff_baseline.sh sshd_config
  5. Commit changes:  git add -A && git commit -m "CHG-001: disable root SSH login"
  6. Re-run Nessus   →  save to evidence/after/
  7. Fill in reports/dadms_log.md for each fix

## After each SSH change, restart the service
  sudo systemctl restart ssh

## Useful references
  DISA Ubuntu 22.04 STIG:   https://public.cyber.mil/stigs/downloads/
  STIG Viewer (Windows):    https://public.cyber.mil/stigs/srg-stig-tools/
  Nessus Essentials (free): https://www.tenable.com/products/nessus/nessus-essentials
