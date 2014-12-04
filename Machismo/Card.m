//
//  Card.m
//  Machismo
//
//  Created by Nelson Wittwer on 11/27/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)scoreForMatch:(Card *)otherCard
{
    return ([otherCard.contents isEqualToString:self.contents]) ? 1 :0;
}

@end
