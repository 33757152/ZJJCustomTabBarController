//
//  XtayTabBarController.m
//  XtayCustomTabBarController
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import "XtayTabBarController.h"
#import "AddViewController.h"
#import "XtayTabBar.h"

@interface XtayTabBarController () <XtayTabBarCenterItemProtocol>

@end

@implementation XtayTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XtayTabBar *tabBar = [[XtayTabBar alloc] initWithFrame:CGRectMake(0, XTAY_SCREEN_H-XTAY_STATUS_BAR_H-XTAY_NAV_BAR_H-XTAY_TAB_BAR_H, XTAY_SCREEN_W, XTAY_TAB_BAR_H)];
    tabBar.protocol = self;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)xtayCenterTabBarButtonRes {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[AddViewController new]];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
