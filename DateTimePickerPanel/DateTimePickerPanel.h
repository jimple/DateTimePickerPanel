//
//  DateTimePickerPanel.h
//  DateTimePickerPanelDemo
//
//  Created by jimple on 14/7/25.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateTimePickerPanel : UIView

+ (CGFloat)panelHeight;
+ (DateTimePickerPanel *)panelFromXibTitle:(NSString *)title startYear:(NSInteger)startYear endYear:(NSInteger)endYear;

//- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title startYear:(NSInteger)startYear endYear:(NSInteger)endYear;


@end
