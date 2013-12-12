//
//  UIImageView+Gravatar.m
//
//  Created by Rex Finn on 12/10/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "UIImageView+Gravatar.h"

@interface UIImageView_Gravatar ()

@end

@implementation UIImageView_Gravatar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andPlaceholder:(UIImage*)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPlaceholder:placeholder];
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)setPlaceholder:(UIImage *)placeholder {
    _placeholder = placeholder;
    self.image = placeholder;
}

- (void)loadGravatar {
    [self setImageWithURL:[self gravatarURL:_email] placeholderImage:_placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        if (!error) {
            NSLog(@"[%@] Reached Gravatar Image for %@ at %@.\nNote: this does not mean that this email has a gravatar associated with it.",[self class],_email,[self gravatarURL:_email]);
        }
        else {
            NSLog(@"[%@] Unable to reach Gravatar Image for %@ at %@.",[self class],_email,[self gravatarURL:_email]);
        }
    }];
}

- (void)loadGravatar:(void (^)(void))completed {
    [self setImageWithURL:[self gravatarURL:_email] placeholderImage:_placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        completed();
        
        if (!error) {
            NSLog(@"[%@] Reached Gravatar Image for %@ at %@.\nNote: this does not mean that this email has a gravatar associated with it.",[self class],_email,[self gravatarURL:_email]);
        }
        else {
            NSLog(@"[%@] Unable to reach Gravatar Image for %@ at %@.",[self class],_email,[self gravatarURL:_email]);
        }
    }];
}

- (void)refreshGravatar {
    [self loadGravatar];
}

- (NSURL*)gravatarURL:(NSString*)email {
    NSMutableString *gravatarPath = [NSMutableString stringWithFormat:@"http://gravatar.com/avatar/%@?", [self createMD5:email]];
    
    return [NSURL URLWithString:[self buildLink:gravatarPath]];
}

- (void)forceDefault:(BOOL)forceDefault withDefaultGravatar:(DefaultGravatars)gravatar {
    _forceDefault = forceDefault;
    _defaultGravatar = gravatar;
}

- (NSMutableString*)buildLink:(NSMutableString*)baseLink {
    if (_size) {
        [baseLink appendString:[NSString stringWithFormat:@"&size=%d",_size]];
    }
    
    if (_rating) {
        switch (_rating) {
            case GravatarRatingG:
                [baseLink appendString:@"&rating=g"];
                break;
            case GravatarRatingPG:
                [baseLink appendString:@"&rating=pg"];
                break;
            case GravatarRatingR:
                [baseLink appendString:@"&rating=r"];
                break;
            case GravatarRatingX:
                [baseLink appendString:@"&rating=x"];
                break;
                
            default:
                break;
        }
    }
    
    if (_defaultGravatar) {
        switch (_defaultGravatar) {
            case DefaultGravatar404:
                [baseLink appendString:@"&default=404"];
                break;
            case DefaultGravatarMysteryMan:
                [baseLink appendString:@"&default=mm"];
                break;
            case DefaultGravatarIdenticon:
                [baseLink appendString:@"&default=identicon"];
                break;
            case DefaultGravatarMonsterID:
                [baseLink appendString:@"&default=monsterid"];
                break;
            case DefaultGravatarWavatar:
                [baseLink appendString:@"&default=wavatar"];
                break;
            case DefaultGravatarRetro:
                [baseLink appendString:@"&default=retro"];
                break;
            case DefaultGravatarBlank:
                [baseLink appendString:@"&default=blank"];
                break;
                
            default:
                break;
        }
    }
    
    if (_forceDefault) {
        [baseLink appendString:@"&forcedefault=y"];
    }
    
    return baseLink;
}

- (NSString*)createMD5:(NSString *)email {
    const char *cStr = [_email UTF8String];
    unsigned char digest[16];
    
    CC_MD5(cStr, strlen(cStr), digest);
    
    NSMutableString *emailMD5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [emailMD5 appendFormat:@"%02x", digest[i]];
    }
    
    return  emailMD5;
}

@end
