RFGravatarImageView<br /> [![RFGravatarImageView Version](http://img.shields.io/cocoapods/v/RFGravatarImageView.svg?style=flat)](http://cocoadocs.org/docsets/RFGravatarImageView/1.1/) ![License MIT](http://img.shields.io/badge/license-MIT-orange.svg?style=flat) ![reposs](https://reposs.herokuapp.com/?path=ruddfawcett/RFGravatarImageView&style=flat)
====================

A simple UIImageView subclass for dealing with http://gravatar.com images.

##Installation

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like RFGravatarImageView in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod "RFGravatarImageView", "~> 1.1"
```

### Installation without CocoaPods

Just drag the `RFGravatarImageView` folder into your project and import it.  You'll also have to download [SDWebImage](https://github.com/rs/SDWebImage).

```obj-c
#import 'RFGravatarImageView.h'
```

## Use

RFGravatarImageView is pretty easy to use.  See this example implementation (copy/paste from demo project).

```obj-c
_imageView = [[RFGravatarImageView alloc] initWithFrame:self.view.bounds];
_imageView.email = @"test@test.com";
_imageView.forceDefault = YES;
_imageView.defaultGravatar = RFDefaultGravatarMysteryMan;
_imageView.size = 1024;

[self.view addSubview:_imageView];

[_imageView load];
```

See [RFGravatarImageView.h](RFGravatarImageView/RFGravatarImageView.h) to view each available method and the variables - I've commented on everything you need (I think).  For more information on the Gravatar image requests, see [here](https://en.gravatar.com/site/implement/images).

Hope you enjoy it!  Please Fork and send Pull Requests!

##License

RFGravatarImageView is available under the MIT license. See the LICENSE file for more info.
