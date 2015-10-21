//
//  LTPhoneLoginViewController.m
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPhoneLoginViewController.h"
#import "YPUserLoginReq.h"
#import "MUAlertPool.h"
#import "LTGlobals.h"
#import "LTPhoneRegisterViewController.h"
#import "LTAppearenceTools.h"
#import "YPUserLoginRsq.h"
@interface LTPhoneLoginViewController () <MSRequestUIDelegate>
DEFINE_PROPERTY_STRONG_UIButton(rigisterButton);
@end

@implementation LTPhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sendButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.sendButton setTitle:@"登录" forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    //
    INIT_SUBVIEW_UIButton(self.scrollView, _rigisterButton);
    [_rigisterButton setTitle:@"没有账号?" forState:UIControlStateNormal];
    _rigisterButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [_rigisterButton setTitleColor:LTColorDetailGray() forState:UIControlStateHighlighted];
    [_rigisterButton setTitleColor:LTColorDetailGray() forState:UIControlStateSelected];
    [_rigisterButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    
    self.title = @"登陆";
    self.view.backgroundColor = LTColorBackgroundGray();
#ifdef DEBUG
   self.passwordTextField.text = @"2";
    self.phoneTextField.text = @"xx";
#endif
}
- (void) login
{
    if (![self checkInputVaild]) {
        return;
    }
    YPUserLoginReq* req = [YPUserLoginReq new];
#ifdef DEBUG
    req.uname = @"test";
    req.passwd = @"123456";
#endif
    MSPerformRequestWithDelegateSelf(req);
    
    MUAlertShowLoading(@"登录中...");
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    MUAlertShowSuccess(@"成功");
    YPUserLoginRsq* loginData = (YPUserLoginRsq*)object;
    [[LTAccountManager shareManager] reloadAccountWithLoginData:loginData];
    
    //
    [self ltAuthSuccess];
}

- (void) registerUser
{
    LTPhoneRegisterViewController* vc = [LTPhoneRegisterViewController new];
    [self.navigationController pushViewController:vc  animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGRect registerRect = CGRectCenterOffsetSize(self.passwordTextField.frame, self.passwordTextField.frame.size, 10, CGRectMaxYEdge);
    _rigisterButton.frame = registerRect;
}

@end
