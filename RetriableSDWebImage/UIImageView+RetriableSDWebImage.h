//
//  UIImageView+RetriableSDWebImage.h
//  RetriableSDWebImage
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//

#import <SDWebImage/SDWebImageCompat.h>

#if SD_UIKIT || SD_MAC

#import <SDWebImage/UIImageView+HighlightedWebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "UIView+RetriableSDWebImage.h"

@interface UIImageView (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL * _Nullable)url
          placeholderImage:(UIImage * _Nullable)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                 completed:(SDExternalCompletionBlock _Nullable)completedBlock
                retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;
#if SD_MAC
#else

- (void)sd_setHighlightedImageWithURL:(NSURL * _Nullable)url
                              options:(SDWebImageOptions)options
                             progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                            completed:(SDExternalCompletionBlock _Nullable)completedBlock
                           retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;
#endif

@end

#endif
