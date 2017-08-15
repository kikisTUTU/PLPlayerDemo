//
//  HKPlayerView.h
//  PLPlayerDemo
//
//  Created by 贺凯 on 16/9/12.
//  Copyright © 2016年 贺凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKPlayerView : UIView
/** 开始播放按钮 */
@property (nonatomic, strong) UIButton                *startBtn;
/** 全屏按钮 */
@property (nonatomic, strong) UIButton                *fullScreenBtn;
/** 系统菊花 */
@property (nonatomic, strong) UIActivityIndicatorView *activity;
/** 快进快退label */
@property (nonatomic, strong) UILabel                 *horizontalLabel;
/** 返回按钮*/
@property (nonatomic, strong) UIButton                *backBtn;
/** 锁定屏幕方向按钮 */
@property (nonatomic, strong) UIButton                *lockBtn;
/** bottomView*/
@property (nonatomic, strong) UIImageView             *bottomImageView;
/** topView */
@property (nonatomic, strong) UIImageView             *topImageView;
/** 播放按钮 */
@property (nonatomic, strong) UIButton                *playeBtn;
/** 重置ControlView */
- (void)resetControlView;
/** 切换分辨率时候调用此方法*/
- (void)resetControlViewForResolution;
/** 显示top、bottom、lockBtn*/
- (void)showControlView;
/** 隐藏top、bottom、lockBtn*/
- (void)hideControlView;
@end
