//
//  AIZCustomTableViewCell.m
//  Cells
//
//  Created by X on 26/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZCustomTableViewCell.h"

@interface AIZCustomTableViewCell()

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *colorLabel;
@property (nonatomic, weak) UILabel *nameMarker;
@property (nonatomic, weak) UILabel *colorMarker;

@end

@implementation AIZCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self addNameMarker];
        [self addNameMarkerConstraints];

        [self addColorMarker];
        [self addColorMarkerConstraints];

        [self addNameLabel];
        [self addNameLabelConstraints];

        [self addColorLabel];
        [self addColorLabelConstraints];
    }
    return self;
}

- (void)setName:(NSString *)n
{
    if (![n isEqualToString:_name])
    {
        _name = [n copy];
        self.nameLabel.text = _name;
    }
}

- (void)setColor:(NSString *)c
{
    if (![c isEqualToString:_color])
    {
        _color = [c copy];
        self.colorLabel.text = _color;
    }
}

- (void)addNameMarker
{
    UILabel *nameMarker = [[UILabel alloc] initWithFrame:CGRectZero];
    nameMarker.textAlignment = NSTextAlignmentRight;
    nameMarker.text = @"Name:";
    nameMarker.font = [UIFont boldSystemFontOfSize:12.0f];
    self.nameMarker = nameMarker;
//    self.nameMarker.backgroundColor = [UIColor grayColor];
    [self.nameMarker sizeToFit];
    [self.contentView addSubview:self.nameMarker];
}

- (void)addNameMarkerConstraints
{
    self.nameMarker.translatesAutoresizingMaskIntoConstraints = NO;

    [self.nameMarker setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"nameMarker"  : self.nameMarker };

    NSArray *verticalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[nameMarker]"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];
    [self.contentView addConstraints:verticalConstraints];

    NSArray *horizontalNameLabelConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[nameMarker]"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];
    [self.contentView addConstraints:horizontalNameLabelConstraints];
}

- (void)addColorMarker
{
    UILabel *colorMarker = [[UILabel alloc] initWithFrame:CGRectZero];
    colorMarker.textAlignment = NSTextAlignmentRight;
    colorMarker.text = @"Color:";
    colorMarker.font = [UIFont boldSystemFontOfSize:12.0f];
    self.colorMarker = colorMarker;
//    self.colorMarker.backgroundColor = [UIColor grayColor];
    [self.colorMarker sizeToFit];
    [self.contentView addSubview:self.colorMarker];
}

- (void)addColorMarkerConstraints
{
    self.colorMarker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"colorMarker" : self.colorMarker };

    NSArray *verticalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[colorMarker]-4-|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];
        [self.contentView addConstraints:verticalConstraints];

    NSLayoutConstraint *horizontalColorMarkerConstraints =
        [NSLayoutConstraint constraintWithItem:self.colorMarker
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.nameMarker
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0f
                                      constant:0.0f];
    [self.contentView addConstraints:@[horizontalColorMarkerConstraints]];

}

- (void)addNameLabel
{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel = nameLabel;
//    self.nameLabel.backgroundColor = [UIColor grayColor];
    [self.nameLabel sizeToFit];
    [self.contentView addSubview:self.nameLabel];
}

- (void)addNameLabelConstraints
{
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *verticalConstraints =
        [NSLayoutConstraint constraintWithItem:self.nameLabel
                                     attribute:NSLayoutAttributeBaseline
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.nameMarker
                                     attribute:NSLayoutAttributeBaseline
                                    multiplier:1.0f
                                      constant:0.0f];
    [self.contentView addConstraints:@[verticalConstraints]];

     NSDictionary *nameMap = @{ @"nameMarker" : self.nameMarker,
                                @"nameLabel"  : self.nameLabel };

     NSArray *horizontalConstraints =
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:[nameMarker]-[nameLabel]-|"
                                                 options:0
                                                 metrics:nil
                                                   views:nameMap];
     [self.contentView addConstraints:horizontalConstraints];
}

- (void)addColorLabel
{
    UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.colorLabel = colorLabel;
//    self.colorLabel.backgroundColor = [UIColor grayColor];
    [self.colorLabel sizeToFit];
    [self.contentView addSubview:self.colorLabel];
}

- (void)addColorLabelConstraints
{
    self.colorLabel.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *verticalConstraints =
    [NSLayoutConstraint constraintWithItem:self.colorLabel
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.colorMarker
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];
    [self.contentView addConstraints:@[verticalConstraints]];

    NSDictionary *nameMap = @{ @"colorMarker" : self.colorMarker,
                               @"colorLabel"  : self.colorLabel };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:[colorMarker]-[colorLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.contentView addConstraints:horizontalConstraints];
}

@end





















