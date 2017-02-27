//
//  ScrollTopButton.m
//  ScrollTopButton
//
//  Created by Dwt on 2017/2/27.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import "ScrollTopButton.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define DefaultW 40

@implementation ScrollTopButton{
    
    __weak UIScrollView *_scrollView;
}

- (instancetype)initWithScrollView:(UIScrollView *)scrollView{
    
    if (self = [super init]) {
        [self setupWithScrollView:scrollView];
    }
    return self;
}

- (void)setupWithScrollView:(UIScrollView *)scrollView{
    
    _scrollView = scrollView;
    self.distanceWhenShow = self.distanceWhenShow ?:ScreenHeight;
    
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[UIImage imageNamed:@"toTopButton"] forState:UIControlStateNormal];
    self.frame = CGRectMake(ScreenWidth - DefaultW - 10, ScreenHeight - 100, DefaultW, DefaultW);
    [self addTarget:self action:@selector(scrollToTopClick) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)scrollToTopClick{
    
    [_scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    CGPoint point = [change[@"new"] CGPointValue];
    if (point.y <= self.distanceWhenShow) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
}

- (void)dealloc{
    
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
