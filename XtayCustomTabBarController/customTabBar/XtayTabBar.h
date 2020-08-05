//
//  XtayTabBar.h
//  XtayCustomTabBarController
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XtayTabBarCenterItemProtocol <NSObject>

- (void)xtayCenterTabBarButtonRes;

@end

@interface XtayTabBar : UITabBar

/// 代理
@property (nonatomic, weak) id <XtayTabBarCenterItemProtocol> protocol;

@end

NS_ASSUME_NONNULL_END
