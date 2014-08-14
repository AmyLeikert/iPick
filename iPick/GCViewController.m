//
//  GCViewController.m
//  iPick
//
//  Created by DetroitLabsUser on 3/6/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCViewController.h"

@interface GCViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UIPickerView *myPickerView;
@property (nonatomic, strong) NSArray *flavorsArray;
@property (nonatomic, strong) NSArray *animalsArray;

@end

@implementation GCViewController

-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
    
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
    return [_flavorsArray count];
    } else if (component == 1) {
        return [_animalsArray count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
    return [_flavorsArray objectAtIndex:row];
    } else if (component == 1) {
            return [_animalsArray objectAtIndex:row];
        }
        return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *myString = @"Selected: ";
    myString= [myString stringByAppendingFormat: @"%@ %@", [_flavorsArray objectAtIndex:[pickerView selectedRowInComponent:0]], [_animalsArray objectAtIndex:[pickerView selectedRowInComponent:1]]];
       NSLog(@"%@", myString);
}

-(IBAction)datePickerChanged:(id)sender {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy"];
    NSLog(@"Date: %@", [format stringFromDate: _datePicker.date]);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_datePicker setDate: [NSDate date]];
    _flavorsArray = [[NSArray alloc]
    initWithObjects:@"Vanilla",@"Chocolate",@"Strawberry",@"Superman",@"Rocky Road", nil];
    _animalsArray = [[NSArray alloc] initWithObjects:@"Dog",@"Cat",@"Chinchilla",nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
