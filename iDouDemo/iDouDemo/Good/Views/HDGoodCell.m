//
//  HDGoodCell.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

//http://120.77.255.14:8080

@interface HDGoodCell ()

@property (strong, nonatomic) UIImageView *picImV;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *curPriceLabel;
@property (strong, nonatomic) UILabel *origPriceLabel;
@property (strong, nonatomic) UILabel *descripLabel;

@end

@implementation HDGoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
        [self setupLayout];
    }
    return self;

}

- (void)setupLayout {
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //1995 × 1166
    [self.picImV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(self);
        make.height.mas_equalTo((1166 * screenW) / 1995);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(12);
        make.trailing.equalTo(self).offset(-8);
        make.top.mas_equalTo(self.picImV.mas_bottom);
        make.height.mas_equalTo(26);
    }];
    
    [self.curPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(26);
    }];
    
    [self.origPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.curPriceLabel.mas_trailing).offset(8);
        make.bottom.mas_equalTo(self.curPriceLabel.mas_bottom);
        make.height.mas_equalTo(22);
    }];
    
    [self.descripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.top.mas_equalTo(self.curPriceLabel.mas_bottom);
        make.bottom.mas_equalTo(self).offset(-8);
    }];

    
  
}

- (void)setupSubviews {

    [self addSubview:self.picImV];
    [self addSubview:self.curPriceLabel];
    [self addSubview:self.origPriceLabel];
    [self addSubview:self.descripLabel];
    [self addSubview:self.titleLabel];
}

- (void)setGoodItem:(HDGoodItem *)goodItem {

    _goodItem = goodItem;
    NSString *picUrl = [NSString stringWithFormat:@"http://120.77.255.14:8080%@",[goodItem.images objectAtIndex:1]];
    [self.picImV sd_setImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:nil];
    self.titleLabel.text = goodItem.title;
    self.curPriceLabel.text = goodItem.price;
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName:@1};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:goodItem.price attributes:attribtDic];
    self.origPriceLabel.attributedText = attribtStr;
    self.descripLabel.text = goodItem.desc;
}

#pragma mark- Access
- (UIImageView *)picImV {
    if (!_picImV) {
        _picImV = [[UIImageView alloc] init];
    }
    
    return _picImV;
}

- (UILabel *)titleLabel {

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:20];

    }
    
    return  _titleLabel;
}

- (UILabel *)curPriceLabel {

    if (!_curPriceLabel) {
        _curPriceLabel = [[UILabel alloc] init];
        _curPriceLabel.font = [UIFont italicSystemFontOfSize:20];
        _curPriceLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _curPriceLabel;
}

//origPriceLabel

- (UILabel *)origPriceLabel {
    
    if (!_origPriceLabel) {
        _origPriceLabel = [[UILabel alloc] init];
        _origPriceLabel.textColor = [UIColor lightGrayColor];
        _origPriceLabel.font = [UIFont italicSystemFontOfSize:14];
        _origPriceLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _origPriceLabel;
}


- (UILabel *)descripLabel {

    if (!_descripLabel) {
        _descripLabel = [[UILabel alloc] init];
        _descripLabel.numberOfLines = 0;
        _descripLabel.font = [UIFont systemFontOfSize:13];
        _descripLabel.textColor = [UIColor grayColor];
        _descripLabel.lineBreakMode = NSLineBreakByClipping;
    }
    return _descripLabel;
}


@end
