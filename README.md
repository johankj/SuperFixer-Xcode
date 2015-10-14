# SuperFixer-Xcode

An Xcode plug-in for Swift projects, which adds calls to `super` in certains methods like `viewDidLoad` etc. The plugin was inspired by [this tweet](https://twitter.com/jakemarsh/status/651818475610968064) by @jakemarsh, and have been created by [@johankj](https://twitter.com/johankj).

## Installation

Clone the repo. Then build and run the Xcode project and the plug-in will automatically be installed in `~/Library/Application Support/Developer/Shared/Xcode/Plug-ins`. Relaunch Xcode.

```
$ git clone https://github.com/johankj/SuperFixer-Xcode.git
$ cd SuperFixer-Xcode
$ xcodebuild
```


## Usage

Just use autocompletion like you normally would.

Whenever you complete an autocomplete suggestion, the plugin will look through `Resources/SuperSubstitutions.plist` to find a match. If a match is found, the current autocomplete suggestion is replaced with the one defined in the plist.


## New Xcode releases

When a new version of Xcode is released the plug-in is disabled by Xcode.
If you want to enable it again you can run the following Terminal command. It writes the DVTPlugInCompatibilityUUID of the Xcode version in /Applications/Xcode.app into the Info.plist of this plug-in.
Feel free to submit a pull-request if a new Xcode version is out, and the plug-in still works.

```
$ find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/SuperFixer.xcplugin -name Info.plist | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`
```


## License

MIT License. See LICENSE.md for the full license.
