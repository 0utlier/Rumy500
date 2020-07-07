//
//  Player.h
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    THROWN = 0,
    PICKED = 1,
} statusOfPlayer;

@interface Player : NSObject

@property statusOfPlayer statusOfPlayer;

// properties of Player
@property NSMutableArray *cardsInHand;
@property NSString *name;

@property int countCurrentCardsInHand; // necessary if we can get count of array [cardsInHand]?
@property int playerNumber;

@property BOOL currentTurn;
/*@property BOOL picked; // removed for ENUM instead
 @property BOOL thrown;
*/
@end

NS_ASSUME_NONNULL_END
