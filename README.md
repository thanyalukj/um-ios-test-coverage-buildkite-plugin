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
          fd_npm_read_username: "username"
          fd_npm_auth_token: "auth_token"
          fd_npm_repo: "fd-npm"
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

### `fd_npm_read_username` (Required, string)

Specifies fd_npm_read_username. Is required only for `react-library` to run `npm ci` command.

### `fd_npm_auth_token` (Required, string)

Specifies fd_npm_auth_token. Is required only for `react-library` to run `npm ci` command.

### `fd_npm_repo` (Required, string)

Specifies fd_npm_repo. Is required only for `react-library` to run `npm ci` command.

## Development

To execute the tests, run the following command:

```shell
docker-compose run --rm tests
```
