//
//  SDWebImageManager+Retriable.h
//  RetriableSDWebImage
//
//  Created by retriable on 2018/4/20.
//  Copyright © 2018年 retriable. All rights reserved.
//

#import <SDWebImage/SDWebImageManager.h>
#import <Retriable/Retriable.h>

@interface SDWebImageManager (Retriable)

- (RetriableOperation* _Nullable)loadImageWithURL:(NSURL *_Nullable)url
                                options:(SDWebImageOptions)options
                               progress:(SDImageLoaderProgressBlock _Nullable)progressBlock
                              completed:(SDInternalCompletionBlock _Nullable)completedBlock
                             retryAfter:(NSTimeInterval(^ _Nullable)(NSInteger currentRetryTime,NSError * _Nullable latestError))retryAfter;

@end
