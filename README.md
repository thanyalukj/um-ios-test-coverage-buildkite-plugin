# UM iOS Test Coverage Buildkite Plugin

The UM iOS Test Coverage Buildkite plugin provides the following functionality to support Building Unified Module:

- It runs iOS Library Unit Test when PR is created and when PR is merged to the `main` branch.
- It sends test coverage report to Sonar when PR is created and when PR is merged to the `main` branch.
- For `react-library`, the plugin runs ReactNative iOS Unit Tests.

## Example Usage

```yml
steps:
  - label: Run Unit Tests and Sonar Report
    plugins:
      - ssh://git@github.com/fanduel/um-ios-test-coverage-buildkite-plugin.git#v1.0.3:
          platform: "ios-library"
          workspace: "AmplitudeUm.xcworkspace"
          scheme: "AmplitudeUm_TestHarness"
    agents:
      ueue: macos-sonoma
```

## Configuration

### `platform` (Required, string)

Specifies the platform. Accepted values are: `ios-library`, `react-library`

### `workspace` (Required, string)

Specifies the exact name of the Xcode workspace.

### `scheme` (Required, string)

Specifies the exact name of the Xcode scheme.

## Development

To execute the tests, run the following command:

```shell
docker-compose run --rm tests
```

## Contributing

This project is tagged automatically by a GitHub action. Conventional Commit prefix is used used to determine the change to the version tag.

Apply one of the prefixes to the PR title as described below to increment the build number:

* `chore: ` Will not create a new version tag
* `fix: ` Will bump the last digit - patch version
* `feat: ` - Will bump the middle digit - minor version
* `feat!: ` - Will bump the first digit - major version (breaking change)

See [conventional commit documentation](https://www.conventionalcommits.org/en/v1.0.0/) for more details.
