//
//  RetriableSDWebImageResponse.m
//  RetriableSDWebImage
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import "RetriableSDWebImageResponse.h"

@interface RetriableSDWebImageResponse()

@property (nonatomic,strong) UIImage          *image;
@property (nonatomic,assign) SDImageCacheType cacheType;
@property (nonatomic,strong) NSURL            *imageURL;
@property (nonatomic,strong) NSData           *data;
@property (nonatomic,assign) BOOL             finished;
@end

@implementation RetriableSDWebImageResponse

- (instancetype)initWithImage:(UIImage*)image cacheType:(SDImageCacheType)cacheType imageURL:(NSURL *)imageURL data:(NSData*)data finished:(BOOL)finished{
    self=[self init];
    if (!self) return nil;
    self.image=image;
    self.cacheType=cacheType;
    self.imageURL=imageURL;
    self.data=data;
    self.finished=finished;
    return self;
}

@end
