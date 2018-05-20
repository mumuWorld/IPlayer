//
//  MMMusicFileTVCell.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMMusicFileTVCell.h"
#import "MMMusicModel.h"

@interface MMMusicFileTVCell ()
@property (weak, nonatomic) IBOutlet UIImageView *musicHeadImg;
@property (weak, nonatomic) IBOutlet UILabel *musicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicCreaterLabel;


@end

@implementation MMMusicFileTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMusicModel:(MMMusicModel *)musicModel
{
    _musicModel = musicModel;
    self.musicNameLabel.text = musicModel.musicName;
    
}
@end
