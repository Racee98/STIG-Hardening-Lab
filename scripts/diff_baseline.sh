#!/bin/bash
# Usage: bash diff_baseline.sh <config_name>
# Example: bash diff_baseline.sh sshd_config
NAME=${1:-sshd_config}
BASELINE=$HOME/stig-lab/baselines/${NAME}.baseline

declare -A LIVE_PATHS
LIVE_PATHS[sshd_config]=/etc/ssh/sshd_config
LIVE_PATHS[pwquality.conf]=/etc/security/pwquality.conf
LIVE_PATHS[login.defs]=/etc/login.defs
LIVE_PATHS[common-auth]=/etc/pam.d/common-auth

LIVE=${LIVE_PATHS[$NAME]}
if [ -z "$LIVE" ]; then
  echo "Unknown config '$NAME'. Known: ${!LIVE_PATHS[@]}"
  exit 1
fi

echo "=== Baseline vs Current: $NAME ==="
diff "$BASELINE" "$LIVE" && echo "(no changes)" || true
