//
//  PlayingCard.m
//  Machismo
//
//  Created by Nelson Wittwer on 11/27/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *) rankStrings
{
   return @[
            @"?",
            @"A",
            @"2",
            @"3",
            @"4",
            @"5",
            @"6",
            @"7",
            @"8",
            @"9",
            @"10",
            @"J",
            @"Q",
            @"K",
            ];
}
+ (NSArray *) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }

- (bool) cardMatchesSuit: (PlayingCard *)otherCard {
    return [self.suit isEqualToString:otherCard.suit];
}

- (bool) cardMatchesRank: (PlayingCard *)otherCard {
    return self.rank == otherCard.rank;
}

- (int)scoreForMatch:(PlayingCard *)otherCard
{
    int score = 0;
    
    if ([self cardMatchesRank:otherCard]){
        score = 4;
    } else if ([self cardMatchesSuit:otherCard]) {
        score = 1;
    }
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
@end
