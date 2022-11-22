#!/bin/bash
# This script is ran within the 'run' job, which will check 
#   for the existence of BATS prior to running this script.

# Attempt to create the output directory
mkdir -p "$(dirname "$ORB_VAL_OUTPUT")" || { echo "Failed to create output directory"; exit 1; }

if [ "$ORB_VAL_TIMING" = "true" ]; then
  set -- "$@" --timing
fi

# Ensure this is the last argument
if [ -n "$ORB_VAL_ARGS" ]; then
  set -- "$@" "$ORB_VAL_ARGS"
fi

set -x
bats --formatter "$ORB_VAL_FORMATTER" "$@" "$ORB_VAL_PATH" | tee "$ORB_VAL_OUTPUT"
set +x
