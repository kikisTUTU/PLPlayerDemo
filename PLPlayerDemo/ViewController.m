//
//  ViewController.m
//  PLPlayerDemo
//
//  Created by 贺凯 on 16/8/26.
//  Copyright © 2016年 贺凯. All rights reserved.
//

#import "ViewController.h"
#import <PLPlayerKit/PLPlayer.h>
#import "Masonry.h"
#import "HKPlayerView.h"
#import "PlayerView.h"
#define enableBackgroundPlay    1
#define HEIGHT self.view.frame.size.height
#define WIDTH self.view.frame.size.width
#define NSLog(...) NSLog(@"%s %d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
static NSString *status[] = {
    @"PLPlayerStatusUnknow",
    @"PLPlayerStatusPreparing",
    @"PLPlayerStatusReady",
    @"PLPlayerStatusCaching",
    @"PLPlayerStatusPlaying",
    @"PLPlayerStatusPaused",
    @"PLPlayerStatusStopped",
    @"PLPlayerStatusError"
};
@interface ViewController ()<PLPlayerDelegate>
@property (nonatomic, strong)PLPlayer *player;
@property (nonatomic, strong)NSURL *URL;
@property (nonatomic, strong)HKPlayerView *hkView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createInit];
}
-(void)createInit{
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    [option setOptionValue:@10 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    self.URL = [NSURL URLWithString:@"http://live-shitou.kksmg.com/live/shitou/playlist.m3u8"];
    self.player = [PLPlayer playerWithURL:self.URL option:option];
    self.player.delegate = self;
    self.player.delegateQueue = dispatch_get_main_queue();
    self.player.backgroundPlayEnable = enableBackgroundPlay;
    self.player.playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.player.playerView];
    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        // 注意此处，宽高比16：9优先级比1000低就行，在因为iPhone 4S宽高比不是16：9
        make.height.equalTo(self.player.playerView.mas_width).multipliedBy(9.0f/16.0f).with.priority(750);
    }];
    self.hkView = [HKPlayerView new];
    [self.player.playerView addSubview:self.hkView];
    [self.hkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.player.playerView).offset(0);
        make.left.right.equalTo(self.player.playerView);
        // 注意此处，宽高比16：9优先级比1000低就行，在因为iPhone 4S宽高比不是16：9
        make.height.equalTo(self.hkView.mas_width).multipliedBy(9.0f/16.0f).with.priority(750);
    }];
    [self.player play];
    self.player.autoReconnectEnable = YES;
}
// 实现 <PLPlayerDelegate> 来控制流状态的变更
- (void)player:(nonnull PLPlayer *)player statusDidChange:(PLPlayerStatus)state {
    // 这里会返回流的各种状态，你可以根据状态做 UI 定制及各类其他业务操作
    // 除了 Error 状态，其他状态都会回调这个方法
    NSLog(@"%@", status[state]);
    if (state == PLPlayerStatusCaching) {
        [self.hkView.activity startAnimating];
    }else{
        [self.hkView.activity stopAnimating];
    }
    switch (state) {
        case PLPlayerStatusUnknow:
            
            break;
        case PLPlayerStatusPreparing:
            
            break;
        case PLPlayerStatusReady:
            
            break;
        case PLPlayerStatusCaching:
            NSLog(@"缓冲状态=== 调用play");
            break;
        case PLPlayerStatusPlaying:
            NSLog(@"正在播放");
            break;
        case PLPlayerStatusPaused:
            
            break;
        case PLPlayerStatusStopped:
            
            break;
        case PLPlayerStatusError:
            
            break;
        case PLPlayerStateAutoReconnecting:
            
            break;
        default:
            break;
    }
}
- (void)player:(nonnull PLPlayer *)player stoppedWithError:(nullable NSError *)error {
    // 当发生错误时，会回调这个方法
    NSLog(@"错误状态返回%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














