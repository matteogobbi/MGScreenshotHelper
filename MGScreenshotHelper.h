//
//  MGScreenshotHelper.h
//
//  Created by admin on 19/05/2014.
//  Copyright (c) 2014 Matteo Gobbi (Voxygen). All rights reserved.
//

@interface MGScreenshotHelper.h

/* Get the screenshot of an UIView (so take just UIKit elements and not OpenGL or AVFoundation stuff. */
+ (UIImage *)getScreenshotFromView:(UIView *)captureView;

/* Get the screenshot of a determinate rect of an UIView, and scale it to the size that you want. */
+ (UIImage *)getScreenshotFromView:(UIView *)captureView withRect:(CGRect)captureRect andScaleToSize:(CGSize)newSize;

/* Get the screenshot of the screen (useful when you have UIKit elements and OpenGL or AVFoundation stuff */
+ (UIImage *)screenshotFromScreen;

/* Get the screenshot of a determinate rect of the screen, and scale it to the size that you want. */
+ (UIImage *)getScreenshotFromScreenWithRect:(CGRect)captureRect andScaleToSize:(CGSize)newSize;

#pragma mark - Other methods

/* Get a portion of an image */
+ (UIImage *)cropImage:(UIImage *)image withRect:(CGRect)rect;

/* Scale an image */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize;

@end
