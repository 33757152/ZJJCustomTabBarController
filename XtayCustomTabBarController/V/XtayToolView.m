//
//  XtayToolView.m
//  XtayCustomTabBarController
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import "XtayToolView.h"
#import "XtayTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "AddViewController.h"

@implementation XtayToolView

+ (void)xtayGoToTabBarController {
    XTAY_MAIN_WINDOW.backgroundColor = [UIColor whiteColor];
    
    XtayTabBarController *tabBarController = [[XtayTabBarController alloc] init];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [self xtaySettingsNav:homeNav itemTitle:@"首页" normalImage:@"add" selectedImage:@"add"];

    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    [self xtaySettingsNav:mineNav itemTitle:@"我的" normalImage:@"add" selectedImage:@"add"];
    
    tabBarController.viewControllers = @[homeNav, mineNav];
    XTAY_MAIN_WINDOW.rootViewController = tabBarController;
}

+ (void)xtaySettingsNav:(UINavigationController *)nav itemTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    nav.navigationBar.translucent = NO;
    nav.tabBarItem.title = title;
    // 设置未选中以及选中状态的图片
    nav.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置未选中以及选中状态的字体颜色
    [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:XTAY_TABBAR_TITLE_FONT} forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:XTAY_TABBAR_TITLE_FONT} forState:UIControlStateSelected];
    // 导航栏颜色
    nav.navigationBar.barTintColor = XTAY_MAIN_COLOR;
    // 标题颜色
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    // 返回按钮颜色
    nav.navigationBar.tintColor = [UIColor whiteColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
