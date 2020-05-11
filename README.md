# LinearProgressBar
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/MaterialProgressBar.svg)](https://cocoapods.org/pods/MaterialProgressBar)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)

Material Linear Progress Bar for your iOS apps

![Demo](https://i.imgur.com/dqFadki.gif)

## Installation
### Carthage:
```
github "Recouse/LinearProgressBar"
```

### CocoaPods:
Add this to your `Podfile`
```
pod 'MaterialProgressBar'
```

## Requirements
- iOS 10.0+
- Xcode 11.0+
- Swift 5.0+

## Usage
```swift
import LinearProgressBar

let progressBar = LinearProgressBar()
...
view.addSubview(progressBar)
progressBar.startAnimating()
```

You can use it like activity indicator in `UIViewController`:
```swift
// Start animating
showProgressBar()

// Stop animating
hideProgressBar()
```

## Contribution
Feel free to make pull requests
