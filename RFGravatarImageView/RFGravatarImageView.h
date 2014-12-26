// RFGravatarImageView.h
//
// Copyright (c) 2013-2015 Rudd Fawcett (http://ruddfawcett.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <AvailabilityMacros.h>

/**
 *  The rating for the gravatar.
 */
typedef NS_ENUM(NSUInteger, RFGravatarRating) {
    RFGravatarRatingAny,
    /**
     *  A Gravatar rating of G can be displayed.
     */
    RFGravatarRatingG,
    /**
     *  A Gravatar rating of PG can be displayed.
     */
    RFGravatarRatingPG,
    /**
     *  A Gravatar rating of R can be displayed.
     */
    RFGravatarRatingR,
    /**
     *  A Gravatar rating of X can be displayed.
     */
    RFGravatarRatingX
};

/**
 *  Default Gravatar types: http://bit.ly/1cCmtdb
 */
typedef NS_ENUM(NSUInteger, RFDefaultGravatar) {
    /**
     *  No default Gravatar.
     */
    RFDefaultGravatarNone,
    /**
     *  404 Gravatar.
     */
    RFDefaultGravatar404,
    /**
     *  Myster Man Gravatar.
     */
    RFDefaultGravatarMysteryMan,
    /**
     *  Identicon Gravatar.
     */
    RFDefaultGravatarIdenticon,
    /**
     *  Monster ID Gravatar.
     */
    RFDefaultGravatarMonsterID,
    /**
     *  Wavatar Gravatar.
     */
    RFDefaultGravatarWavatar,
    /**
     *  Retro Gravatar
     */
    RFDefaultGravatarRetro,
    /**
     *  Blank Gravatar.
     */
    RFDefaultGravatarBlank
};


@interface RFGravatarImageView : UIImageView

/**
 *  User email - you must set this!
 */
@property (readwrite, strong, nonatomic) NSString *email;

/**
 *  A placeholder image while SDWebImage fetches the gravatar.
 */
@property (readwrite, strong, nonatomic) UIImage *placeholder;

/**
 *  The size of the gravatar up to 2048. All gravatars are squares, so you will get 2048x2048.
 */
@property (readwrite, nonatomic) NSUInteger size;

/**
 *  Rating (G, PG, R, X) of gravatar to allow, helpful for kid-friendly apps.
 */
@property (readwrite, nonatomic) RFGravatarRating rating;

/**
 *  If email doesn't have a gravatar, use one of these... http://bit.ly/1cCmtdb
 */
@property (readwrite, nonatomic) RFDefaultGravatar defaultGravatar;

/**
 *  Forces a default gravatar, whether or not email has gravatar.  Remember to set defaultGravatar too!
 */
@property (readwrite, nonatomic) BOOL forceDefault;

/**
 *  Another option to init with a placeholder, so you don't have to do [_imageView setPlaceholder:].
 *
 *  @param frame       The frame for the imageView.
 *  @param placeholder The placeholder image.
 *
 *  @return A Gravatar imageView.
 */
- (id)initWithFrame:(CGRect)frame andPlaceholder:(UIImage*)placeholder;

/**
 *  A substitute to having to do [_imageView setForceDefault:YES]; and setting the default gravatar.
 *
 *  @param forceDefault Whether or not it should force the default gravatar.
 *  @param gravatar     The type of default gravatar.
 */
- (void)forceDefault:(BOOL)forceDefault withDefaultGravatar:(RFDefaultGravatar)gravatar;

/**
 *  Loads the gravatar after the required properties have been set.
 */
- (void)loadGravatar DEPRECATED_MSG_ATTRIBUTE("Please use load instead");

/**
 *  Loads the gravatar after the required properties have been set.
 */
- (void)load;

/**
 *  Loads gravatar with completion block.
 *
 *  @param completed The completion block.
 */
- (void)loadGravatar:(void (^)(void))completed DEPRECATED_MSG_ATTRIBUTE("Please use load: instead.");

/**
 *  Loads gravatar with completion block.
 *
 *  @param completed The completion block.
 */
- (void)load:(void (^)(NSError *error))completed;

/**
 *  Refreshes the gravatar, you can set new paramters between loading it and refreshing it.
 */
- (void)refreshGravatar DEPRECATED_MSG_ATTRIBUTE("Please use refresh instead.");

/**
 *  Refreshes the gravatar, you can set new paramters between loading it and refreshing it.
 */
- (void)refresh;

@end
