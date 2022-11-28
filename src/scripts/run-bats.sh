#!/bin/bash
# This script is ran within the 'run' job, which will check 
#   for the existence of BATS prior to running this script.

# Attempt to create the output directory
mkdir -p "$ORB_VAL_OUTPUT" || { echo "Failed to create output directory"; exit 1; }

if [ "$ORB_VAL_TIMING" = "1" ]; then
  set -- "$@" --timing
fi

# Ensure this is the last argument
if [ -n "$ORB_VAL_ARGS" ]; then
  set -- "$@" "$ORB_VAL_ARGS"
fi

set -x
#shellcheck disable=SC2086
bats --formatter "$ORB_VAL_FORMATTER" --report-formatter "$ORB_VAL_REPORT_FORMATTER" "$@" --output "$ORB_VAL_OUTPUT" $ORB_VAL_PATH 
set +x
