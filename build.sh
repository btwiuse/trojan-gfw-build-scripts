SCRIPT_DIR="$(dirname $(realpath $0))"
TROJAN="${SCRIPT_DIR}"
IGNITER="${SCRIPT_DIR}/igniter"
cd "${IGNITER}"
cp -r ../igniter-patch/* .
./gradlew assembleRelease
find . -name '*.apk' | xargs -L1 realpath
