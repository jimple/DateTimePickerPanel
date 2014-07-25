//
//  DateTimePickerPanel.m
//  DateTimePickerPanelDemo
//
//  Created by jimple on 14/7/25.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "DateTimePickerPanel.h"

NS_ENUM(NSInteger, EColumnIndex)
{
    kColumnYear         = 0,
    kColumnMonth        = 1,
    kColumnDay          = 2,
    kColumnHour         = 3,
    kColumnMinute       = 4,
    
    kColumnCount
};


@interface DateTimePickerPanel ()
<
    UIPickerViewDelegate,
    UIPickerViewDataSource
>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger startYear;
@property (nonatomic, assign) NSInteger endYear;

@property (nonatomic, weak) IBOutlet UIButton *cancelBtn;
@property (nonatomic, weak) IBOutlet UIButton *confirmBtn;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;


- (void)setTitle:(NSString *)title startYear:(NSInteger)startYear endYear:(NSInteger)endYear;

@end

@implementation DateTimePickerPanel

+ (CGFloat)panelHeight
{
    return 200.0f;  // toolbar 38 + picker 162;
}

+ (DateTimePickerPanel *)panelFromXibTitle:(NSString *)title startYear:(NSInteger)startYear endYear:(NSInteger)endYear
{
    DateTimePickerPanel *panel;
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"DateTimePickerPanel" owner:self options:nil];
    panel = (DateTimePickerPanel *)[nib objectAtIndex:0];
    
    [panel setTitle:title startYear:startYear endYear:endYear];
    
    return panel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib
{
    // Initialization code
    [self initPanel];
}

- (void)initPanel
{
    
    [self initializeUI];
}

- (void)initializeUI
{
    self.titleLabel.text = _title;
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

- (void)setTitle:(NSString *)title startYear:(NSInteger)startYear endYear:(NSInteger)endYear
{
    if (endYear > startYear)
    {
        _endYear = endYear;
        _startYear = startYear;
    }
    else
    {
        _startYear = 2000;
        _endYear = 2050;
    }
    
    _title = title;
    
    self.titleLabel.text = _title;
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case kColumnYear:
        {
            [self.pickerView reloadComponent:kColumnDay];
        }
            break;
        case kColumnMonth:
        {
            [self.pickerView reloadComponent:kColumnDay];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kColumnCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rows = 0;
    
    switch (component)
    {
        case kColumnYear:
        {
            rows = _endYear - _startYear + 1;
        }
            break;
        case kColumnMonth:
        {
            rows = 12;
        }
            break;
        case kColumnDay:
        {
            rows = 31;
            NSInteger month = [pickerView selectedRowInComponent:kColumnMonth] + 1;
            if (month == 2)
            {
                NSInteger year = [pickerView selectedRowInComponent:kColumnYear] + _startYear;
                if (year%4 == 0)
                {
                    rows = 29;
                }
                else
                {
                    rows = 28;
                }
            }
            else if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12))
            {
                rows = 31;
            }
            else
            {
                rows = 30;
            }
            
        }
            break;
        case kColumnHour:
        {
            rows = 24;
        }
            break;
        case kColumnMinute:
        {
            rows = 60/10;
        }
            break;
        default:
            NSAssert(NO, @" assert! ");
            break;
    }
    
    return rows;
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    UILabel *contentLabel = (UILabel *)view;
    
    if (!contentLabel)
    {
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 100.0f)];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.font = [UIFont systemFontOfSize:16.0f];
        contentLabel.textColor = [UIColor darkTextColor];
    }else{}
    
    switch (component)
    {
        case kColumnYear:
        {
            contentLabel.text = [NSString stringWithFormat:@"%d年", row + _startYear];
        }
            break;
        case kColumnMonth:
        {
            contentLabel.text = [NSString stringWithFormat:@"%d月", row + 1];
        }
            break;
        case kColumnDay:
        {
            contentLabel.text = [NSString stringWithFormat:@"%d日", row + 1];
        }
            break;
        case kColumnHour:
        {
            contentLabel.text = [NSString stringWithFormat:@"%d时", row];
        }
            break;
        case kColumnMinute:
        {
            contentLabel.text = [NSString stringWithFormat:@"%d分", row * 10];
        }
            break;
        default:
        {
            contentLabel.text = @"";
        }
            break;
    }

    return contentLabel;
}


























@end
