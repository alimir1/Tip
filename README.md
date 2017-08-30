# Pre-work - *Tip*

**Tip** is a tip calculator application for iOS.

Submitted by: **Ali Mir**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
- [x] Split between people
- [x] Customize default percentages depending on experiences (terrible, satisfactory, excellent)
- [x] Resets to defaults settings
- [x] Launch screen
- [x] UI/UX design (simple)
- [x] Clears all textFields and labels when bill is empty (or zero)

## Things to Improve
- Use AutoLayout to satisfy multiple screen sizes
- There should be a better way to handle SettingsViewController (instead of using a singleton)
- Perhaps modify Tip class and add another class to split responsibilities
- Display a warning to user before actually resetting to defaults
- Notify user (some how) when changing default values

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/iqtkAAE.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**
I'm truly excited and feel satisfied with my progress. It’s very interesting how the source code for the Storyboard file is written in XML! I would describe actions and outlets to other developers as the following:
- Both outlets and actions connect code to the UI (buttons, labels, images, etc)
- Outlets connections are used for the appearance (color, opacity, position, etc)
- Actions are… well… actions. A block of code (ie the IBAction function) gets executed whenever someone - for example - clicks on a button (provided that the button is connected to code via IBAction)

Xcode makes it incredibly easy for the UI to communicate with code.

**Question 2**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**

Here's how I would summarize the concept:
1. Reference types can create strong reference cycles
2. Closures are reference types
3. Closures capture 'self' if 'self' is referred within its body
4. Therefore, a strong reference cycles can occur if you have a closure in a class

Bottom line: Strong reference cycles can be created when two reference type properties hold a strong references to each other. In this case, closures (reference type) + classes (reference type) => can create strong reference cycle

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
