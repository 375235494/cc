//
//  HMShowView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShowView.h"


@interface HMShowView()

@property(weak,nonatomic)IBOutlet  UIImageView *backimageV;

@property(weak,nonatomic)IBOutlet  UIImageView *qrcodeImageV;

@property(weak,nonatomic)IBOutlet UILabel * yqmcodeLable;
@end

@implementation HMShowView



-(void)awakeFromNib{
    [super awakeFromNib];
    

}

-(void)setQrcode:(NSString *)qrcode{
    
    _qrcode =qrcode;
    
    //[self.qrcodeImageV sd_setImageWithURL:[NSURL URLWithString:qrcode] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复滤镜的默认属性 (因为滤镜有可能保存上一次的属性)
    [filter setDefaults];
    
    // 3.将字符串转换成NSdata
    NSData *data  = [qrcode dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4.通过KVO设置滤镜, 传入data, 将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5.生成二维码
    CIImage *outputImage = [filter outputImage];
    
    UIImage *image = [UIImage  imageWithCIImage:outputImage];
    
    // 6.设置生成好得二维码到imageview上
    self.qrcodeImageV.image = image;
    
}

-(void)setYqmcode:(NSString *)yqmcode{
    
    _yqmcode = yqmcode;
    
    self.yqmcodeLable.text = yqmcode;
    
    self.yqmcodeLable.font = [UIFont systemFontOfSize:20];
}


+(instancetype)ShowView{
    
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMShowView" owner:self options:nil]lastObject];
}

@end
