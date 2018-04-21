//
//  UIImageView+RetriableSDWebImage.m
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import "UIImageView+RetriableSDWebImage.h"

#if SD_UIKIT || SD_MAC

@implementation UIImageView (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(SDExternalCompletionBlock)completedBlock
                retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    [self sd_internalSetImageWithURL:url placeholderImage:placeholder options:options operationKey:nil setImageBlock:nil progress:progressBlock completed:completedBlock context:nil retryAfter:retryAfter];
}

#if SD_MAC
#else

- (void)sd_setHighlightedImageWithURL:(NSURL *)url
                              options:(SDWebImageOptions)options
                             progress:(SDWebImageDownloaderProgressBlock)progressBlock
                            completed:(SDExternalCompletionBlock)completedBlock
                           retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    __weak typeof(self)weakSelf = self;
    [self sd_internalSetImageWithURL:url placeholderImage:nil options:options operationKey:@"UIImageViewImageOperationHighlighted" setImageBlock:^(UIImage * image, NSData * imageData) {
        weakSelf.highlightedImage = image;
    } progress:progressBlock completed:completedBlock context:nil retryAfter:retryAfter];
}

#endif

@end

#endif
