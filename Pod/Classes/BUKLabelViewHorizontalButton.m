//
//  BUKLabelViewHorizontalButton.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/21/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "BUKLabelViewHorizontalButton.h"

@interface BUKLabelViewHorizontalButton ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, assign) CGFloat separator;

@property (nonatomic, assign) UIEdgeInsets labelInsets;
@property (nonatomic, assign) UIEdgeInsets imageInsets;

@end

@implementation BUKLabelViewHorizontalButton

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (CGRectEqualToRect(frame, CGRectZero)) {
            [self setFrame:CGRectMake(0, 0, 30, 40)];
        }
        _labelInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self setUpViews];
    }
    return self;
}

#pragma mark - public methods

- (void)setSeparateInset:(CGFloat)inset
{
    self.separator = inset;
    
    [self updateContainerViewWithConstraints];
}

- (void)setImageEdgeInsets:(UIEdgeInsets)insets
{
    self.imageInsets = insets;
    
    [self setUpViewWithInsets];
}

- (void)setLabelEdgeInsets:(UIEdgeInsets)insets
{
    self.labelInsets = insets;
    
    [self setUpViewWithInsets];
}

#pragma mark - private methods

- (void)setUpViews
{
    [self addSubview:self.containerView];
    
    [self.containerView addSubview:self.imageView];
    [self.containerView addSubview:self.label];
    
    [self setUpViewWithConstraints];
}

- (void)setUpViewWithConstraints
{
    [self updateContainerViewWithConstraints];
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstItem == self.containerView || constraint.secondItem == self.containerView) {
            [self removeConstraint:constraint];
        }
    }
    
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0]];
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
}

- (void)updateContainerViewWithConstraints
{
    for (NSLayoutConstraint *constraint in self.containerView.constraints) {
        if (constraint.firstItem == self.label || constraint.secondItem == self.label || constraint.firstItem == self.imageView || constraint.secondItem == self.imageView) {
            [self.containerView removeConstraint:constraint];
        }
    }
    
    UIView *image = self.imageView;
    UIView *label = self.label;
    
    NSString *hVfl = @"H:|-[label]-separator-[image]-|";
    NSDictionary *metrics = @{@"separator": [NSNumber numberWithFloat:self.separator]};
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hVfl options:NSLayoutFormatAlignAllCenterY metrics:metrics views:NSDictionaryOfVariableBindings(image, label)];
    [self.containerView addConstraints:hConstraints];
    
    [self.containerView addConstraint:
     [NSLayoutConstraint constraintWithItem:image
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.containerView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
    [self.containerView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:image
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1
                                   constant:0]];
}

- (void)setUpViewWithInsets
{
    [self updateContainerViewWithInsets];
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstItem == self.containerView || constraint.secondItem == self.containerView) {
            [self removeConstraint:constraint];
        }
    }
    
    // set containerView's constraints
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0]];
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                   constant:0]];
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1
                                   constant:0]];
}

- (void)updateContainerViewWithInsets
{
    for (NSLayoutConstraint *constraint in self.containerView.constraints) {
        if (constraint.firstItem == self.label || constraint.secondItem == self.label || constraint.firstItem == self.imageView || constraint.secondItem == self.imageView) {
            [self.containerView removeConstraint:constraint];
        }
    }
    
    UIView *image = self.imageView;
    UIView *label = self.label;
    
    float separator = self.labelInsets.right + self.imageInsets.left;
    
    NSDictionary *metrics = @{@"separator": [NSNumber numberWithFloat:separator],
                              @"imageTop": [NSNumber numberWithFloat:self.imageInsets.top],
                              @"imageRight": [NSNumber numberWithFloat:self.imageInsets.right],
                              @"imageBottom": [NSNumber numberWithFloat:self.imageInsets.bottom],
                              @"labelTop": [NSNumber numberWithFloat:self.labelInsets.top],
                              @"labelBottom": [NSNumber numberWithFloat:self.labelInsets.bottom],
                              @"labelLeft": [NSNumber numberWithFloat:self.labelInsets.left]};
    
    NSString *hVfl = @"H:|-labelLeft-[label]-separator-[image]-imageRight-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(image, label);
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hVfl options:0 metrics:metrics views:views];
    [self.containerView addConstraints:hConstraints];
    
    NSString *imageVVfl = @"V:|-imageTop-[image]-imageBottom-|";
    NSArray *imageVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:imageVVfl options:0 metrics:metrics views:NSDictionaryOfVariableBindings(image)];
    [self.containerView addConstraints:imageVConstraints];
    
    NSString *labelVVfl = @"V:|-labelTop-[label]-labelBottom-|";
    NSArray *labelVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:labelVVfl options:0 metrics:metrics views:NSDictionaryOfVariableBindings(label)];
    [self.containerView addConstraints:labelVConstraints];
}

#pragma mark - getters & setters

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:self.frame];
        _containerView.translatesAutoresizingMaskIntoConstraints = NO;
        _containerView.userInteractionEnabled = NO;
    }
    return _containerView;
}


@end
