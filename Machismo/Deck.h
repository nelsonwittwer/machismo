//
//  Deck.h
//  Machismo
//
//  Created by Nelson Wittwer on 11/27/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop:(BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;

@end
