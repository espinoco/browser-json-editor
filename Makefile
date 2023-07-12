mozilla:
	rm -rf ./build-mozilla
	mkdir -p ./build-mozilla
	cp -r ./src/* ./build-mozilla/
	cp ./manifest-mozilla.json ./build-mozilla/manifest.json

chromium:
	rm -rf ./build-chromium
	mkdir -p ./build-chromium
	cp -r ./src/* ./build-chromium/
	cp ./manifest-chromium.json ./build-chromium/manifest.json

package: mozilla chromium
	rm -rf ./package
	mkdir -p ./package
	zip -r ./package/browser-json-editor-mozilla-$$(cat ./build-mozilla/manifest.json | grep -o '"version": ".*"' | grep -o '\d\.\d').zip ./build-mozilla/*
	zip -r ./package/browser-json-editor-chromium-$$(cat ./build-chromium/manifest.json | grep -o '"version": ".*"' | grep -o '\d\.\d').zip ./build-chromium/*
