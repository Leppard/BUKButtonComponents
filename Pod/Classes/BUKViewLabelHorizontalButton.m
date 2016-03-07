//
//  BUKViewLabelHorizontalButton.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/7/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "BUKViewLabelHorizontalButton.h"

static CGFloat divRate = 0.5;

@interface BUKViewLabelHorizontalButton ()

@property (nonatomic, readwrite) UIImageView *imageView;
@property (nonatomic, readwrite) UILabel *label;

@end

@implementation BUKViewLabelHorizontalButton

@synthesize imageView = _imageView;
@synthesize label = _label;

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (CGRectEqualToRect(frame, CGRectZero)) {
            [self setFrame:CGRectMake(0, 0, 60, 30)];
        }
        [self setUpViews];
    }
    return self;
}

#pragma mark - public methods

- (void)setImageForView:(UIImage *)image
{
    if (!image) {
        return;
    }
    [self.imageView setImage:image];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat btnHeight = self.bounds.size.height;
    CGFloat btnWide   = self.bounds.size.width;
    [self.imageView setFrame:CGRectMake(0, 0, btnWide*divRate, btnHeight)];
    [self.label setFrame:CGRectMake(btnWide*divRate, 0, btnWide*(1-divRate), btnHeight)];
}

#pragma mark - private methods

- (void)setUpViews
{
    [self addSubview:self.imageView];
    [self addSubview:self.label];
}

#pragma mark - getters & setters

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}


@end
