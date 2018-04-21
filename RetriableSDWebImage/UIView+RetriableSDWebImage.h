//
//  UIView+RetriableSDWebImage.h
//  RetriableSDWebImage iOS
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <SDWebImage/SDWebImageCompat.h>

#if SD_UIKIT || SD_MAC

#import <SDWebImage/UIView+WebCache.h>
#import <SDWebImage/UIView+WebCacheOperation.h>

@interface UIView (RetriableSDWebImage)

- (void)sd_internalSetImageWithURL:(NSURL *)url
                  placeholderImage:(UIImage *)placeholder
                           options:(SDWebImageOptions)options
                      operationKey:(NSString *)operationKey
                     setImageBlock:(SDSetImageBlock)setImageBlock
                          progress:(SDWebImageDownloaderProgressBlock)progressBlock
                         completed:(SDExternalCompletionBlock)completedBlock
                           context:(NSDictionary<NSString *, id> *)context
                        retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;
    
@end

#endif
