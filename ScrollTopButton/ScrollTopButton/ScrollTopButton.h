//
//  ScrollTopButton.h
//  ScrollTopButton
//
//  Created by Dwt on 2017/2/27.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTopButton : UIButton

/**出现的距离*/
@property(nonatomic, assign)CGFloat distanceWhenShow;

/**初始化*/
- (instancetype)initWithScrollView:(UIScrollView *)scrollView;

@end
