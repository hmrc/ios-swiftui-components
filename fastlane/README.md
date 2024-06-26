fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios dev_certs

```sh
[bundle exec] fastlane ios dev_certs
```

This will sync development certificates to allow the companion app to build to local development devices

### ios sync_certificates

```sh
[bundle exec] fastlane ios sync_certificates
```

This will sync adhoc certificates to allow the companion app to build on CI

### ios regenerateDebugCerts

```sh
[bundle exec] fastlane ios regenerateDebugCerts
```



### ios regenerateAdhocCerts

```sh
[bundle exec] fastlane ios regenerateAdhocCerts
```



### ios build_adhoc_app

```sh
[bundle exec] fastlane ios build_adhoc_app
```

Build adhoc app for testing

### ios register_new_device

```sh
[bundle exec] fastlane ios register_new_device
```

Register new devices

### ios generate_screenshots

```sh
[bundle exec] fastlane ios generate_screenshots
```

Generate component screenshots using companion app

Using xcodebuild over scan because it does not allow us to specify the exact simulator to use as it overrides the `-destination` flag we need to set

Example:

 `fastlane generate_screenshots device:'iPhone XS Max' version:'latest'`

Options:

 - device: (Required) Simulator to run the tests on

 - version: (Optional) iOS version of the Simulator

 - force_dark_mode: (Optional)

### ios open_booted_sim

```sh
[bundle exec] fastlane ios open_booted_sim
```

Open and boot named simulator

Example:

`fastlane open_booted_sim device:'iPhone 11 Pro Max' version:'latest'`

Options:

 - device: (Required) Simulator to run the tests on

 - version: (Optional) iOS version of the Simulator

### ios screenshot_diff

```sh
[bundle exec] fastlane ios screenshot_diff
```

Find differences between baseline screenshots and locally generated screenshots.

Make sure you completely run the IntegrationTests target against iPhone 11 Max to generate a complete set of screenshots.

Once you have a full set of screenshots, you can rerun individual tests to update individual screenshots.

Example:

 `fastlane screenshot_diff`

### ios take_release

```sh
[bundle exec] fastlane ios take_release
```

Create a new tagged release of the library.

This will bump the release tag, precompile the library, commit and tag the changes, then push up to main.

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
