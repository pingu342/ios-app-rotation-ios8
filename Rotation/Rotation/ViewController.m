//
//  ViewController.m
//  Rotation
//
//  Created by Masakiyo on 2015/05/13.
//  Copyright (c) 2015年 jp.saka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.title = @"hoge";
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	NSLog(@"%@ willRotateToInterfaceOrientation", self.title);
	
	// iOS7端末で実行時
	//   呼ばれる
	// iOS8端末で実行時
	//   viewWillTransitionToSizeを実装済の場合は呼ばれない
	//   (ただし、もし親のViewControllerが未実装の場合は呼ばれる)
	//   viewWillTransitionToSizeを未実装の場合は呼ばれる
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	NSLog(@"%@ willAnimateRotationToInterfaceOrientation", self.title);
	
	// iOS7端末で実行時
	//   呼ばれる
	// iOS8端末で実行時
	//   viewWillTransitionToSizeを実装済の場合は呼ばれない
	//   viewWillTransitionToSizeを未実装の場合は呼ばれる
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	NSLog(@"%@ didRotateFromInterfaceOrientation", self.title);
	
	// iOS7端末で実行時
	//   呼ばれる
	// iOS8端末で実行時
	//   viewWillTransitionToSizeを実装済の場合は呼ばれない
	//   viewWillTransitionToSizeを未実装の場合は呼ばれる
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	NSLog(@"%@ viewWillTransitionToSize", self.title);
	
	// iOS7端末で実行時
	//   呼ばれない
	// iOS8端末で実行時
	//   呼ばれる
	
	[coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		NSLog(@"%@ viewWillTransitionToSize: animation", self.title);
	} completion:^(id <UIViewControllerTransitionCoordinatorContext>context) {
		NSLog(@"%@ viewWillTransitionToSize: completion", self.title);
	}];
}

@end
