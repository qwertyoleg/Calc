//
//  FBViewController.m
//  Calc
//
//  Created by user03 on 06.02.14.
//  Copyright (c) 2014 Oleg. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()

@end

@implementation FBViewController
@synthesize DijitButton;
@synthesize displayedNumberString;
@synthesize savedNumberString;
@synthesize labelDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
    displayedNumberString = [[NSMutableString alloc]init];
    savedNumberString = [[NSMutableString alloc]init];
    isFloatingPointPressed = NO;
    currentOperation = '0';
    NSLog(@"fresultNumber:%f \n", resultNumber);
    
    //
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonClicked:(id)sender
{
    UIButton * button = (UIButton *)sender;
//    int x = [sender tag];
//    NSString *tmp;
    
    //background image for buttons
//        UIImage *image = [UIImage imageNamed:@"ButtonBackgroundGrey.png"];
//    UIEdgeInsets insets = UIEdgeInsetsMake(0.0f, 7.0f, 7.0f, 7.0f);
//    UIImage *stretchedImage = [image resizableImageWithCapInsets:insets];
//    
//    [button setBackgroundImage:stretchedImage forState:UIControlStateNormal];
    
    /////////////////////////////

    
    [displayedNumberString appendString:button.titleLabel.text];
    
    
    
    //refrash label
    self.labelDisplay.text = self.displayedNumberString;
    
    
    ///////test text view/////////
    self.displayTextView.text = self.displayedNumberString;
    
    
    
    //////////////////////////////
    
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    //nsmutablestring to double
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    /////////////////
    NSNumber *myNumber = [f numberFromString:displayedNumberString];
    buffNumber = [myNumber doubleValue];
    
    
    NSLog(@"Button pressed: %@", displayedNumberString);
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)correctNumber:(id)sender
{
//    NSInteger digitsInNumber = [displayedNumberString length];
//    if (digitsInNumber >= 1)
//    {
//        NSRange lastCharacterRange = NSMakeRange(digitsInNumber - 1, 1);
//        [displayedNumberString deleteCharactersInRange:lastCharacterRange];
//        labelDisplay.text = displayedNumberString;
//        return;
//    }
    [displayedNumberString setString:@"0"];
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)clearSavedNumber:(id)sender
{
    currentOperation = 'c';
    
    NSInteger digitsInNumber = [savedNumberString length];
    
    if (digitsInNumber >= 1)
    {
        NSRange lastCharacterRange = NSMakeRange(digitsInNumber - 1, 1);
        [savedNumberString deleteCharactersInRange:lastCharacterRange];
        return;
        self.labelDisplay.text = self.displayedNumberString;
        //[self.labelDisplay resignFirstResponder];
        [super viewDidLoad];
    }
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)increaseSavedNumber:(id)sender
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    //nsmutablestring to double "saved"
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * mySavedNumber = [f numberFromString:savedNumberString];
    
    double savedNumber = [mySavedNumber doubleValue];
    /////////
    
    //nsmutablestring to double "displayed"
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myDisplayedNumber = [f numberFromString:displayedNumberString];
    
    double displayedNumber = [myDisplayedNumber doubleValue];
    /////////
    
    if (!displayedNumber)
    {
        [savedNumberString setString:displayedNumberString];
        return;
    }
    
    double newSavedNumberDouble = displayedNumber + savedNumber;
    NSNumber *newSavedNumberNSNumber;
    
    newSavedNumberNSNumber = [NSNumber numberWithDouble:newSavedNumberDouble];
    NSString *tmpString = [f stringFromNumber:newSavedNumberNSNumber];
    [self.savedNumberString setString:tmpString];
    NSLog(@"self.savedNumberString:%@\n",self.savedNumberString);
    
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)decreaseSavedNumber:(id)sender
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    //nsmutablestring to double "saved"
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * mySavedNumber = [f numberFromString:savedNumberString];
    
    double savedNumber = [mySavedNumber doubleValue];
    /////////
    
    //nsmutablestring to double "displayed"
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myDisplayedNumber = [f numberFromString:displayedNumberString];
    
    double displayedNumber = [myDisplayedNumber doubleValue];
    /////////
    
    if (!savedNumber)
    {
        [savedNumberString setString:displayedNumberString];
        return;
    }
    
    double newSavedNumberDouble = displayedNumber - savedNumber;
    NSNumber *newSavedNumberNSNumber;
    
    newSavedNumberNSNumber = [NSNumber numberWithDouble:newSavedNumberDouble];
    NSString *tmpString = [f stringFromNumber:newSavedNumberNSNumber];
    [savedNumberString setString:tmpString];
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)showSavedNumber:(id)sender
{
    [self.displayedNumberString setString:savedNumberString];
    
    //refresh label
    self.labelDisplay.text = self.displayedNumberString;
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

- (IBAction)addNumber:(id)sender
{

    currentOperation  ='+';

    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myNumber = [f numberFromString:displayedNumberString];
    double inputedNumber = [myNumber doubleValue];
    
    resultNumber += inputedNumber;
    
    self.labelDisplay.text = @"0";
    [self.displayedNumberString  setString:@""];
    NSLog(@"resultNumber:%f \n current operation:%c", resultNumber, currentOperation);
    isFloatingPointPressed = NO;
    buffNumber = resultNumber;
}

- (IBAction)showResult:(id)sender
{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:displayedNumberString];
    double inputedNumber = [myNumber doubleValue];
    
    switch (currentOperation)
    {
        case '+':
        {
            resultNumber += inputedNumber ;
            //secondNumber = inputedNumber;
            //firstNumber = 0;
            break;
        }
        case '-':
        {
            resultNumber -= inputedNumber;
            //secondNumber = inputedNumber;
            //firstNumber = 0;
            break;
        }
        case '/':
        {
            if (inputedNumber == 0) {
                UIAlertView* alert;
                alert = [[UIAlertView alloc] initWithTitle:@"Devide by 0" message:@"I can not devide by 0 yet!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                return;
               // [alert release];
            }
            resultNumber /= inputedNumber ;
        }
            break;
        case '*':
        {
            resultNumber *= inputedNumber ;
        }
            break;
        case 'c':
        {
            NSRange range = NSMakeRange(0,1);
            [displayedNumberString replaceCharactersInRange:range withString:@""];
            myNumber = [f numberFromString:displayedNumberString];
            double inputedNumber = [myNumber doubleValue];
            resultNumber = inputedNumber ;
        }
            break;
    }

    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:resultNumber];
    NSString *resoultNumberString = [NSString stringWithString:[myDoubleNumber stringValue]];
    [displayedNumberString setString: resoultNumberString];
    self.labelDisplay.text = self.displayedNumberString;
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
    
    resultNumber = 0;
    
    [displayedNumberString setString:@"0"];
    isFloatingPointPressed = NO;
}

