//
//  CALayer+XibConfiguration.m
//  Quards2DOC版
//
//  Created by AISION on 2018/3/5.
//  Copyright © 2018年 xiaokai.wang. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)
-(void)setBorderUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
-(UIColor *)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}
@end
