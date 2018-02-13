//
//  ViewController.m
//  showMessage
//
//  Created by zlw on 2018/2/12.
//  Copyright © 2018年 xujinzhong. All rights reserved.
//

#import "ViewController.h"

#import "MessageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickeEvent:(id)sender {
    [[MessageView sharedInstance] showNoteView:@"Display sucessful" subView:self.view];
}



@end
