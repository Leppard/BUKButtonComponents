//
//  ViewController.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/3/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "ViewController.h"
#import "BUKViewLabelVerticalButton.h"
#import "BUKViewLabelHorizontalButton.h"
#import "BUKLabelViewVerticalButton.h"
#import "BUKLabelViewHorizontalButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BUKViewLabelVerticalButton *button1 = [[BUKViewLabelVerticalButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100) image:[UIImage imageNamed:@"example_error"] text:@"xxxxx"];
    
    BUKLabelViewVerticalButton *btn2 = [[BUKLabelViewVerticalButton alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    btn2.label.text = @"!!!!!!";
    [btn2 setImageForView:[UIImage imageNamed:@"example_error"]];
    [btn2 setLabelEdgeInsets:UIEdgeInsetsMake(20, 10, 1, 30)];
    [btn2 setImageEdgeInsets:UIEdgeInsetsMake(10, 20, 30, 30)];
    [btn2 addTarget:self clickAction:@selector(bukButton:)];
    
    [self.view addSubview:button1];
    [self.view addSubview:btn2];
    
    
    BUKViewLabelHorizontalButton *button2 = [[BUKViewLabelHorizontalButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    button2.label.text = @"YYYYY";
    [button2 setImageForView:[UIImage imageNamed:@"example_error"]];
    [self.view addSubview:button2];
    
    BUKLabelViewHorizontalButton *btn1 = [[BUKLabelViewHorizontalButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn1.label.text = @"YYYYY";
    [btn1 setImageForView:[UIImage imageNamed:@"example_error"]];
    [btn1 addTarget:self clickAction:@selector(bukButton:)];
    
    [self.view addSubview:btn1];
}

- (void)bukButton:(id)sender
{
    NSLog(@"!!!!!!!!!!!!!!!!!!!!");
    NSLog(@"--------------------");
    NSLog(@"!!!!!!!!!!!!!!!!!!!!");
}

@end
