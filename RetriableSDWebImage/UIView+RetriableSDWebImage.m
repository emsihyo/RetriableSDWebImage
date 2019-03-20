//
//  UIView+RetriableSDWebImage.m
//  RetriableSDWebImage iOS
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//
#import "UIView+RetriableSDWebImage.h"

#if SD_UIKIT || SD_MAC

#import <objc/runtime.h>
#import <Retriable/Retriable.h>

#import "RetriableSDWebImageResponse.h"

@interface UIView (_RetriableSDWebImage)
@property (readonly)NSMutableDictionary *retriable_sd_operations;
@end
@implementation UIView (_RetriableSDWebImage)
- (NSMutableDictionary*)retriable_sd_operations{
    id operations=objc_getAssociatedObject(self, @selector(retriable_sd_operations));
    if (operations) return operations;
    operations=[NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(retriable_sd_operations), operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return operations;
}
@end

@implementation UIView (RetriableSDWebImage)

- (void)sd_internalSetImageWithURL:(NSURL *)url
                  placeholderImage:(UIImage *)placeholder
                           options:(SDWebImageOptions)options
                      operationKey:(NSString *)operationKey
                     setImageBlock:(SDSetImageBlock)setImageBlock
                          progress:(SDWebImageDownloaderProgressBlock)progressBlock
                         completed:(SDExternalCompletionBlock)completedBlock
                           context:(NSDictionary<NSString *, id> *)context retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter {
    NSString *validOperationKey = operationKey ?: NSStringFromClass([self class]);
    [(RetriableOperation*)self.retriable_sd_operations[validOperationKey] cancel];
    __weak typeof(self) weakSelf=self;
    self.retriable_sd_operations[validOperationKey]=[[RetriableOperation alloc]initWithCompletion:^(RetriableSDWebImageResponse* response, NSError *latestError) {
        if (completedBlock) completedBlock(response.image,latestError,response.cacheType,response.imageURL);
    } retryAfter:retryAfter start:^(void (^callback)(RetriableSDWebImageResponse * response, NSError *error)) {
        [weakSelf sd_internalSetImageWithURL:url placeholderImage:placeholder options:options operationKey:validOperationKey setImageBlock:setImageBlock progress:progressBlock completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType, NSURL * imageURL) {
            RetriableSDWebImageResponse *response=[[RetriableSDWebImageResponse alloc]initWithImage:image cacheType:cacheType imageURL:imageURL data:nil finished:YES];
            callback(response,error);
        } context:context];
    } cancel:^ {
        [weakSelf sd_cancelImageLoadOperationWithKey:validOperationKey];
    } cancelledErrorTemplates:nil];
    [(RetriableOperation*)self.retriable_sd_operations[validOperationKey] start];
}

@end

#endif
