//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Nelson Wittwer on 11/27/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
        }
    }
    return self;
}
@end
