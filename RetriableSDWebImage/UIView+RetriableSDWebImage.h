//
//  UIView+RetriableSDWebImage.h
//  RetriableSDWebImage iOS
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//

#import <SDWebImage/SDWebImageCompat.h>

#if SD_UIKIT || SD_MAC

#import <SDWebImage/UIView+WebCache.h>
#import <SDWebImage/UIView+WebCacheOperation.h>

@interface UIView (RetriableSDWebImage)

- (void)sd_internalSetImageWithURL:(NSURL * _Nullable)url
                  placeholderImage:(UIImage * _Nullable)placeholder
                           options:(SDWebImageOptions)options
                      operationKey:(NSString * _Nullable)operationKey
                     setImageBlock:(SDSetImageBlock _Nullable)setImageBlock
                          progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                         completed:(SDExternalCompletionBlock _Nullable)completedBlock
                           context:(NSDictionary<SDWebImageContextOption, id> * _Nullable)context
                        retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;
    
@end

#endif
