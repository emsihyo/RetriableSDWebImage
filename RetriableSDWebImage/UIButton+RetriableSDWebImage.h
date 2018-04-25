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

- (void)sd_setImageWithURL:(NSURL * _Nullable)url
                  forState:(UIControlState)state
          placeholderImage:(UIImage * _Nullable)placeholder
                   options:(SDWebImageOptions)options
                 completed:(SDExternalCompletionBlock _Nullable)completedBlock
                retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;

- (void)sd_setBackgroundImageWithURL:(NSURL * _Nullable)url
                            forState:(UIControlState)state
                    placeholderImage:(UIImage * _Nullable)placeholder
                             options:(SDWebImageOptions)options
                           completed:(SDExternalCompletionBlock _Nullable)completedBlock
                          retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;

@end

#endif