- (IBAction)subtractNumber:(id)sender
{
    
    
    currentOperation  ='-';
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myNumber = [f numberFromString:displayedNumberString];
    double inputedNumber = [myNumber doubleValue];
    
    resultNumber += inputedNumber;
    
    self.labelDisplay.text = @"0";
    [self.displayedNumberString  setString:@""];
    NSLog(@"resultNumber:%f \n current operation:%c", resultNumber, currentOperation);
    isFloatingPointPressed = NO;
    
    //buffNumber = resultNumber;

//    currentOperation  ='-';
//    
//    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
//    [f setNumberStyle:NSNumberFormatterDecimalStyle];
//    NSNumber *myNumber = [f numberFromString:displayedNumberString];
//    double inputedNumber = [myNumber doubleValue];
//    
//    resultNumber = buffNumber - inputedNumber;
//    
//    
////    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:resultNumber];
////    NSString *resoultNumberString = [NSString stringWithString:[myDoubleNumber stringValue]];
////    [displayedNumberString setString: resoultNumberString];
////    self.labelDisplay.text = self.displayedNumberString;
//    
//    self.labelDisplay.text = @"0";
//    [self.displayedNumberString  setString:@""];
//    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
//    isFloatingPointPressed = NO;
//    buffNumber = resultNumber;
}

- (IBAction)multiplyNumber:(id)sender
{
    
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:displayedNumberString];
    double inputedNumber = [myNumber doubleValue];
    
    if (currentOperation == '0') {
        resultNumber = inputedNumber;
        self.labelDisplay.text = @"0";
        [self.displayedNumberString  setString:@""];
        return;
    }
    currentOperation  ='*';
    
    resultNumber = buffNumber * inputedNumber ;
    
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:resultNumber];
    NSString *resoultNumberString = [NSString stringWithString:[myDoubleNumber stringValue]];
    [displayedNumberString setString: resoultNumberString];
    self.labelDisplay.text = self.displayedNumberString;

    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
    
    isFloatingPointPressed = NO;
    buffNumber = resultNumber;
}

- (IBAction)devideNumber:(id)sender
{
    currentOperation  ='/';
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:displayedNumberString];
    double inputedNumber = [myNumber doubleValue];
    
    if (inputedNumber == 0) {
        UIAlertView* alert;
        alert = [[UIAlertView alloc] initWithTitle:@"Devide by 0" message:@"I can not devide by 0 yet!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }

    resultNumber = buffNumber / inputedNumber ;
    
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:resultNumber];
    NSString *resoultNumberString = [NSString stringWithString:[myDoubleNumber stringValue]];
    [displayedNumberString setString: resoultNumberString];
    self.labelDisplay.text = self.displayedNumberString;
    
    //clear scren
    self.labelDisplay.text = @"0";
    [self.displayedNumberString  setString:@""];
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
    
    isFloatingPointPressed = NO;
    buffNumber = resultNumber;
}

- (IBAction)addFloatingPoint:(id)sender
{
    if(isFloatingPointPressed)
        return;
    else
    {
        isFloatingPointPressed = YES;
    
        [displayedNumberString appendString:@"."];
    
        //refrash label
        self.labelDisplay.text = self.displayedNumberString;
        NSLog(@"Button pressed: %@", displayedNumberString);
    }
    NSLog(@"resultNumber:%f\nbuffNumber:%f \n current operation:%c", resultNumber, buffNumber, currentOperation);
}

@end
