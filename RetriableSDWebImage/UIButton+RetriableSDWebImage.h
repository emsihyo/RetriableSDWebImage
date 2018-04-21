//
//  UIButton+RetriableSDWebImage.h
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//
#import <SDWebImage/SDWebImageCompat.h>

#if SD_UIKIT

#import <SDWebImage/UIButton+WebCache.h>

#import "UIView+RetriableSDWebImage.h"

@interface UIButton (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                 completed:(SDExternalCompletionBlock)completedBlock
                retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;

- (void)sd_setBackgroundImageWithURL:(NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(UIImage *)placeholder
                             options:(SDWebImageOptions)options
                           completed:(SDExternalCompletionBlock)completedBlock
                          retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;

@end

#endif
