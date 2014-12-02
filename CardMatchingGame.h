//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Nelson Wittwer on 12/2/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;
- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
