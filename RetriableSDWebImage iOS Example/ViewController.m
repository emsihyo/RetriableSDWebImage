//
//  ViewController.m
//  RetriableSDWebImage iOS Example
//
//  Created by emsihyo on 2018/4/20.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

@import Retriable;
@import RetriableSDWebImage;

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    [RetriableOperation setLogEnabled:YES];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png"] placeholderImage:nil options:0 progress:nil completed:nil retryAfter:^NSTimeInterval( NSInteger currentRetryTime, NSError *latestError) {
        if (![latestError.domain isEqualToString:NSURLErrorDomain]) return 0;
        switch (latestError.code) {
            case NSURLErrorTimedOut:
            case NSURLErrorNetworkConnectionLost:
            case NSURLErrorNotConnectedToInternet: return 2;
            default: return 0;
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
