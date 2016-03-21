//
//  BUKButton.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/21/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "BUKButton.h"

@interface BUKButton ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation BUKButton

#pragma mark - public methods

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text
{
    self = [self initWithFrame:frame];
    if (self) {
        [self setImageForView:image];
        _label.text = text;
    }
    return self;
}

- (void)setImageForView:(UIImage *)image
{
    if (!image) {
        return;
    }
    [self.imageView setImage:image];
}

- (void)addTarget:(id)target clickAction:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

#pragma mark - getters & setters

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_imageView setContentHuggingPriority:799 forAxis:UILayoutConstraintAxisHorizontal];
        [_imageView setContentHuggingPriority:799 forAxis:UILayoutConstraintAxisVertical];
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
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [_label setContentHuggingPriority:800 forAxis:UILayoutConstraintAxisHorizontal];
        [_label setContentHuggingPriority:800 forAxis:UILayoutConstraintAxisVertical];
    }
    return _label;
}

@end
