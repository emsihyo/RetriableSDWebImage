//
//  SDWebImageManager+Retriable.h
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <SDWebImage/SDWebImageManager.h>
#import <Retriable/Retriable.h>

@interface SDWebImageManager (Retriable)

- (RetriableOperation*)loadImageWithURL:(NSURL *)url
                                options:(SDWebImageOptions)options
                               progress:(SDWebImageDownloaderProgressBlock)progressBlock
                              completed:(SDInternalCompletionBlock)completedBlock
                             retryAfter:(NSTimeInterval(^)(NSInteger currentRetryTime,NSError *latestError))retryAfter;

@end
