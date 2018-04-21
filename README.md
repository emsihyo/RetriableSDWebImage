[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/emsihyo/RetriableSDWebImage/master/LICENSE)
[![Build Status](http://img.shields.io/travis/emsihyo/RetriableSDWebImage/master.svg?style=flat)](https://travis-ci.org/emsihyo/RetriableSDWebImage)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/emsihyo/RetriableSDWebImage)
[![Pod Version](http://img.shields.io/cocoapods/v/RetriableSDWebImage.svg?style=flat)](http://cocoapods.org/pods/RetriableSDWebImage)
[![Pod Platform](http://img.shields.io/cocoapods/p/RetriableSDWebImage.svg?style=flat)](http://cocoapods.org/pods/RetriableSDWebImage)

# RetriableSDWebImage

Retriable SDWebImage

#### Cocoapods

Add the following to your project's Podfile:
```ruby
pod 'RetriableSDWebImage'
```

#### Carthage

Add the following to your project's Cartfile:
```ruby
github "emsihyo/RetriableSDWebImage"
```

#### Example

```objc
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png"] placeholderImage:nil options:0 progress:nil completed:nil retryAfter:^NSTimeInterval( NSInteger currentRetryTime, NSError *latestError) {
        if (![latestError.domain isEqualToString:NSURLErrorDomain]) return 0;
        switch (latestError.code) {
            case NSURLErrorTimedOut:
            case NSURLErrorNetworkConnectionLost:
            case NSURLErrorNotConnectedToInternet: return 5;
            default: return 0;
        }
    }];

```
