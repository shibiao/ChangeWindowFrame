//
//  RedView.m
//  ChangeWindowFrame
//
//  Created by ZhangWeichen on 2017/5/11.
//  Copyright © 2017年 Avcon. All rights reserved.
//

#import "RedView.h"

@implementation RedView

static RedView *view = nil;
+(RedView *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[self alloc]init];
    });
    return view;
}
-(instancetype)initWithFrame:(NSRect)frameRect{

    self = [super initWithFrame:frameRect];
    if (self) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor redColor].CGColor;
    }
    return self;
}


@end
