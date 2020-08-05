//
//  AppDelegate.m
//  XtayCustomTabBarController
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import "AppDelegate.h"
#import "XtayToolView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [XtayToolView xtayGoToTabBarController];
    return YES;
}

@end
