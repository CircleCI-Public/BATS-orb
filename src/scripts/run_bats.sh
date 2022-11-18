#!/bin/bash
#
# Runs a BATS unit-test and outputs the result as a JUnit unit-test.
#
# Requires bats to be installed already.
#
# Expects the following env vars to be set:
#   BATS_SRC
#     = the file(s) to be processed, escaped as necessary for shell.
#   BATS_OPTIONS
#     = any arguments given to BATS.
#       The only "hard coded" options we specify are to report in JUnit format
#       into the JUNIT_OUT folder.
#       Everything else is in the hands of the caller.
#   JUNIT_OUT
#     = the folder where JUnit XML files should be created.
#       This will be created if it doesn't already exist.

set -euo pipefail

mkdir -p "${JUNIT_OUT}"

# We don't wrap BATS_SRC in quotes because it might be more than one file.
# Similarly, BATS_OPTIONS can be more than one option.
# shellcheck disable=SC2086
bats --report-formatter junit --output "${JUNIT_OUT}" ${BATS_OPTIONS} ${BATS_SRC}
