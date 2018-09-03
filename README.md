# Pre-work - *TipCalc* v1.0

**TipCalc** is a tip calculator application for iOS.

Submitted by: **Brian Casipit**

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [ ] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Bill with tip can be split between up to 6 individuals.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://raw.githubusercontent.com/motiveg/TipCalc/master/TipCalcDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Swift version 4.1

iOS Version 11.4

Layout currently only optimized for iPhone 5S and iPhone SE

Althought Swift shares similarities with other languages, working with it for the first time took a lot of patience (especially when jumping straight into app making as opposed to a console program). Some conventions in naming and syntax were also confusing since most of it was completely new (to me).

Most of the challenges were in the second screen of the app. There were many problems and challenges, many of which were fixed with trial and error because of the unfamiliar language. Some specific problems included: converting/casting, ordering/logic for desired results, and finding solutions for some UI problems. One particular UI problem was the keyboard, which covered fields on the lower half of the screen. A couple of Youtube videos from Paul Solt gave a good start on solving this problem:
https://www.youtube.com/watch?v=xVZubAMFuIU
https://www.youtube.com/watch?v=iUQ1GfiVzS0
The problem isn't completely solved but the above solution helped a great deal.

I still wish to make fixes/improvements to this project after learning more about Swift because I can make good use of this app.

## License

    Copyright [2018] [Brian Casipit]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
