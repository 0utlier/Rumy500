//
//  ViewController.h
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
#import "Player.h"

@interface ViewController : UIViewController

@property NSMutableArray *allCards; // array of cards available to users
@property NSMutableArray *pileCards; // array of cards on the pile

@end

