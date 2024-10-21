# Calculator
![Screenshot1](Assets/C944A545-46E3-4C22-A130-056469E9ECBC_1_105_c.jpeg "Screenshot1")

![Screenshot2](Assets/BB1692B8-8864-4B59-93E0-57B8AEFF4450_1_105_c.jpeg "Screenshot2")

![Screenshot3](Assets/B03AC0C3-0740-4191-9BED-0053F72EC8C8_4_5005_c.jpeg "Screenshot3")

![Screenshot4](Assets/C88603C5-FC2B-4319-AF90-B2F2276A4D31_4_5005_c.jpeg "Screenshot4")

![Screenshot5](Assets/IMG_0971D9CD8C2F-1.jpeg "Screenshot5")

## Feature

Long expression parse

Support multiple brackets

Support Basic elementary functions

Get the value of a parametric expression

SwiftUI interface

Haptic feedback on keyboard

Calculation history

Darw function graph

## Build 
Build with Xcode (You may need Xcode Version 16.0 (16A242d) or above to build).

For systems other than macOS, you can build a standalone console Calculator app. Navigate to `/Calculator/CoreCalculator`, and build with CMake. 

Note that if your're using gcc on Windows, you may encounter the problem that the programme cannot properly parse your expression.

## Calculator Architecture Overview
The UI is written taking the advantage of SwiftUI. 

The core calculation function is written with C.

Use C++ String to wrap C Style char arries, so that the Calculation function can better communicate with the GUI.
