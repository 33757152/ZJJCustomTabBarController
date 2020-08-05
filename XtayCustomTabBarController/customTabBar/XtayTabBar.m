//
//  XtayTabBar.m
//  XtayCustomTabBarController
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import "XtayTabBar.h"

@interface XtayTabBar () {
    UIView *_centerView;
    UIImageView *_centerImageView;
    UILabel *_centerLabel;
}

@end

@implementation XtayTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCenterView];
        //去掉tabBar顶部线条
        self.shadowImage = [UIImage new];
        self.backgroundImage = [UIImage new];
        self.backgroundColor = XTAY_RGB(248, 247, 248);
    }
    return self;
}

- (void)createCenterView {
    UIView *centerView = [[UIView alloc] init];
    [self addSubview:centerView];
    _centerView = centerView;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"tianjia"];
    [centerView addSubview:imageView];
    _centerImageView = imageView;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = XTAY_TABBAR_TITLE_NORMAL_COLOR;
    label.font = XTAY_TABBAR_TITLE_FONT;
    label.text = @"添加";
    label.textAlignment = NSTextAlignmentCenter;
    [centerView addSubview:label];
    _centerLabel = label;
   
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerViewItemClick:)];
    [centerView addGestureRecognizer:tap];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSArray *viewsArr = self.subviews;
    NSMutableArray *tempMArr = [NSMutableArray arrayWithArray:viewsArr];
    [tempMArr removeObjectAtIndex:0];
    [tempMArr removeObjectAtIndex:0];
    [tempMArr insertObject:viewsArr[1] atIndex:(viewsArr.count-2)/2];
    CGFloat itemWidth = XTAY_SCREEN_W/tempMArr.count;
    for (NSInteger i = 0; i<tempMArr.count; i++) {
        UIView *subView = tempMArr[i];
        subView.frame = CGRectMake(itemWidth*(i%tempMArr.count), 0, itemWidth, self.bounds.size.height);
    }
    _centerImageView.frame = CGRectMake((_centerView.bounds.size.width-_centerView.bounds.size.height)/2, -20, _centerView.bounds.size.height, _centerView.bounds.size.height);
    _centerLabel.frame = CGRectMake(0, _centerView.bounds.size.height-20, _centerView.bounds.size.width, 20);
}

- (void)centerViewItemClick:(UITapGestureRecognizer *)gesture {
    if ([self.protocol respondsToSelector:@selector(xtayCenterTabBarButtonRes)]) {
        [self.protocol xtayCenterTabBarButtonRes];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint viewPoint = [self convertPoint:point toView:_centerView];
    CGPoint imgPoint = [self convertPoint:point toView:_centerImageView];
    if ([_centerView pointInside:viewPoint withEvent:event]) {
        return _centerView;
    } else {
        if ([_centerImageView pointInside:imgPoint withEvent:event]) {
            return _centerView;
        }
    }
    return [super hitTest:point withEvent:event];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
