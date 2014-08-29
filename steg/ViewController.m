//
//  ViewController.m
//  steg
//
//  Created by John Rogers on 8/25/14.
//  Copyright (c) 2014 metacupcake. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <SteganographerDelegate>

@end

@implementation ViewController

- (void)imageProcessorFinishedProcessingWithImage:(UIImage *)outputImage {
    self.imageView.image = outputImage;
    NSLog(@"%@",[[Steganographer sharedProcessor] decodeMessage:outputImage]);
}

- (void)viewDidLoad {
    
    UIImage *image = [UIImage imageNamed:@"rjf_rooster.jpg"];
    self.imageView.image = image;
    
    [Steganographer sharedProcessor].delegate = self;
    [[Steganographer sharedProcessor] embedMessage:image message:@"I love Terry Gross."];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


