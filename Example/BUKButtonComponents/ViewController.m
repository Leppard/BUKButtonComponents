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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BUKViewLabelVerticalButton *button1 = [[BUKViewLabelVerticalButton alloc] initWithFrame:CGRectMake(100, 100, 50, 40)];
    button1.label.text = @"xxxxx";
    [button1 setImageForView:[UIImage imageNamed:@"example_confirm"]];
    [self.view addSubview:button1];
    
    BUKViewLabelHorizontalButton *button2 = [[BUKViewLabelHorizontalButton alloc] initWithFrame:CGRectMake(200, 100, 90, 30)];
    button2.label.text = @"YYYYY";
    [button2 setImageForView:[UIImage imageNamed:@"example_error"]];
    [self.view addSubview:button2];
}

@end
