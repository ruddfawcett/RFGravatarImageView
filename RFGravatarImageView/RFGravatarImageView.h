//
//  RFGravatarImageView.h
//
//  Created by Rudd Fawcett on 12/10/13.
//  Copyright (c) 2013 Rudd Fawcett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <SDWebImage/UIImageView+WebCache.h>

// Rating of Gravatar

enum {
    GravatarRatingAny,
    GravatarRatingG,
    GravatarRatingPG,
    GravatarRatingR,
    GravatarRatingX
};
typedef NSUInteger GravatarRatings;

// Default Gravatar types: http://bit.ly/1cCmtdb

enum {
    DefaultGravatarNone,
    DefaultGravatar404,
    DefaultGravatarMysteryMan,
    DefaultGravatarIdenticon,
    DefaultGravatarMonsterID,
    DefaultGravatarWavatar,
    DefaultGravatarRetro,
    DefaultGravatarBlank
};
typedef NSUInteger DefaultGravatars;

@interface RFGravatarImageView : UIImageView

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

@end
