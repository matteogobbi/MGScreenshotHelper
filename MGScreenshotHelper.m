//
//  MGScreenshotHelper.m
//
//  Created by admin on 19/05/2014.
//  Copyright (c) 2014 Matteo Gobbi. All rights reserved.
//

#import "MGScreenshotHelper.h"

@implementation MGScreenshotHelper

/* Get the screenshot of an UIView (so take just UIKit elements and not OpenGL or AVFoundation stuff. */
+ (UIImage *)getScreenshotFromView:(UIView *)captureView
{
    CGRect rect = [captureView bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [captureView.layer renderInContext:context];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return capturedImage;
}

/* Get the screenshot of a determinate rect of an UIView, and scale it to the size that you want. */
+ (UIImage *)getScreenshotFromView:(UIView *)captureView withRect:(CGRect)captureRect andScaleToSize:(CGSize)newSize
{
    UIImage *image = [[self class] getScreenshotFromView:captureView];
    image = [[self class] cropImage:image withRect:captureRect];
    image = [[self class] scaleImage:image toSize:newSize];
    
    return image;
}

/* Get the screenshot of the screen (useful when you have UIKit elements and OpenGL or AVFoundation stuff */
+ (UIImage *)screenshotFromScreen
{
    CGImageRef UIGetScreenImage(void);
    CGImageRef screen = UIGetScreenImage();
    UIImage* screenImage = [UIImage imageWithCGImage:screen];
    CGImageRelease(screen);
    
    return screenImage;
}

/* Get the screenshot of a determinate rect of the screen, and scale it to the size that you want. */
+ (UIImage *)getScreenshotFromScreenWithRect:(CGRect)captureRect andScaleToSize:(CGSize)newSize
{
    UIImage *image = [[self class] screenshotFromScreen];
    image = [[self class] cropImage:image withRect:captureRect];
    image = [[self class] scaleImage:image toSize:newSize];
    
    return image;
}


#pragma mark - Other methods

/* Get a portion of an image */
+ (UIImage *)cropImage:(UIImage *)image withRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *cropedImage = [UIImage imageWithCGImage:imageRef];
    
    return cropedImage;
}

/* Scale an image */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, YES, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
