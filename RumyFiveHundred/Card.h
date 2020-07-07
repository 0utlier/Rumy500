//
//  Card.h
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    DECK = 0,
    HAND = 1,
    PILE = 2,
    BOARD = 3
} statusOfCard;

/* // 07.07.20 most likely will change to this. Using 'int' for now TODO
typedef enum {
    ACE = 0,
    TWO = 1,
    THREE = 2,
    FOUR = 3,
    FIVE = 4,
    SIX = 5,
    SEVEN = 6,
    EIGHT = 7,
    NINE = 8,
    TEN = 9,
    JACK = 10,
    QUEEN = 11,
    KING = 12
} face;

typedef enum {
    CLUB = 0,
    DIAMOND = 1,
    HEART = 2,
    SPADE = 3
} suit;


typedef enum {
    SINGLECARD = 5,
    FACECARD = 10,
    HIGHACE = 15
} valuePoint;
*/

@interface Card : NSObject

@property statusOfCard statusOfCard;

// integer properties of cards
@property int face; // 0-12 (ace as 0)
@property int suit; // 0-3 (Clubs, Diamonds, Hearts, Spades)
@property int valuePoint; // 5,10,15 (0-9=5, 10-13=10, 0=15 [for High Ace])
@property int noOfFiftyTwo; // 0-51 (order by suit, then A-King)

// BOOL properties of cards
/*// 07.06.20 I think best to assign using the definitions
@property BOOL deck; // is it in the deck currently?
@property BOOL hand; // is it in a user's hand?
@property BOOL pile; // is it in the pile?
@property BOOL board; // is it on the board?
*/

@property BOOL straight; // is it part of a straight?



@end

NS_ASSUME_NONNULL_END
