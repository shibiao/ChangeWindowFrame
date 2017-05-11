//
//  CustomWindowController.m
//  ChangeWindowFrame
//
//  Created by sycf_ios on 2017/5/11.
//  Copyright © 2017年 Avcon. All rights reserved.
//

#import "CustomWindowController.h"

@interface CustomWindowController ()

@end

@implementation CustomWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.backgroundColor = [NSColor clearColor];
    self.window.titlebarAppearsTransparent = YES;
    self.window.styleMask = NSWindowStyleMaskFullSizeContentView|NSWindowStyleMaskTitled|NSWindowStyleMaskResizable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskClosable;

    [self.window standardWindowButton:NSWindowCloseButton].hidden = YES;
    [self.window standardWindowButton:NSWindowMiniaturizeButton].hidden = YES;
    [self.window standardWindowButton:NSWindowZoomButton].hidden = YES;
}

@end
