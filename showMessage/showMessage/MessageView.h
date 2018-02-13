//
//  BIDNoteView.h
//  label上画横线
//
//  Created by eJiupi on 14-7-20.
//  Copyright (c) 2014年 Pan Li. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MessageView : NSObject

+ (MessageView*)sharedInstance;

- (void)showNoteView:(NSString*)noteText subView:(UIView*)subView;

-(void)setFont:(UIFont*)font;

@end
