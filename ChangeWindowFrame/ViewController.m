//
//  ViewController.m
//  ChangeWindowFrame
//
//  Created by ZhangWeichen on 2017/5/11.
//  Copyright © 2017年 Avcon. All rights reserved.
//

#import "ViewController.h"
#import "RedView.h"
#import "CustomWindowController.h"
@interface  ViewController ()

@property (nonatomic,strong) RedView *redView;

@property (nonatomic,strong) CustomWindowController *customWindowController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat x = (self.view.bounds.size.width - 100) / 2;
    CGFloat y = (self.view.bounds.size.height - 100);
    _redView = [[RedView alloc]initWithFrame:CGRectMake(x, y, 100, 100)];
    [self.view addSubview:_redView];
    
    //已经进入全屏
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DidEnterFull:) name:NSWindowDidEnterFullScreenNotification object:nil];
    
    //已经推出全屏
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didExitFull:) name:NSWindowDidExitFullScreenNotification object:nil];

}

-(void)DidEnterFull:(NSNotification *)info
{
    NSLog(@"-----------");
    
}
-(void)didExitFull:(NSNotification *)info
{
    NSLog(@"++++++++++++++");
    CGFloat x = (self.view.bounds.size.width - 100) / 2;
    CGFloat y = (self.view.bounds.size.height - 100);
    _redView.frame = CGRectMake(x, y, 100, 100);

    [self.customWindowController.window close];
    [self.view.window makeKeyAndOrderFront:nil];
    [self.view addSubview:_redView];
}

- (IBAction)bigView:(id)sender
{
    self.customWindowController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil]instantiateControllerWithIdentifier:@"customWindowController"];
    self.customWindowController.window.contentView = _redView;
    [self.customWindowController.window orderOut:nil];
    [self.customWindowController.window makeKeyAndOrderFront:nil];
    [self.customWindowController.window toggleFullScreen:nil];
}

@end
