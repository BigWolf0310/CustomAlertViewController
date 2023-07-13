//
//  ViewController.m
//  CustomAlertViewController
//
//  Created by mac on 2023/7/12.
//

#import "ViewController.h"

#import "AlertActionView.h"
#import "AlertView.h"
#import "LoginStyleModel.h"

@interface ViewController ()

// AlertView
@property (nonatomic, strong) AlertView *alertV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSubViews];
    
}

- (void)createSubViews
{
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    actionBtn.frame = CGRectMake(50, [DeviceInfoTool vg_navigationFullHeight], 150, 50);
    [actionBtn setTitle:@"底部弹窗不带图标" forState:UIControlStateNormal];
    [actionBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    actionBtn.tag = 10001;
    [actionBtn addTarget:self action:@selector(showAlertBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn];
    
    UIButton *actionBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    actionBtn1.frame = CGRectMake(50, [DeviceInfoTool vg_navigationFullHeight] + 100, 150, 50);
    [actionBtn1 setTitle:@"底部弹窗带图标" forState:UIControlStateNormal];
    [actionBtn1 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    actionBtn1.tag = 10002;
    [actionBtn1 addTarget:self action:@selector(showAlertBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn1];
    
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    alertBtn.frame = CGRectMake(50, [DeviceInfoTool vg_navigationFullHeight] + 200, 150, 50);
    [alertBtn setTitle:@"中心弹窗" forState:UIControlStateNormal];
    [alertBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    alertBtn.tag = 10003;
    [alertBtn addTarget:self action:@selector(showAlertBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertBtn];
}

- (void)showAlertBtnAction:(UIButton *)btn
{
    NSInteger tag = btn.tag;
    if(tag == 10001) {
        AlertActionView *alertView = [[AlertActionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) titleAry:@[@"拍照", @"相册"] type:1];
        [ApplicationKeyWindow addSubview:alertView];
        [alertView show];
    } else if (tag == 10002) {
        LoginStyleModel *pModel = [[LoginStyleModel alloc] initWithImageName:@"朋友圈" title:@"分享微信朋友圈"];// 账号密码
        LoginStyleModel *wModel = [[LoginStyleModel alloc] initWithImageName:@"微信好友" title:@"分享微信"];// 微信
        AlertActionView *alertView = [[AlertActionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) titleAry:@[wModel,pModel] type:2];
        [ApplicationKeyWindow addSubview:alertView];
        [alertView show];
    } else if (tag == 10003) {
        AlertView *alertV = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) content:@"定位获取失败，请前往设置页打开定位功能!" btnCount:2 leftTitle:@"取消" rightTitle:@"去设置" isHide:YES];
        self.alertV = alertV;
        [UIView animateWithDuration:.2f animations:^{
            alertV.alpha = 1;
        }];
        alertV.BtnClickBlock = ^(NSInteger tag, BOOL isHide) {
            [self removeAlertView:tag isHide:isHide];
        };
        [ApplicationKeyWindow addSubview:alertV];
    }
}




#pragma mark - 移除规则提示框
- (void)removeAlertView:(NSInteger)tag isHide:(BOOL)isHide
{
    if (tag == 3002) { // 去设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        // 设备系统为IOS 10.0或者以上的
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:settingsURL options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
            [[UIApplication sharedApplication] openURL:settingsURL];
        }
    }
    if (isHide) { // 隐藏
        [UIView animateWithDuration:.2f animations:^{
            self.alertV.alpha = 0;
        } completion:^(BOOL finished) {
            if (finished) {
                if (self.alertV) {
                    [self.alertV removeFromSuperview];
                    self.alertV = nil;
                }
            }
        }];
    }
}


@end
