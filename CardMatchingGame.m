//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Nelson Wittwer on 12/2/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import "CardMatchingGame.h"

static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.matched) {
        if (card.chosen) {
            card.chosen = NO;
        } else {
            Card *bestMatch = [self findBestMatchingCard:card];
            [self updateGameForCard:card andMatchedCard:bestMatch];
        }
    }
}

- (Card *) findBestMatchingCard:(Card *) card
{
    Card *bestMatch = [self.cards firstObject];
    
    for (Card * otherCard in self.cards){
        if ([card scoreForMatch:otherCard] > [card scoreForMatch:bestMatch]) {
            bestMatch = otherCard;
        }
    }
    
    return bestMatch;
}

- (void) updateGameForCard: (Card *)card andMatchedCard:(Card *) bestMatch {
    
    int scoreForMatchingCards = [card scoreForMatch:bestMatch];
    
    if (scoreForMatchingCards > 0) {
        self.score += scoreForMatchingCards * MATCH_BONUS;
        bestMatch.matched = YES;
        card.matched = YES;
    } else {
        self.score -= COST_TO_CHOOSE;
        bestMatch.chosen = NO;
    }
    card.chosen = YES;
}

- (instancetype) init
{
    return nil;
}
@end
