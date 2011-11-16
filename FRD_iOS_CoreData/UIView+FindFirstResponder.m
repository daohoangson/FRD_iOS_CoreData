//
//  UIView+FindFirstResponder.m
//  FRD_iOS_NumberOperator
//
//  Created by Dao Hoang Son on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)

- (UIView*)findFirstResponder
{
    if ([self isFirstResponder]) 
    {
        return self;
    }
    
    UIView *tmp = nil;
    UIView *subview;
    for (subview in [self subviews])
    {
        tmp = [subview findFirstResponder];
        if (tmp != nil) 
        {
            return tmp;
        }
    }
    
    return nil;
}

@end
