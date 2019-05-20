//
//  NSButton+RetriableSDWebImage.h
//  RetriableSDWebImage macOS
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//
#import <SDWebImage/SDWebImageCompat.h>

#if SD_MAC

#import <SDWebImage/NSButton+WebCache.h>
#import "UIView+RetriableSDWebImage.h"

@interface NSButton (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL * _Nullable)url
          placeholderImage:(UIImage * _Nullable)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                 completed:(SDExternalCompletionBlock _Nullable)completedBlock
                retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;

- (void)sd_setAlternateImageWithURL:(NSURL * _Nullable)url
                   placeholderImage:(UIImage * _Nullable)placeholder
                            options:(SDWebImageOptions)options
                           progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                          completed:(SDExternalCompletionBlock _Nullable)completedBlock
                         retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;

@end

#endif
