//
//  SDWebImageManager+Retriable.m
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <objc/runtime.h>
#import <Retriable/Retriable.h>
#import "RetriableSDWebImageResponse.h"
#import "SDWebImageManager+Retriable.h"

@interface SDWebImageManager (_Retriable)
@property (readonly)NSOperationQueue *retriable_operationQueue;
@end

@implementation SDWebImageManager (_Retriable)

- (NSOperationQueue*)retriable_operationQueue{
    NSOperationQueue * queue= objc_getAssociatedObject(self, @selector(retriable_operationQueue));
    if (queue) return queue;
    queue=[[NSOperationQueue alloc]init];
    objc_setAssociatedObject(self, @selector(retriable_operationQueue), queue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return queue;
}

@end

@implementation SDWebImageManager (Retriable)

- (RetriableOperation*)loadImageWithURL:(NSURL *)url
                                options:(SDWebImageOptions)options
                               progress:(SDWebImageDownloaderProgressBlock)progressBlock
                              completed:(SDInternalCompletionBlock)completedBlock
                             retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter{
    __weak typeof(self) weakSelf=self;
    __block id <SDWebImageOperation> imageOperation;
    RetriableOperation *operation=[[RetriableOperation alloc]initWithCompletion:^(RetriableSDWebImageResponse * response, NSError *latestError) {
        if (completedBlock) completedBlock(response.image,response.data,latestError,response.cacheType,response.finished,response.imageURL);
    } retryAfter:retryAfter start:^(void (^callback)(id response, NSError *error)) {
        imageOperation=[weakSelf loadImageWithURL:url options:options progress:progressBlock completed:^(UIImage * image, NSData * data, NSError * error, SDImageCacheType cacheType, BOOL finished, NSURL * imageURL) {
            RetriableSDWebImageResponse *response=[[RetriableSDWebImageResponse alloc]initWithImage:image cacheType:cacheType imageURL:imageURL data:data finished:finished];
            callback(response,error);
        }];
    } cancel:^{
        [imageOperation cancel];
        imageOperation=nil;
    } cancelledErrorTemplates:nil];
    [self.retriable_operationQueue addOperation:operation];
    return operation;
}

@end
