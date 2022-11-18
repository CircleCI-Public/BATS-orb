#!/usr/bin/env bats
#
# Bash Automated Testing System file to test the we can run these scripts.
# See https://github.com/bats-core/bats-core for help with syntax.
# ... although it's effectively "just bash" with a few extras.
#
# If you see code like "[ something ]" then that's doing a test (do "man test"
# for details) and anything that returns a non-zero exit code will fail the
# test because bash is being run with the -e flag.
# ...except ! true won't fail the test because bash excludes ! command from the
# auto-fail-on-error, hence we do ! command || false to make it fail.
#
# Just as with JUnit etc, setup gets run before every test, teardown after,
# with tests containing Given (scenario), When (used) and Then (expectations)
# section.

setup() {
    bats_require_minimum_version 1.8.0
    if [ "${BATS_TEST_NUMBER}" -eq 1 ]; then
        echo "Tests being run using BATS version ${BATS_VERSION}"
    fi

    # Put our scripts-under-test folder on the path too.
    # Use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0 to find our own location
    # then CD ../scripts to find the code we're testing.
    codeUnderTestDirectory="$( cd "$( dirname "${BATS_TEST_FILENAME}" )" >/dev/null 2>&1 && cd ../scripts && pwd )"
    # make executables in scripts/ visible to PATH
    # and anything we put into our test temp area
    export PATH="${codeUnderTestDirectory}:${PATH}"

    # These lines are here to support the teardown diagnostics.
    status=''
    stderr=''
    output=''
    BATS_RUN_COMMAND=''
}

teardown() {
    # The CircleCI bats orb does not upload test results to CircleCI, which
    # means it's very difficult to debug when things fail.
    # So this adds some verbose outputs to assist with diagnosis.
    if [ -n '${status}' ]; then
        echo "Last command run was ${BATS_RUN_COMMAND}"
        echo "It exited with code ${status}"
        echo "Stdout=${output}"
        echo "Stderr=${stderr}"
    fi
}

@test "Fake test that always passes" {
    # Given
    export PARAM_TO=world

    # When
    run -0 --separate-stderr echo "Hello ${PARAM_TO}"

    # Then
    [ -z "${stderr}" ]
    [ -n "${output}" ]
    echo "${output}" | grep -q "${PARAM_TO}"
    echo "${output}" | grep -q "Hello"
}
