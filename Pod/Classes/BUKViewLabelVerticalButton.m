//
//  BUKViewLabelVerticalButton.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/3/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "BUKViewLabelVerticalButton.h"

static CGFloat divRate = 0.75;

@interface BUKViewLabelVerticalButton ()

@property (nonatomic, readwrite) UIImageView *imageView;
@property (nonatomic, readwrite) UILabel *label;

@end

@implementation BUKViewLabelVerticalButton

@synthesize imageView = _imageView;
@synthesize label = _label;

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (CGRectEqualToRect(frame, CGRectZero)) {
            [self setFrame:CGRectMake(0, 0, 30, 40)];
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
    [self.imageView setFrame:CGRectMake(0, 0, btnWide, btnHeight*divRate)];
    [self.label setFrame:CGRectMake(0, btnHeight*divRate, btnWide, btnHeight*(1-divRate))];
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
