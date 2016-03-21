//
//  BUKLabelViewVerticalButton.m
//  BUKButtonComponents
//
//  Created by Leppard on 3/20/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import "BUKLabelViewVerticalButton.h"

@interface BUKLabelViewVerticalButton ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, assign) CGFloat separator;

@property (nonatomic, assign) UIEdgeInsets labelInsets;
@property (nonatomic, assign) UIEdgeInsets imageInsets;

@end

@implementation BUKLabelViewVerticalButton

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

- (void)setLabelEdgeInsets:(UIEdgeInsets)insets
{
    self.labelInsets = insets;
    
    [self setUpViewWithInsets];
}

- (void)setImageEdgeInsets:(UIEdgeInsets)insets
{
    self.imageInsets = insets;
    
    [self setUpViewWithInsets];
}

#pragma mark - private methods

- (void)setUpViews
{
    [self addSubview:self.containerView];
    
    [self.containerView addSubview:self.imageView];
    [self.containerView addSubview:self.label];
    
    [self setUpViewWithInsets];
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
    
    UIView *label = self.label;
    UIView *image = self.imageView;
    
    NSString *vVfl = @"V:|-(>=0)-[label]-separator-[image]-(>=0)-|";
    NSDictionary *metrics = @{@"separator": [NSNumber numberWithFloat:self.separator]};
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vVfl options:NSLayoutFormatAlignAllCenterX metrics:metrics views:NSDictionaryOfVariableBindings(label, image)];
    [self.containerView addConstraints:vConstraints];
    
    [self.containerView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.containerView
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:image
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                   constant:0]];
    [self.containerView addConstraint:
     [NSLayoutConstraint constraintWithItem:image
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.containerView
                                  attribute:NSLayoutAttributeCenterX
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
    
    UIView *label = self.label;
    UIView *image = self.imageView;
    
    float separator = self.labelInsets.bottom + self.imageInsets.top;
    
    NSDictionary *metrics = @{@"labelTop": [NSNumber numberWithFloat:self.labelInsets.top],
                              @"separator": [NSNumber numberWithFloat:separator],
                              @"labelLeft": [NSNumber numberWithFloat:self.labelInsets.left],
                              @"labelRight": [NSNumber numberWithFloat:self.labelInsets.right],
                              @"imageLeft": [NSNumber numberWithFloat:self.imageInsets.left],
                              @"imageRight": [NSNumber numberWithFloat:self.imageInsets.right],
                              @"imageBottom": [NSNumber numberWithFloat:self.imageInsets.bottom]};
    
    NSString *vVfl = @"V:|-labelTop-[label]-separator-[image]-imageBottom-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(image, label);
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vVfl options:0 metrics:metrics views:views];
    [self.containerView addConstraints:vConstraints];
    
    NSString *labelHVfl = @"H:|-labelLeft-[label]-labelRight-|";
    NSArray *labelHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:labelHVfl options:0 metrics:metrics views:NSDictionaryOfVariableBindings(label)];
    [self.containerView addConstraints:labelHConstraints];
    
    NSString *imageHVfl = @"H:|-imageLeft-[image]-imageRight-|";
    NSArray *imageHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:imageHVfl options:0 metrics:metrics views:NSDictionaryOfVariableBindings(image)];
    [self.containerView addConstraints:imageHConstraints];
}

#pragma mark - getters & setters

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:self.frame];
        _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _containerView;
}


@end
