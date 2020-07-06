//
//  Card.h
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

// integer properties of cards
@property int face; // 0-12 (ace as 0)
@property int suit; // 0-3 (Clubs, Diamonds, Hearts, Spades)
@property int value; // 5,10,15 (0-9=5, 10-13=10, 0=15 [for High Ace])
@property int noOfFiftyTwo; // 0-51 (order by suit, then A-King)

// BOOL properties of cards
@property BOOL deck; // is it in the deck currently?
@property BOOL hand; // is it in a user's hand?
@property BOOL pile; // is it in the pile?
@property BOOL board; // is it on the board?
@property BOOL straight; // is it part of a straight?



@end

NS_ASSUME_NONNULL_END
