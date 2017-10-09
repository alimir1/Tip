# Tip

**Tip** is a tip calculator application for iOS.

## Features
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [x] Split between people
* [x] Customize default percentages depending on experiences (terrible, satisfactory, excellent)
* [x] Resets to defaults settings
* [x] Launch screen
* [x] UI/UX design (simple)
* [x] Clears all textFields and labels when bill is empty (or zero)

## Things to Improve
- Use AutoLayout to satisfy multiple screen sizes
- There should be a better way to handle SettingsViewController (instead of using a singleton)
- Perhaps modify Tip class and add another class to split responsibilities
- Display a warning to user before actually resetting to defaults
- Notify user (some how) when changing default values

## Video Walkthrough

<img src='http://i.imgur.com/iqtkAAE.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

Copyright 2017 Ali Mir

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
