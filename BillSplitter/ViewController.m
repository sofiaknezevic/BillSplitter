//
//  ViewController.m
//  BillSplitter
//
//  Created by Sofia Knezevic on 2017-02-19.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISlider *amountOfPeople;
@property (weak, nonatomic) IBOutlet UIButton *calculateBillSplit;
@property (weak, nonatomic) IBOutlet UILabel *finalBill;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
}
- (IBAction)calculateBill:(UIButton *)sender {
    
    int rounded = roundf(self.amountOfPeople.value);
    
    NSDecimalNumber *bill = [[NSDecimalNumber alloc]initWithString:self.billAmount.text];
  
    NSDecimalNumber *people = [[NSDecimalNumber alloc]initWithInt:rounded];
    
    NSDecimalNumber *finalBillAmount = [bill decimalNumberByDividingBy:people];
    
    NSNumberFormatter *amountFormatted = [[NSNumberFormatter alloc] init];
    [amountFormatted setNumberStyle:NSNumberFormatterCurrencyStyle];
    [amountFormatted setMaximumFractionDigits:2];
    
    NSString *numberAsString = [amountFormatted stringFromNumber:finalBillAmount];
    
    
    
    
    NSString *finalBillText = [NSString stringWithFormat:@"To split this bill you need to pay %@ each.", numberAsString];
    
    self.finalBill.text = finalBillText;
    
    
    
}
- (IBAction)calculatePeople:(UISlider *)sender {
    
    self.numberOfPeople.text = [NSString stringWithFormat:@"%.0f People", sender.value];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
