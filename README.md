# BATS Orb [![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/BATS-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/BATS-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/bats)](https://circleci.com/orbs/registry/orb/circleci/bats) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/BATS-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Easily install and execute the "[Bats-Core](https://github.com/bats-core/bats-core)" Bash Automated Testing System within your CircleCI pipelines. A TAP compliant bash-based testing utility used for testing bash shell scripts.

## Usage

Example use-cases are provided on the orb [registry page](https://circleci.com/orbs/registry/orb/circleci/bats#usage-examples). Source for these examples can be found within the `src/examples` directory.

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/circleci/bats) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

## Testing Orbs with BATS

Orbs are written using single self-executing bash scripts. To test them, it is helpful to break out particular functions within bash file so that they may be individually mocked and tested.

[Funcshion](https://github.com/ryanwohara/funcshion) is a bash utility written specifically with orbs in mind.

[ Full examples from the orb-tools-orb coming soon ]


### How To Contribute

We welcome [issues](https://github.com/CircleCI-Public/BATS-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/BATS-orb/pulls) against this repository!

To publish a new production version:
* Create a PR to the `Alpha` branch with your changes. This will act as a "staging" branch.
* When ready to publish a new production version, create a PR from `Alpha` to `master`. The Git Subject should include `[semver:patch|minor|release|skip]` to indicate the type of release.
* On merge, the release will be published to the orb registry automatically.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).
