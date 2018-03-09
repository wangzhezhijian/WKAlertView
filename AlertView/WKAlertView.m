//
//  WKAlertView.m
//  WKAlertView
//
//  Created by AISION on 17/2/16.
//  Copyright © 2017年 xiaokai.wang. All rights reserved.
//

#import "WKAlertView.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define WIDTHBASE (SCREENWIDTH/320)
@implementation WKAlertView

- (id)initWithFrame:(CGRect)frame{
    if (!self) {
        self = [super initWithFrame:frame];
        self =  [[[NSBundle mainBundle] loadNibNamed:@"WKAlertView" owner:nil options:nil]lastObject];
        self.verifyBtn.tag = 0;
        self.cancelBtn.tag = 1;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.borderColor = self.layerBorderColor.CGColor;
    self.titleLabel.font = [UIFont systemFontOfSize:self.fontSize?self.fontSize:14];
    if (self.cancelBtn.currentTitle.length==0) {
        NSLayoutConstraint * verifyLeading = [NSLayoutConstraint constraintWithItem:self.verifyBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        self.verifyLeadingConstrain = verifyLeading;
        [self addConstraint:self.verifyLeadingConstrain];
        
    }else{
        [self removeConstraint:self.verifyLeadingConstrain];
    }
    
    if (self.verifyBtn.currentTitle.length==0) {
         NSLayoutConstraint * cancelRight = [NSLayoutConstraint constraintWithItem:self.cancelBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        self.cancelRightConstrain = cancelRight;
        [self addConstraint:self.cancelRightConstrain];
    }else{
        [self removeConstraint:self.cancelRightConstrain];
    }
    [self.verifyBtn addTarget:self action:@selector(verify:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat h = [self calculateRowHeight:self.titleLabel.text fontSize:self.fontSize ? self.fontSize : 14 width:self.titleLabel.bounds.size.width];
    CGFloat h1 = self.titleLabel.bounds.size.height;
    CGFloat h2 = self.frame.size.height + h - h1;
    self.frame = CGRectMake(0, 0, self.frame.size.width, h2);
    self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-self.frame.size.width)/2, ([UIScreen mainScreen].bounds.size.height-self.frame.size.height)/2, self.frame.size.width, self.frame.size.height);
}
- (CGFloat)calculateRowHeight:(NSString *)string fontSize:(NSInteger)fontSize width:(CGFloat)width{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};//指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}
- (void)verify:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(WKAlertView: clickedButtonAtIndex:)]) {
        [_delegate WKAlertView:self clickedButtonAtIndex:btn.tag];
    }
}
- (void)cancel:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(WKAlertView: clickedButtonAtIndex:)]) {
        [_delegate WKAlertView:self clickedButtonAtIndex:btn.tag];
    }
}

- (WKAlertView *)create{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"WKAlertView" owner:nil options:nil];
    WKAlertView *cv =[nibView objectAtIndex:0];
    cv.verifyBtn.tag = 0;
    cv.cancelBtn.tag = 1;
    return cv;
}

#pragma mark--alert
- (instancetype)initWithTitle:(nullable NSString *)title picture:(nullable NSString *)imageString delegate:(nullable id /**<WKAlertViewDelegate>*/)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...
{
    WKAlertView *alertView = [self create];
    [alertView.verifyBtn setTitle:otherButtonTitles forState:UIControlStateNormal];
    [alertView.cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
    alertView.titleLabel.text = title;
    
    alertView.picture.image = [UIImage imageNamed:imageString];
    alertView.delegate = delegate;
    alertView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-alertView.frame.size.width)/2, ([UIScreen mainScreen].bounds.size.height-alertView.frame.size.height)/2, alertView.frame.size.width, alertView.frame.size.height);
    return alertView;
}

@end
