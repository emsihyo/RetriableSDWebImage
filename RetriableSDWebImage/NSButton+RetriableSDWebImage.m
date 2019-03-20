//
//  NSButton+RetriableSDWebImage.m
//  RetriableSDWebImage macOS
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//
#import "NSButton+RetriableSDWebImage.h"

#if SD_MAC

#import <objc/runtime.h>

static inline NSString * imageOperationKey() {
    return @"NSButtonImageOperation";
}

static inline NSString * alternateImageOperationKey() {
    return @"NSButtonAlternateImageOperation";
}

@implementation NSButton (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(SDExternalCompletionBlock)completedBlock
                retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    self.sd_currentImageURL = url;
    
    __weak typeof(self)weakSelf = self;
    [self sd_internalSetImageWithURL:url
                    placeholderImage:placeholder
                             options:options
                        operationKey:imageOperationKey()
                       setImageBlock:^(NSImage * image, NSData * imageData) {
                           weakSelf.image = image;
                       }
                            progress:progressBlock
                           completed:completedBlock context:nil retryAfter:retryAfter];
}

- (void)sd_setAlternateImageWithURL:(NSURL *)url
                   placeholderImage:(UIImage *)placeholder
                            options:(SDWebImageOptions)options
                           progress:(SDWebImageDownloaderProgressBlock)progressBlock
                          completed:(SDExternalCompletionBlock)completedBlock
                         retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    self.sd_currentAlternateImageURL = url;
    
    __weak typeof(self)weakSelf = self;
    [self sd_internalSetImageWithURL:url
                    placeholderImage:placeholder
                             options:options
                        operationKey:alternateImageOperationKey()
                       setImageBlock:^(NSImage * image, NSData * imageData) {
                           weakSelf.alternateImage = image;
                       }
                            progress:progressBlock
                           completed:completedBlock context:nil retryAfter:retryAfter];
}

- (NSURL *)sd_currentImageURL {
    return objc_getAssociatedObject(self, @selector(sd_currentImageURL));
}

- (void)setSd_currentImageURL:(NSURL *)sd_currentImageURL {
    objc_setAssociatedObject(self, @selector(sd_currentImageURL), sd_currentImageURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)sd_currentAlternateImageURL {
    return objc_getAssociatedObject(self, @selector(sd_currentAlternateImageURL));
}

- (void)setSd_currentAlternateImageURL:(NSURL *)sd_currentAlternateImageURL {
    objc_setAssociatedObject(self, @selector(sd_currentAlternateImageURL), sd_currentAlternateImageURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#endif







