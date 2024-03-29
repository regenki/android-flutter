fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android version

```sh
[bundle exec] fastlane android version
```

Update version

### android beta

```sh
[bundle exec] fastlane android beta
```

Submit a new Beta

### android deploy

```sh
[bundle exec] fastlane android deploy
```



### android increment_vc

```sh
[bundle exec] fastlane android increment_vc
```

Increment version code

### android deploy_internal

```sh
[bundle exec] fastlane android deploy_internal
```

Submit a new version to the internal track in the Google Play

### android release

```sh
[bundle exec] fastlane android release
```

Deploy a new version to the Google Play

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
