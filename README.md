1. install android sdk, and modify env accordingly

	./install-android-sdk

    or

	sudo snap install androidsdk
	androidsdk 'ndk;21.0.6113669'

2. ./build-boost-for-all-arch && ./build-openssl-for-all-arch && ./build-go-lib && ./build-igniter

  2. ./build-go-lib # install gomobile

    go get golang.org/x/mobile/cmd/gomobile
    gomobile init

  3. ./build-android-boost # install bjam

    copy local bjam

  4. ./build-android-openssl
  5. ./build-igniter
