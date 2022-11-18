#!/bin/bash
# This script is ran within the 'run' job, which will check 
#   for the existence of BATS prior to running this script.
bats "$ORB_VAL_PATH"