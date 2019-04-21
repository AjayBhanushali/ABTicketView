# ABTicketView
> Create complex Ticket/Coupon Design using Simple library for real

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

![Alt Text](https://media.giphy.com/media/YPJfbd6HsGOTanUKwd/giphy.gif)

## Features

- [x] Easy to integrate using IBDesignables
- [x] Customisable circle radius, cutting depth and sides
- [x] Simple AF

## Requirements

- iOS 11.0+
- Xcode 10.0
- Swift 4.0+

## Installation
For tutorial [click here](https://medium.com/@ajayrbhanushali/ios-create-ticket-view-coupon-view-in-swift-4-using-abticketview-ec7a69366c66)

#### CocoaPods
You can use [CocoaPods](https://cocoapods.org/pods/ABTicketView) to install `ABTicketView` by adding it to your `Podfile`:

```ruby
platform :ios, '12.0'
use_frameworks!
pod 'ABTicketView'
```
## Usage example

```swift
import ABTicketView

//Create an IBOutlet from Storyboard of UIView
@IBOutlet weak var myTicketView: ABTicketView!

// To change needle value
myTicketView.circleDiameter = 20
myTicketView.cuttingDepth = 20
myTicketView.ticketColor = UIColor.blue
```

## Contribute

We would love you for the contribution to **ABTicketView**, check the ``LICENSE`` file for more info.

## Meta

Ajay Bhanushali – [LinkedIn](https://www.linkedin.com/in/ajaybhanushali/) – ajayrbhanushali@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[GitHub](https://github.com/AjayBhanushali)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com


