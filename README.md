# LinearProgressBar
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)

Material Linear Progress Bar for your iOS apps

![Demo](https://i.imgur.com/FVarcz7.gif)

## Installation
### Carthage:
```
github "Recouse/LinearProgressBar"
```

## Requirements
- iOS 8.0+
- Xcode 9.0+
- Swift 3.2+

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
