# ColorSchemeToggleStyle

A custom SwiftUI `ToggleStyle` for a beautifully animated color scheme switch.

## Overview

`ColorSchemeToggleStyle` provides a visually appealing way to toggle between light and dark modes with smooth animations and custom shapes.

The goal was just to practice drawing in iOS with SwiftUI.

![Alt text](https://i.ibb.co/mbcFRV4/RPReplay-Final17196573202-ezgif-com-video-to-gif-converter.gif)

## Installation

### Swift Package Manager

You can install `ColorSchemeToggleStyle` using Swift Package Manager.

Add the `ColorSchemeToggleStyle` dependency to your target:
```swift
.target(
    name: "YourTargetName",
    dependencies: ["ColorSchemeToggleStyle"]
)
```

## Usage

### Importing

Import `ColorSchemeToggleStyle` in your SwiftUI view:
```swift
import ColorSchemeToggleStyle
```
### Applying the Custom Toggle Style

Use the `colorSchemeToggleStyle` in your `Toggle` view:
```swift
Toggle("Toggle Label", isOn: $isOn)
    .toggleStyle(.colorSchemeToggleStyle)
```
### Example

Here is a complete example of how to use `ColorSchemeToggleStyle`:
```swift
import SwiftUI
import ColorSchemeToggleStyle

struct ContentView: View {
    @State private var isOn = false

    var body: some View {
        VStack {
            Toggle("Toggle Label", isOn: $isOn)
                .toggleStyle(.colorSchemeToggleStyle)
                .padding()
        }
    }
}
```

## Additional

Find me on Linkedin for more Swift/UI content: 

https://www.linkedin.com/in/lidor-fadida/
