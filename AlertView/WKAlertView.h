//
//  WKAlertView.h
//  WKAlertView
//
//  Created by AISION on 17/2/16.
//  Copyright © 2017年 xiaokai.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKAlertView;
@protocol WKAlertViewDelegate  <NSObject>
@optional
/**那个按钮点击 输出内容*/
-(void)WKAlertView:(WKAlertView *)wkAlertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
@interface WKAlertView : UIView
/**代理*/
//@property(nullable,nonatomic,weak) id /*<WKAlertViewDelegate>*/ delegate;
@property (nonatomic,assign)id <WKAlertViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UIButton *verifyBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verifyLeadingConstrain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelRightConstrain;



@property (nonatomic,strong)UIColor *layerBorderColor;
@property (nonatomic,assign)CGFloat fontSize;



- (instancetype)initWithTitle:(nullable NSString *)title picture:(nullable NSString *)imageString delegate:(nullable id /**<WKAlertViewDelegate>*/)delegate cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ...;
@end


