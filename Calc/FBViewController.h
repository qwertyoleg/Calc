//
//  FBViewController.h
//  Calc
//
//  Created by user03 on 06.02.14.
//  Copyright (c) 2014 Oleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBViewController : UIViewController
{
    NSMutableString *displayedNumberString;
    NSMutableString *savedNumberString;
    double resultNumber;
    double buffNumber;
    //double secondNumber;
    char currentOperation;
    BOOL isFloatingPointPressed;
}

@property (nonatomic,weak) IBOutlet UILabel *labelDisplay;
@property (nonatomic,weak) IBOutlet UIButton *DijitButton;
@property (nonatomic,strong) NSMutableString *displayedNumberString;
@property (nonatomic,strong) NSMutableString *savedNumberString;
@property (weak, nonatomic) IBOutlet UITextView *displayTextView;

- (IBAction)buttonClicked:(id)sender;
- (IBAction)correctNumber:(id)sender;
- (IBAction)clearSavedNumber:(id)sender;
- (IBAction)increaseSavedNumber:(id)sender;
- (IBAction)decreaseSavedNumber:(id)sender;
- (IBAction)showSavedNumber:(id)sender;
- (IBAction)addNumber:(id)sender;
- (IBAction)showResult:(id)sender;
- (IBAction)subtractNumber:(id)sender;
- (IBAction)multiplyNumber:(id)sender;
- (IBAction)devideNumber:(id)sender;
- (IBAction)addFloatingPoint:(id)sender;
@end