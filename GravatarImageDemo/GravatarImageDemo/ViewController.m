//
//  ViewController.m
//  GravatarImageDemo
//
//  Created by Rudd Fawcett on 12/10/13.
//  Copyright (c) 2013 Rudd Fawcett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) RFGravatarImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"RFGravatarImageView";
    
    _imageView = [[RFGravatarImageView alloc] initWithFrame:self.view.bounds];
    [_imageView setEmail:@"fakeEmailAddress@fakeEmailURL.com"];
    [_imageView forceDefault:YES withDefaultGravatar:DefaultGravatarMysteryMan];
    [_imageView setSize:1024];
    
    [self.view addSubview:_imageView];
    
    [_imageView loadGravatar];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToLoad)];
    
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tapToLoad {
    [_imageView setEmail:@"rexcfinn@gmail.com"];
    [_imageView setForceDefault:NO];
    [_imageView refreshGravatar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
