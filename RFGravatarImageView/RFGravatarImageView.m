// RFGravatarImageView.m
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

#import "RFGravatarImageView.h"

@interface RFGravatarImageView ()

@end

@implementation RFGravatarImageView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andPlaceholder:(UIImage *)placeholder {
    if (self = [super initWithFrame:frame]) {
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
    [self load];
}

- (void)load {
    [self sd_setImageWithURL:[self gravatarURL:_email] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
}

- (void)loadGravatar:(void (^)(void))success {
    [self sd_setImageWithURL:[self gravatarURL:_email] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        success();
    }];
}

- (void)load:(void (^)(NSError *error))completion {
    [self sd_setImageWithURL:[self gravatarURL:_email] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        completion(error);
    }];
}

- (void)refreshGravatar {
    [self refresh];
}

- (void)refresh {
    [self load];
}

- (NSURL *)gravatarURL:(NSString *)email {
    NSMutableString *gravatarPath = [NSMutableString stringWithFormat:@"http://gravatar.com/avatar/%@?", [self createMD5:email]];
    
    return [NSURL URLWithString:[self buildLink:gravatarPath]];
}

- (void)forceDefault:(BOOL)forceDefault withDefaultGravatar:(RFDefaultGravatar)gravatar {
    _forceDefault = forceDefault;
    _defaultGravatar = gravatar;
}

- (NSMutableString *)buildLink:(NSMutableString *)baseLink {
    if (_size) {
        [baseLink appendString:[NSString stringWithFormat:@"&size=%lu",_size]];
    }
    
    if (_rating) {
        switch (_rating) {
            case RFGravatarRatingG:
                [baseLink appendString:@"&rating=g"];
                break;
            case RFGravatarRatingPG:
                [baseLink appendString:@"&rating=pg"];
                break;
            case RFGravatarRatingR:
                [baseLink appendString:@"&rating=r"];
                break;
            case RFGravatarRatingX:
                [baseLink appendString:@"&rating=x"];
                break;
                
            default:
                break;
        }
    }
    
    if (_defaultGravatar) {
        switch (_defaultGravatar) {
            case RFDefaultGravatar404:
                [baseLink appendString:@"&default=404"];
                break;
            case RFDefaultGravatarMysteryMan:
                [baseLink appendString:@"&default=mm"];
                break;
            case RFDefaultGravatarIdenticon:
                [baseLink appendString:@"&default=identicon"];
                break;
            case RFDefaultGravatarMonsterID:
                [baseLink appendString:@"&default=monsterid"];
                break;
            case RFDefaultGravatarWavatar:
                [baseLink appendString:@"&default=wavatar"];
                break;
            case RFDefaultGravatarRetro:
                [baseLink appendString:@"&default=retro"];
                break;
            case RFDefaultGravatarBlank:
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

- (NSString *)createMD5:(NSString *)email {
    const char *cStr = [_email UTF8String];
    unsigned char digest[16];
    
    CC_MD5(cStr, (int)strlen(cStr), digest);
    
    NSMutableString *emailMD5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [emailMD5 appendFormat:@"%02x", digest[i]];
    }
    
    return  emailMD5;
}

@end
