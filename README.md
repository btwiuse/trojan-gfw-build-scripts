1. install android sdk, and modify env accordingly
	sudo snap install androidsdk
	androidsdk 'ndk;21.0.6113669'
2. ./build-go-lib # install gomobile
	go get golang.org/x/mobile/cmd/gomobile
	gomobile init
3. ./build-android-boost # install bjam
	copy local bjam
4. ./build-android-openssl
5. ./build-igniter
