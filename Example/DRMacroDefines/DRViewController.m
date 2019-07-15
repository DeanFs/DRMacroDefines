//
//  DRViewController.m
//  DRMacroDefines
//
//  Created by Dean_F on 07/14/2019.
//  Copyright (c) 2019 Dean_F. All rights reserved.
//

#import "DRViewController.h"
#import <DRMacroDefines/DRMacroDefines.h>

@interface DRViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, copy) void (^block)(NSInteger tapCount);

@end

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    kDRWeakSelf
    self.block = ^(NSInteger tapCount) {
        weakSelf.resultLabel.text = [NSString stringWithFormat:@"tap%ld", tapCount];
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneBlock:(UIButton *)sender {
    sender.tag ++;
    kDR_SAFE_BLOCK(self.block, sender.tag);
}

- (IBAction)onClean:(id)sender {
    self.block = nil;
}

@end
