//
//  YPOperationTableViewCell.m
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPOperationTableViewCell.h"
#import <DZGeometryTools.h>
#import "YPQueueManager.h"
#import "LTColors.h"
@implementation YPOperationTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _detailLabel);
    INIT_SUBVIEW_UIButton(self.contentView, _ququeButton);
    
    //
    [_ququeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_ququeButton setBackgroundColor:[UIColor blueColor]];
    return self;

}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(20, 20));
    
    CGSize btnSize = CGSizeMake(80, 30);
    if (YPCurrentQueue && ![YPCurrentQueue.identifier isEqualToString:self.businiess.identifier]) {
        btnSize = CGSizeZero;
    } else {
        
    }
    
    CGRect btnRect;
    CGRectDivide(contentRect, &btnRect, &contentRect, btnSize.width, CGRectMaxXEdge);
    
    CGRect titleRect;
    CGRect detailRect;
    
    CGRectShrink(contentRect, 5, CGRectMaxXEdge);
    CGRectDivide(contentRect, &titleRect, &detailRect, 20, CGRectMinYEdge);
    
    detailRect = CGRectShrink(detailRect, 5, CGRectMinYEdge);
    
    _ququeButton.frame = CGRectCenter(btnRect, btnSize);
    _titleLabel.frame = titleRect;
    _detailLabel.frame = detailRect;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) setBusiniess:(YPBusiniess *)businiess
{
    if (_businiess != businiess) {
        _businiess = businiess;
        [self reloadContent];
        [self setNeedsLayout];
    }
}

- (void) reloadContent
{
    _titleLabel.text = _businiess.title;
    _detailLabel.text = _businiess.detail;
    
    if (YPCurrentQueue) {
        if ([YPCurrentQueue.identifier isEqualToString:self.businiess.identifier]) {
            [_ququeButton setTitle:@"取消排队" forState:UIControlStateNormal];
        }

    } else {
        [_ququeButton setTitle:@"开始排队" forState:UIControlStateNormal];
    }
    
}
@end
