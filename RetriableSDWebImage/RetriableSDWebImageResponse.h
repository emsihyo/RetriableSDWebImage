//
//  RetriableSDWebImageResponse.h
//  RetriableSDWebImage
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/SDImageCache.h>

@interface RetriableSDWebImageResponse : NSObject

@property (readonly) UIImage          *image;
@property (readonly) SDImageCacheType cacheType;
@property (readonly) NSURL            *imageURL;
@property (readonly) NSData           *data;
@property (readonly) BOOL             finished;

- (instancetype)initWithImage:(UIImage*)image cacheType:(SDImageCacheType)cacheType imageURL:(NSURL *)imageURL data:(NSData*)data finished:(BOOL)finished;

@end
