//
//  Player.h
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

// properties of Player
@property NSMutableArray *cardsInHand;
@property NSString *name;

@property int countCurrentCardsInHand; // necessary if we can get count of array [cardsInHand]?
@property int playerNumber;

@property BOOL picked;
@property BOOL thrown;

@end

NS_ASSUME_NONNULL_END
