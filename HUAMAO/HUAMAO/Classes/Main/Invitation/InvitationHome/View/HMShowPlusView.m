//
//  HMShowPlusView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/6.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShowPlusView.h"

@interface HMShowPlusView()


@property(weak,nonatomic)IBOutlet UIImageView *qrcodeImageV;

@property(weak,nonatomic)IBOutlet UILabel * yqmcodeLable;


@end

@implementation HMShowPlusView

+(instancetype)ShowView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMShowPlusView" owner:self options:nil]lastObject];
}

-(void)setQrcode:(NSString *)qrcode{
    
//    _qrcode =qrcode;
//    
//    [self.qrcodeImageV sd_setImageWithURL:[NSURL URLWithString:qrcode] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    _qrcode =qrcode;

    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复滤镜的默认属性 (因为滤镜有可能保存上一次的属性)
    [filter setDefaults];
    
    // 3.将字符串转换成NSdata
    NSData *data  = [qrcode dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4.通过KVO设置滤镜, 传入data, 将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5.生成二维码
    CIImage *outputImage = [filter outputImage];
    
//    UIImage *image = [UIImage  imageWithCIImage:outputImage];
    
    UIImage *image = [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:135];
    
    // 6.设置生成好得二维码到imageview上
    self.qrcodeImageV.image = image;
}

-(void)setYqmcode:(NSString *)yqmcode{
    
    _yqmcode = yqmcode;
    
    self.yqmcodeLable.text = yqmcode;
    
    self.yqmcodeLable.font = [UIFont systemFontOfSize:21];
}


- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}



@end
