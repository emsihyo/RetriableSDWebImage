//
//  UIButton+RetriableSDWebImage.m
//  RetriableSDWebImage
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//
#import "UIButton+RetriableSDWebImage.h"

#if SD_UIKIT

#import <objc/runtime.h>

static char imageURLStorageKey;

typedef NSMutableDictionary<NSString *, NSURL *> SDStateImageURLDictionary;

static inline NSString * imageURLKeyForState(UIControlState state) {
    return [NSString stringWithFormat:@"image_%lu", (unsigned long)state];
}

static inline NSString * backgroundImageURLKeyForState(UIControlState state) {
    return [NSString stringWithFormat:@"backgroundImage_%lu", (unsigned long)state];
}

static inline NSString * imageOperationKeyForState(UIControlState state) {
    return [NSString stringWithFormat:@"UIButtonImageOperation%lu", (unsigned long)state];
}

static inline NSString * backgroundImageOperationKeyForState(UIControlState state) {
    return [NSString stringWithFormat:@"UIButtonBackgroundImageOperation%lu", (unsigned long)state];
}

@implementation UIButton (RetriableSDWebImage)

- (void)sd_setImageWithURL:(NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(UIImage *)placeholder
                   options:(SDWebImageOptions)options
                 completed:(SDExternalCompletionBlock)completedBlock
                retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    if (!url) {
        [self.sd_imageURLStorage removeObjectForKey:imageURLKeyForState(state)];
    } else {
        self.sd_imageURLStorage[imageURLKeyForState(state)] = url;
    }
    __weak typeof(self) weakSelf=self;
    [self sd_internalSetImageWithURL:url placeholderImage:placeholder options:options operationKey:imageOperationKeyForState(state) setImageBlock:^(UIImage * image, NSData * imageData) {
        [weakSelf setImage:image forState:state];
    } progress:nil completed:completedBlock context:nil retryAfter:retryAfter];
}

- (void)sd_setBackgroundImageWithURL:(NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(UIImage *)placeholder
                             options:(SDWebImageOptions)options
                           completed:(SDExternalCompletionBlock)completedBlock
                          retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    if (!url) {
        [self.sd_imageURLStorage removeObjectForKey:backgroundImageURLKeyForState(state)];
    } else {
        self.sd_imageURLStorage[backgroundImageURLKeyForState(state)] = url;
    }
    __weak typeof(self) weakSelf=self;
    [self sd_internalSetImageWithURL:url placeholderImage:placeholder options:options operationKey:backgroundImageOperationKeyForState(state) setImageBlock:^(UIImage * image, NSData * imageData) {
        [weakSelf setBackgroundImage:image forState:state];
    } progress:nil completed:completedBlock context:nil retryAfter:retryAfter];
}

- (SDStateImageURLDictionary *)sd_imageURLStorage {
    SDStateImageURLDictionary *storage = objc_getAssociatedObject(self, &imageURLStorageKey);
    if (!storage) {
        storage = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &imageURLStorageKey, storage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return storage;
}

@end

#endif
