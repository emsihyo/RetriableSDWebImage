//
//  NSButton+RetriableSDWebImage.h
//  RetriableSDWebImage macOS
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//
#import <SDWebImage/SDWebImageCompat.h>

#if SD_MAC

#import <SDWebImage/NSButton+WebCache.h>
#import "UIView+RetriableSDWebImage.h"

@interface NSButton (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(SDExternalCompletionBlock)completedBlock
                retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;

- (void)sd_setAlternateImageWithURL:(NSURL *)url
                   placeholderImage:(UIImage *)placeholder
                            options:(SDWebImageOptions)options
                           progress:(SDWebImageDownloaderProgressBlock)progressBlock
                          completed:(SDExternalCompletionBlock)completedBlock
                         retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;

@end

#endif
