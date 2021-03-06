//
//  MessageView.m
//
//
//  Created by xjz on 14-7-20.
//  Copyright (c) 2014年 Pan Li. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MessageView.h"


@interface MessageView ()

//@property (strong, nonatomic) UIView *subView;

@property (strong, nonatomic) UIView *noteView;
@property (strong, nonatomic) UILabel *noteLable;

@property (strong, nonatomic) NSTimer *timer;

@end


@implementation MessageView

+ (MessageView*)sharedInstance
{
    static MessageView* instance = nil;
    if (instance == nil)
    {
        instance = [[MessageView alloc] init];
    }
    return instance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSInteger w = 220;
        NSInteger h = 50;
        NSInteger x = ([UIScreen mainScreen].bounds.size.width-w)/2;
        NSInteger y = [UIScreen mainScreen].bounds.size.height-60-h;
       
        self.noteView = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        self.noteView.layer.cornerRadius = 5.0;
        self.noteView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        
        self.noteLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        self.noteLable.text = @"亲，没有更多商品信息了哦";
        self.noteLable.numberOfLines=2;
        self.noteLable.textColor = [UIColor whiteColor];
        self.noteLable.textAlignment = NSTextAlignmentCenter;
        self.noteLable.backgroundColor = [UIColor clearColor];
        [self.noteView addSubview:self.noteLable];
    }
    return self;
}

-(void)setFont:(UIFont*)font
{
    self.noteLable.font=font;
}

- (void)showNoteView:(NSString*)noteText subView:(UIView*)subView
{
    if (self.timer != nil && [self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    if (noteText != nil && [noteText length] > 0)
        self.noteLable.text = noteText;
    
    [subView addSubview:self.noteView];
    [subView layoutIfNeeded];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
}

- (void)timerFired:(NSTimer*)timer
{
    [self.timer invalidate];
    //[self setFont:[BIDDeviceFont font_15]];
    [self setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    self.timer = nil;
    [self.noteView removeFromSuperview];
}

@end
