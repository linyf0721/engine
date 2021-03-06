#!/bin/sh
FLUTTER_ENGINE=ios_debug_sim_unopt

TESTING_DIR=$(dirname "$0")
pushd $TESTING_DIR

if [ $# -eq 1 ]; then
  FLUTTER_ENGINE=$1
fi

set -o pipefail && xcodebuild -sdk iphonesimulator \
  -scheme IosUnitTests \
  -destination 'platform=iOS Simulator,name=iPhone 8' \
  test \
  FLUTTER_ENGINE=$FLUTTER_ENGINE
popd
