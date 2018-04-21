//
//  UIImageView+RetriableSDWebImage.h
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <SDWebImage/SDWebImageCompat.h>

#if SD_UIKIT || SD_MAC

#import <SDWebImage/UIImageView+HighlightedWebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "UIView+RetriableSDWebImage.h"

@interface UIImageView (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(SDExternalCompletionBlock)completedBlock retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;
#if SD_MAC
#else

- (void)sd_setHighlightedImageWithURL:(NSURL *)url
                              options:(SDWebImageOptions)options
                             progress:(SDWebImageDownloaderProgressBlock)progressBlock
                            completed:(SDExternalCompletionBlock)completedBlock retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;
#endif

@end

#endif
