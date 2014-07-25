//
//  ViewController.m
//  DateTimePickerPanelDemo
//
//  Created by jimple on 14/7/25.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "ViewController.h"
#import "DateTimePickerPanel.h"

@interface ViewController ()

@property (nonatomic, strong) DateTimePickerPanel *panel;


@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _panel = [DateTimePickerPanel panelFromXibTitle:@"select..." startYear:2010 endYear:2020];
    _panel.frame = CGRectMake(0.0f, 200.0f, self.view.bounds.size.width, [DateTimePickerPanel panelHeight]);
    [self.view addSubview:_panel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
