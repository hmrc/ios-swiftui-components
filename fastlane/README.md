fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios sync_certificates
```
fastlane ios sync_certificates
```
This will sync adhoc certificates to allow the companion app to build on CI
### ios build_adhoc_app
```
fastlane ios build_adhoc_app
```
Build adhoc app for testing
### ios register_new_device
```
fastlane ios register_new_device
```
Register new devices
### ios generate_screenshots
```
fastlane ios generate_screenshots
```
Generate component screenshots using companion app

Using xcodebuild over scan because it does not allow us to specify the exact simulator to use as it overrides the `-destination` flag we need to set

Example:

 `fastlane generate_screenshots device:'iPhone XS Max' version:'latest'`

Options:

 - device: (Required) Simulator to run the tests on

 - version: (Optional) iOS version of the Simulator

 - force_dark_mode: (Optional)
### ios screenshot_diff
```
fastlane ios screenshot_diff
```
Find differences between baseline screenshots and locally generated screenshots.

Make sure you completely run the IntegrationTests target against iPhone 11 Max to generate a complete set of screenshots.

Once you have a full set of screenshots, you can rerun individual tests to update individual screenshots.

Example:

 `fastlane screenshot_diff`
### ios take_release
```
fastlane ios take_release
```
Create a new tagged release of the library.

This will bump the release tag, precompile the library, commit and tag the changes, then push up to master.

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
