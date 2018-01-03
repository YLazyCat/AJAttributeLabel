//
//  AJViewController.m
//  AJAttributeLabel
//
//  Created by YLazyCat on 01/03/2018.
//  Copyright (c) 2018 YLazyCat. All rights reserved.
//

#import "AJViewController.h"
#import <AJAttributedLabel.h>

@interface AJViewController ()<AJAttributedLabelDelegate>

@property (strong, nonatomic) IBOutlet AJAttributedLabel *typeLabel;

@property (strong, nonatomic) IBOutlet AJAttributedLabel *detailLabel;

@end

@implementation AJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    NSArray *typeArray = @[@"北京欢迎你", @"故宫", @"天安门", @"颐和园", @"八达岭长城", @"密云", @"古北水镇", @"动物园", @"博物馆", @"水立方", @"南锣鼓巷", @"王府井", @"北京烤鸭", @"酒吧一条街", @"清华大学", @"北大"].copy;
    //
    if (typeArray.count) {
        NSMutableAttributedString *content = [[NSMutableAttributedString alloc] init];
        for (NSString *string in typeArray) {
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
            [attributedString addAttribute:AJBackgroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, string.length)];
            [attributedString addAttribute:AJBackgroundColorCornerRadiusAttributeName value:@3 range:NSMakeRange(0, string.length)];
            UIEdgeInsets insets = UIEdgeInsetsMake(2, 5, 2, 5);
            [attributedString addAttribute:AJBackgroundColorInsetsAttributeName value:[NSValue valueWithUIEdgeInsets:insets] range:NSMakeRange(0, string.length)];
            
            AJAttributedLabel *label = [[AJAttributedLabel alloc]init];
            label.textColor = [UIColor darkTextColor];
            label.font = self.typeLabel.font;
            label.textAlignment = NSTextAlignmentCenter;
            label.attributedText = attributedString;
            CGSize labelSize = CGSizeMake(label.intrinsicContentSize.width + insets.left + insets.right, label.intrinsicContentSize.height + insets.top + insets.bottom);
            label.frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
            label.clipsToBounds = NO;
            AJTextAttachment *attachment = [AJTextAttachment attachmentWithCustomView:label viewSize:labelSize];
            [content appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
            if (string != typeArray.lastObject) {
                [content appendAttributedString:[[NSAttributedString alloc] initWithString:@"   "]];
            }
        }
        self.typeLabel.lineSpacing = 5;
        self.typeLabel.attributedText = content;
    } else {
        self.typeLabel.text = @"";
    }
    
    //
    NSMutableAttributedString *truncationToken = [[NSMutableAttributedString alloc] initWithString:@"...查看全部" attributes:@{NSLinkAttributeName:     [NSURL URLWithString:@"showAll"]}];
    self.detailLabel.attributedTruncationToken = truncationToken;
    self.detailLabel.delegate = self;
    self.detailLabel.text = @"ad金风科技啊可是地方拉开距离啊但是福晶科技埃里克放大镜阿道夫敬老卡惊世毒妃离开家阿凡达就卡了惊世毒妃啊稍等开房记录卡剑荡四方科技埃里克森接待访客案件的是否离开就爱看老师的缴费卡陆金所的法律框架盎司的附近蓝卡队三间房阿里可点击福利卡接待访客啊稍等开房记录卡机的福利卡了空间的风口浪尖啊稍等李开复啊稍等开房记录卡金士顿访客阿卡缴费卡拉加快速度九分裤辣椒水待付款";
}

- (void)attributedLabel:(AJAttributedLabel *)label didTapLinkWithURL:(NSURL *)URL
{
    if ([URL.absoluteString isEqualToString:@"showAll"]) {
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.text = @"ad金风科技啊可是地方拉开距离啊但是福晶科技埃里克放大镜阿道夫敬老卡惊世毒妃离开家阿凡达就卡了惊世毒妃啊稍等开房记录卡剑荡四方科技埃里克森接待访客案件的是否离开就爱看老师的缴费卡陆金所的法律框架盎司的附近蓝卡队三间房阿里可点击福利卡接待访客啊稍等开房记录卡机的福利卡了空间的风口浪尖啊稍等李开复啊稍等开房记录卡金士顿访客阿卡缴费卡拉加快速度九分裤辣椒水待付款";
    }
}


@end
