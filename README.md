UIImageView+Gravatar
====================

A simple and quickly put together UIImageView subclass for dealing with http://gravatar.com images.

##Installation

### Installation with CocoaPods (hasn't been added yet)

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like UIImageView+Gravatar in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod "UIImageView-Gravatar", "~> 1.0"
```

### Installation without CocoaPods

Just drag the UIImageView+Gravatar folder into your project and import it.  You'll also have to download SDWebImage, which you can grab here: [SDWebImage repository](https://github.com/rs/SDWebImage).

```
#import 'UIImageView+Gravatar.h'
// Don't worry about importing SDWebImage
```

## Use

UIImageView+Gravatar is pretty easy to use.  See this example implementation (copy/paste from demo project).

```obj-c
_imageView = [[UIImageView_Gravatar alloc] initWithFrame:self.view.bounds];
[_imageView setEmail:@"rexcfinn@gmail.com"];
[_imageView setSize:1024];
    
[self.view addSubview:_imageView];
    
[_imageView loadGravatar];
```

See [UIImageView+Gravatar.h](UIImageView+Gravatar/UIImageView+Gravatar.h) to view each available method and the variables - I've commented on everything you need (I think).  For more information on the Gravatar image requests, see [here](https://en.gravatar.com/site/implement/images).

Hope you enjoy it!  Please Fork and send Pull Requests!

##Methods and Variables

```obj-c
// I suppose you could use an NSDictionary for this, but I was lazy - feel free to add.

// User email - you must set this!
@property (readwrite, strong, nonatomic) NSString *email;

// A placeholder image while SDWebImage fetches the gravatar.
@property (readwrite, strong, nonatomic) UIImage *placeholder;

// The size of the gravatar up to 2048. All gravatars are squares, so you will get 2048x2048.
@property (readwrite, nonatomic) NSUInteger size;

// Rating (G, PG, R, X) of gravatar to allow, helpful for kid-friendly apps.
@property (readwrite, nonatomic) GravatarRatings rating;

// If email doesn't have a gravatar, use one of these... http://bit.ly/1cCmtdb
@property (readwrite, nonatomic) DefaultGravatars defaultGravatar;

// Force a default gravatar, whether or not email has gravatar. Remember to set defaultGravatar too!
@property (readwrite, nonatomic) BOOL forceDefault;

// Another option to init with a placeholder, so you don't have to do [_imageView setPlaceholder:].
- (id)initWithFrame:(CGRect)frame andPlaceholder:(UIImage*)placeholder;

// A substitute to having to do [_imageView setForceDefault:YES]; and setting the default gravatar.
- (void)forceDefault:(BOOL)forceDefault withDefaultGravatar:(DefaultGravatars)gravatar;

// Actually loads the gravatar AFTER you have configured all of your options.
- (void)loadGravatar;

// Load gravatar with completion block
- (void)loadGravatar:(void (^)(void))completed;

// Refreshes the gravatar, you can set new paramters between loading it and refreshing it.
- (void)refreshGravatar;
```

##Screenshots

![UIImageView+Gravatar](http://i.imgur.com/yCvcY4M.pngg)

##License

The MIT License (MIT)

Copyright (c) 2013 Rudd Fawcett

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
