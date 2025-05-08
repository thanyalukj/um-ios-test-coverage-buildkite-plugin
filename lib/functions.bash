#!/usr/bin/env bash

# Get the value of a specified key from the sonar-project.properties file.
# $1 - key name, matched at beginning of line.
function prop {
  local key=$1
  local sonar_project_properties="sonar-project.properties"

  grep "^${key}" ${sonar_project_properties} | cut -d'=' -f2
}

# Boot an iOS simulator with retries
# code stolen from https://github.com/actions/runner-images/blob/5a6e2158591c3f3b0c732691694d061fea8f792e/images/macos/scripts/build/configure-xcode.sh
function boot_simulator {
  local simulator_name=$1

  # quit the CoreSimulatorService
  launchctl remove com.apple.CoreSimulator.CoreSimulatorService || true
  # add sleep to let CoreSimulatorService to exit
  sleep 3
  # erase the devices
  xcrun simctl erase all
  # add sleep due to sometimes "xcrun simctl list" takes more than a few moments and script fails when trying to remove CoreSimulatorSerivce
  sleep 5

  # Set and boot the desired simulator with retries
  echo "~~~ Set and boot the desired simulator with retries"
  RETRIES=5
  for i in $(seq 1 $RETRIES); do
    if xcrun simctl boot "$simulator_name"; then
      echo "Simulator booted successfully"
      break
    else
      echo "Failed to boot simulator, retrying... ($i/$RETRIES)"
      sleep 5
    fi
  done

  # Add sleep to ensure the simulator is fully booted
  sleep 5
}
