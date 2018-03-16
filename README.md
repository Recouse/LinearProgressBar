# LinearProgressBar
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)

Material Linear Progress Bar for your iOS apps

![Demo](https://downloader.disk.yandex.ru/disk/21ca24d13b128e9fd50e5899bec02d10ff53fc85d66ee7907dcd999eb42b82da/5aabf9cf/hDHGBVuXuRvYbyanDrrZELlrKlQO78nOrwEB3wkqgjXnD_gjkv7ZMrNpC8ZFM9lEHQyjaz1_Izngg4uj8uuVpA%3D%3D?uid=0&filename=LinearProgressBarAnimation.gif&disposition=inline&hash=&limit=0&content_type=image%2Fgif&fsize=45771&hid=78b85475af9f1b66a5cce590a72726ae&media_type=image&tknv=v2&etag=19d044a999520e0dd7e13ca9c3d20a7a)

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
