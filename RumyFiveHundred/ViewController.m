//
//  ViewController.m
//  RumyFiveHundred
//
//  Created by SATURN on 7/6/20.
//  Copyright © 2020 SATURN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// unsure if I need these as public. Most likely not 07.06.20
@property NSMutableArray *clubsArray; // array of cards in Clubs
@property NSMutableArray *diamondsArray; // array of cards in Diamonds
@property NSMutableArray *heartsArray; // array of cards in Hearts
@property NSMutableArray *spadesArray; // array of cards in Spades
@property NSMutableArray *printMeArray; // array of cards for printing in console [unimportant to codebase]

@property NSMutableArray *playersOfGame; // array of Players

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I love Objective C");

    // build deck
    [self create52of52];
    // create users // currently using 2 players 07.06.20
    [self createUser:3];
    [self dealInitialRound:7];
    [self showPlayerHand:1];
    //    [self printMe];
    
}

-(void)showPlayerHand:(int)forPlayerNumber {
    for (Card *myCard in [self.playersOfGame[forPlayerNumber] cardsInHand]) {
        NSLog(@"card%d is in player%d hand", myCard.face, [self.playersOfGame[forPlayerNumber] playerNumber]);
//        NSLog(@"player%d has cards %d",[self.playersOfGame[forPlayerNumber]playerNumber], [[[self.playersOfGame[forPlayerNumber] cardsInHand] objectAtIndex:5]face]);
    }

}

-(void)dealInitialRound:(int)amount {
    // determine how many cards need to be dealt
    NSInteger i = [self.playersOfGame count];
    i = amount*i;
    NSLog(@"%ld cards will be dealt, %d to each player",i, amount);
    
    
    // deal random card to each user
    // mark card inHand
    
    
    while (i>0) {
        for (Player *player in self.playersOfGame) {
            [player.cardsInHand addObject:[self.allCards objectAtIndex:i] ];
            [[self.allCards objectAtIndex:i] setStatusOfCard:HAND];
//            NSLog(@"valuePointfor status = %d",[[self.allCards objectAtIndex:i]statusOfCard]);
            
            // NSLog(@"BOOL Value: %d",[[self.allCards objectAtIndex:i]deck]);
            // NSLog(@"player%d has %@ cards",player.playerNumber,player.cardsInHand);
            NSLog(@"Player%d has %ld cards in their hand", player.playerNumber, [player.cardsInHand count]);
            i--;
        }
    }
    
    /* // display card's face's number
     for (Card *myCard in [self.playersOfGame[1] cardsInHand]) {
        NSLog(@"card%d is added", myCard.face);
    }*/

    // deal random card to pile
    // mark card as inPile, change inDeck
    
}

#pragma mark - CREATE USER

-(void)createUser:(int)playersCount {
    self.playersOfGame = [[NSMutableArray alloc]init];
    
    for (playersCount=playersCount; playersCount > 0; playersCount--) {
        Player *player1 = [[Player alloc]init];
        // hardcoded for now, but will need prompt for name. Fixed outside for loop currently 07.06.20
        player1.name = @"JD";
        player1.playerNumber = playersCount;
        player1.thrown = YES;
        player1.cardsInHand = [[NSMutableArray alloc]init];
        NSLog(@"add a new user: %d with name: %@", playersCount, player1.name);
        [self.playersOfGame addObject:player1];
    }
    for (Player *playerN in self.playersOfGame) {
        NSLog(@"player%d is added", playerN.playerNumber);
    }
}

#pragma mark - CREATE CARDS

-(void)create52of52 {
    // create each suit
    [self createClubs];
    [self createDiamonds];
    [self createHearts];
    [self createSpades];
    
    // add each suit to array of all cards
    self.allCards = [[NSMutableArray alloc]init];
    [self.allCards addObjectsFromArray: self.clubsArray];
    [self.allCards addObjectsFromArray: self.diamondsArray];
    [self.allCards addObjectsFromArray: self.heartsArray];
    [self.allCards addObjectsFromArray: self.spadesArray];
    
    /* //for ensuring all 52 cards are in the array // unused 07.06.20
     for (Card *myCard in self.allCards) {
     NSLog(@"%d", myCard.noOfFiftyTwo);
     }
     */
    
    /* // for sorting if necessary // unused 07.06.20
     cardsForSet = [NSMutableArray arrayWithArray:[cardsForSet sortedArrayUsingSelector: @selector(compare:)]];
     [cardsForSet sortedArrayUsingSelector: @selector(compare:)];
     */
}

-(void)createClubs {
    Card *aceClubs = [[Card alloc]init];
    aceClubs.suit = 0;
    aceClubs.face = 0;
    aceClubs.valuePoint = 5;
    aceClubs.noOfFiftyTwo = 0;
    // BOOLS assign
    aceClubs.statusOfCard = DECK;
    Card *twoClubs = [[Card alloc]init];
    twoClubs.suit = 0;
    twoClubs.face = 1;
    twoClubs.valuePoint = 5;
    twoClubs.noOfFiftyTwo = 1;
    // BOOLS assign
    twoClubs.statusOfCard = DECK;
    Card *threeClubs = [[Card alloc]init];
    threeClubs.suit = 0;
    threeClubs.face = 2;
    threeClubs.valuePoint = 5;
    threeClubs.noOfFiftyTwo = 2;
    // BOOLS assign
    threeClubs.statusOfCard = DECK;
    Card *fourClubs = [[Card alloc]init];
    fourClubs.suit = 0;
    fourClubs.face = 3;
    fourClubs.valuePoint = 5;
    fourClubs.noOfFiftyTwo = 3;
    // BOOLS assign
    fourClubs.statusOfCard = DECK;
    Card *fiveClubs = [[Card alloc]init];
    fiveClubs.suit = 0;
    fiveClubs.face = 4;
    fiveClubs.valuePoint = 5;
    fiveClubs.noOfFiftyTwo = 4;
    fiveClubs.statusOfCard = DECK;
    Card *sixClubs = [[Card alloc]init];
    sixClubs.suit = 0;
    sixClubs.face = 5;
    sixClubs.valuePoint = 5;
    sixClubs.noOfFiftyTwo = 5;
    sixClubs.statusOfCard = DECK;
    Card *sevenClubs = [[Card alloc]init];
    sevenClubs.suit = 0;
    sevenClubs.face = 6;
    sevenClubs.valuePoint = 5;
    sevenClubs.noOfFiftyTwo = 6;
    sevenClubs.statusOfCard = DECK;
    Card *eightClubs = [[Card alloc]init];
    eightClubs.suit = 0;
    eightClubs.face = 7;
    eightClubs.valuePoint = 5;
    eightClubs.noOfFiftyTwo = 7;
    eightClubs.statusOfCard = DECK;
    Card *nineClubs = [[Card alloc]init];
    nineClubs.suit = 0;
    nineClubs.face = 8;
    nineClubs.valuePoint = 5;
    nineClubs.noOfFiftyTwo = 8;
    nineClubs.statusOfCard = DECK;
    Card *tenClubs = [[Card alloc]init];
    tenClubs.suit = 0;
    tenClubs.face = 9;
    tenClubs.valuePoint = 5;
    tenClubs.noOfFiftyTwo = 9;
    tenClubs.statusOfCard = DECK;
    Card *jackClubs = [[Card alloc]init];
    jackClubs.suit = 0;
    jackClubs.face = 10;
    jackClubs.valuePoint = 10;
    jackClubs.noOfFiftyTwo = 10;
    jackClubs.statusOfCard = DECK;
    Card *queenClubs = [[Card alloc]init];
    queenClubs.suit = 0;
    queenClubs.face = 11;
    queenClubs.valuePoint = 10;
    queenClubs.noOfFiftyTwo = 11;
    queenClubs.statusOfCard = DECK;
    Card *kingClubs = [[Card alloc]init];
    kingClubs.suit = 0;
    kingClubs.face = 12;
    kingClubs.valuePoint = 10;
    kingClubs.noOfFiftyTwo = 12;
    kingClubs.statusOfCard = DECK;
    
    self.clubsArray = [[NSMutableArray alloc]initWithObjects:aceClubs, twoClubs, threeClubs, fourClubs, fiveClubs, sixClubs, sevenClubs, eightClubs, nineClubs, tenClubs, jackClubs, queenClubs, kingClubs, nil];
    //    NSLog(@"%@", self.clubsArray);
}
-(void)createDiamonds {
    Card *aceDiamonds = [[Card alloc]init];
    aceDiamonds.suit = 0;
    aceDiamonds.face = 0;
    aceDiamonds.valuePoint = 5;
    aceDiamonds.noOfFiftyTwo = 13;
    aceDiamonds.statusOfCard = DECK;
    Card *twoDiamonds = [[Card alloc]init];
    twoDiamonds.suit = 0;
    twoDiamonds.face = 1;
    twoDiamonds.valuePoint= 5;
    twoDiamonds.noOfFiftyTwo = 14;
    twoDiamonds.statusOfCard = DECK;
    Card *threeDiamonds = [[Card alloc]init];
    threeDiamonds.suit = 0;
    threeDiamonds.face = 2;
    threeDiamonds.valuePoint= 5;
    threeDiamonds.noOfFiftyTwo = 15;
    threeDiamonds.statusOfCard = DECK;
    Card *fourDiamonds = [[Card alloc]init];
    fourDiamonds.suit = 0;
    fourDiamonds.face = 3;
    fourDiamonds.valuePoint= 5;
    fourDiamonds.noOfFiftyTwo = 16;
    fourDiamonds.statusOfCard = DECK;
    Card *fiveDiamonds = [[Card alloc]init];
    fiveDiamonds.suit = 0;
    fiveDiamonds.face = 4;
    fiveDiamonds.valuePoint= 5;
    fiveDiamonds.noOfFiftyTwo = 17;
    fiveDiamonds.statusOfCard = DECK;
    Card *sixDiamonds = [[Card alloc]init];
    sixDiamonds.suit = 0;
    sixDiamonds.face = 5;
    sixDiamonds.valuePoint= 5;
    sixDiamonds.noOfFiftyTwo = 18;
    sixDiamonds.statusOfCard = DECK;
    Card *sevenDiamonds = [[Card alloc]init];
    sevenDiamonds.suit = 0;
    sevenDiamonds.face = 6;
    sevenDiamonds.valuePoint= 5;
    sevenDiamonds.noOfFiftyTwo = 19;
    sevenDiamonds.statusOfCard = DECK;
    Card *eightDiamonds = [[Card alloc]init];
    eightDiamonds.suit = 0;
    eightDiamonds.face = 7;
    eightDiamonds.valuePoint= 5;
    eightDiamonds.noOfFiftyTwo = 20;
    eightDiamonds.statusOfCard = DECK;
    Card *nineDiamonds = [[Card alloc]init];
    nineDiamonds.suit = 0;
    nineDiamonds.face = 8;
    nineDiamonds.valuePoint= 5;
    nineDiamonds.noOfFiftyTwo = 21;
    nineDiamonds.statusOfCard = DECK;
    Card *tenDiamonds = [[Card alloc]init];
    tenDiamonds.suit = 0;
    tenDiamonds.face = 9;
    tenDiamonds.valuePoint= 5;
    tenDiamonds.noOfFiftyTwo = 22;
    tenDiamonds.statusOfCard = DECK;
    Card *jackDiamonds = [[Card alloc]init];
    jackDiamonds.suit = 0;
    jackDiamonds.face = 10;
    jackDiamonds.valuePoint= 10;
    jackDiamonds.noOfFiftyTwo = 23;
    jackDiamonds.statusOfCard = DECK;
    Card *queenDiamonds = [[Card alloc]init];
    queenDiamonds.suit = 0;
    queenDiamonds.face = 11;
    queenDiamonds.valuePoint= 10;
    queenDiamonds.noOfFiftyTwo = 24;
    queenDiamonds.statusOfCard = DECK;
    Card *kingDiamonds = [[Card alloc]init];
    kingDiamonds.suit = 0;
    kingDiamonds.face = 12;
    kingDiamonds.valuePoint= 10;
    kingDiamonds.noOfFiftyTwo = 25;
    kingDiamonds.statusOfCard = DECK;
    
    self.diamondsArray = [[NSMutableArray alloc]initWithObjects:aceDiamonds, twoDiamonds, threeDiamonds, fourDiamonds, fiveDiamonds, sixDiamonds, sevenDiamonds, eightDiamonds, nineDiamonds, tenDiamonds, jackDiamonds, queenDiamonds, kingDiamonds, nil];
    //    NSLog(@"%@", self.diamondsArray);
    
}
-(void)createHearts {
    Card *aceHearts = [[Card alloc]init];
    aceHearts.suit = 0;
    aceHearts.face = 0;
    aceHearts.valuePoint= 5;
    aceHearts.noOfFiftyTwo = 26;
    aceHearts.statusOfCard = DECK;
    Card *twoHearts = [[Card alloc]init];
    twoHearts.suit = 0;
    twoHearts.face = 1;
    twoHearts.valuePoint= 5;
    twoHearts.noOfFiftyTwo = 27;
    twoHearts.statusOfCard = DECK;
    Card *threeHearts = [[Card alloc]init];
    threeHearts.suit = 0;
    threeHearts.face = 2;
    threeHearts.valuePoint= 5;
    threeHearts.noOfFiftyTwo = 28;
    threeHearts.statusOfCard = DECK;
    Card *fourHearts = [[Card alloc]init];
    fourHearts.suit = 0;
    fourHearts.face = 3;
    fourHearts.valuePoint= 5;
    fourHearts.noOfFiftyTwo = 29;
    fourHearts.statusOfCard = DECK;
    Card *fiveHearts = [[Card alloc]init];
    fiveHearts.suit = 0;
    fiveHearts.face = 4;
    fiveHearts.valuePoint= 5;
    fiveHearts.noOfFiftyTwo = 30;
    fiveHearts.statusOfCard = DECK;
    Card *sixHearts = [[Card alloc]init];
    sixHearts.suit = 0;
    sixHearts.face = 5;
    sixHearts.valuePoint= 5;
    sixHearts.noOfFiftyTwo = 31;
    sixHearts.statusOfCard = DECK;
    Card *sevenHearts = [[Card alloc]init];
    sevenHearts.suit = 0;
    sevenHearts.face = 6;
    sevenHearts.valuePoint= 5;
    sevenHearts.noOfFiftyTwo = 32;
    sevenHearts.statusOfCard = DECK;
    Card *eightHearts = [[Card alloc]init];
    eightHearts.suit = 0;
    eightHearts.face = 7;
    eightHearts.valuePoint= 5;
    eightHearts.noOfFiftyTwo = 33;
    eightHearts.statusOfCard = DECK;
    Card *nineHearts = [[Card alloc]init];
    nineHearts.suit = 0;
    nineHearts.face = 8;
    nineHearts.valuePoint= 5;
    nineHearts.noOfFiftyTwo = 34;
    nineHearts.statusOfCard = DECK;
    Card *tenHearts = [[Card alloc]init];
    tenHearts.suit = 0;
    tenHearts.face = 9;
    tenHearts.valuePoint= 5;
    tenHearts.noOfFiftyTwo = 35;
    tenHearts.statusOfCard = DECK;
    Card *jackHearts = [[Card alloc]init];
    jackHearts.suit = 0;
    jackHearts.face = 10;
    jackHearts.valuePoint= 10;
    jackHearts.noOfFiftyTwo = 36;
    jackHearts.statusOfCard = DECK;
    Card *queenHearts = [[Card alloc]init];
    queenHearts.suit = 0;
    queenHearts.face = 11;
    queenHearts.valuePoint= 10;
    queenHearts.noOfFiftyTwo = 37;
    queenHearts.statusOfCard = DECK;
    Card *kingHearts = [[Card alloc]init];
    kingHearts.suit = 0;
    kingHearts.face = 12;
    kingHearts.valuePoint= 10;
    kingHearts.noOfFiftyTwo = 38;
    kingHearts.statusOfCard = DECK;
    
    self.heartsArray = [[NSMutableArray alloc]initWithObjects:aceHearts, twoHearts, threeHearts, fourHearts, fiveHearts, sixHearts, sevenHearts, eightHearts, nineHearts, tenHearts, jackHearts, queenHearts, kingHearts, nil];
    //    NSLog(@"%@", self.heartsArray);
    
    
}
-(void)createSpades {
    Card *aceSpades = [[Card alloc]init];
    aceSpades.suit = 0;
    aceSpades.face = 0;
    aceSpades.valuePoint= 5;
    aceSpades.noOfFiftyTwo = 39;
    aceSpades.statusOfCard = DECK;
    Card *twoSpades = [[Card alloc]init];
    twoSpades.suit = 0;
    twoSpades.face = 1;
    twoSpades.valuePoint= 5;
    twoSpades.noOfFiftyTwo = 40;
    twoSpades.statusOfCard = DECK;
    Card *threeSpades = [[Card alloc]init];
    threeSpades.suit = 0;
    threeSpades.face = 2;
    threeSpades.valuePoint= 5;
    threeSpades.noOfFiftyTwo = 41;
    threeSpades.statusOfCard = DECK;
    Card *fourSpades = [[Card alloc]init];
    fourSpades.suit = 0;
    fourSpades.face = 3;
    fourSpades.valuePoint= 5;
    fourSpades.noOfFiftyTwo = 42;
    fourSpades.statusOfCard = DECK;
    Card *fiveSpades = [[Card alloc]init];
    fiveSpades.suit = 0;
    fiveSpades.face = 4;
    fiveSpades.valuePoint= 5;
    fiveSpades.noOfFiftyTwo = 43;
    fiveSpades.statusOfCard = DECK;
    Card *sixSpades = [[Card alloc]init];
    sixSpades.suit = 0;
    sixSpades.face = 5;
    sixSpades.valuePoint= 5;
    sixSpades.noOfFiftyTwo = 44;
    sixSpades.statusOfCard = DECK;
    Card *sevenSpades = [[Card alloc]init];
    sevenSpades.suit = 0;
    sevenSpades.face = 6;
    sevenSpades.valuePoint= 5;
    sevenSpades.noOfFiftyTwo = 45;
    sevenSpades.statusOfCard = DECK;
    Card *eightSpades = [[Card alloc]init];
    eightSpades.suit = 0;
    eightSpades.face = 7;
    eightSpades.valuePoint= 5;
    eightSpades.noOfFiftyTwo = 46;
    eightSpades.statusOfCard = DECK;
    Card *nineSpades = [[Card alloc]init];
    nineSpades.suit = 0;
    nineSpades.face = 8;
    nineSpades.valuePoint= 5;
    nineSpades.noOfFiftyTwo = 47;
    nineSpades.statusOfCard = DECK;
    Card *tenSpades = [[Card alloc]init];
    tenSpades.suit = 0;
    tenSpades.face = 9;
    tenSpades.valuePoint= 5;
    tenSpades.noOfFiftyTwo = 48;
    tenSpades.statusOfCard = DECK;
    Card *jackSpades = [[Card alloc]init];
    jackSpades.suit = 0;
    jackSpades.face = 10;
    jackSpades.valuePoint= 10;
    jackSpades.noOfFiftyTwo = 49;
    jackSpades.statusOfCard = DECK;
    Card *queenSpades = [[Card alloc]init];
    queenSpades.suit = 0;
    queenSpades.face = 11;
    queenSpades.valuePoint= 10;
    queenSpades.noOfFiftyTwo = 50;
    queenSpades.statusOfCard = DECK;
    Card *kingSpades = [[Card alloc]init];
    kingSpades.suit = 0;
    kingSpades.face = 12;
    kingSpades.valuePoint= 10;
    kingSpades.noOfFiftyTwo = 51;
    kingSpades.statusOfCard = DECK;
    
    self.spadesArray = [[NSMutableArray alloc]initWithObjects:aceSpades, twoSpades, threeSpades, fourSpades, fiveSpades, sixSpades, sevenSpades, eightSpades, nineSpades, tenSpades, jackSpades, queenSpades, kingSpades, nil];
    //        NSLog(@"%@", self.spadesArray);
    
    
}


-(void)printMe {
    self.printMeArray = [[NSMutableArray alloc]initWithObjects:@"ace", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"jack", @"queen", @"king", nil];
    //    NSLog(@"array = %@", self.printMeArray);
    
    NSString *currentSuit = @"Clubs";//@"Diamonds";//@"Hearts";//@"Spades";//
    int face = 0;
    int valuePoint= 5;
    int noOf52 = 13;
    
    
    // for outputting every named card
    for (NSString *cardNumber in self.printMeArray) {
        NSLog(@"%@%@, ",cardNumber, currentSuit);
    }
    
    // for outputting every card with values
    for (NSString *cardNumber in self.printMeArray) {
        NSLog(@"%@%@, ",cardNumber, currentSuit);
        
        NSLog(@"Card *%@%@ = [[Card alloc]init];", cardNumber, currentSuit);
        NSLog(@"// int values assigned");
        NSLog(@"%@%@.suit = 0;", cardNumber, currentSuit);
        NSLog(@"%@%@.face = %d;", cardNumber, currentSuit, face);
        NSLog(@"%@%@.valuePoint = %d;", cardNumber, currentSuit, valuePoint);
        NSLog(@"%@%@.noOfFiftyTwo = %d;", cardNumber, currentSuit, noOf52);
        NSLog(@"// BOOLS valuePointassigned");
        NSLog(@"%@%@.statusOfCard = DECK;", cardNumber, currentSuit);
        
        if ([cardNumber isEqualToString:@"ten"]) {
            valuePoint= 10;
        }
        face++;
        noOf52++;
        
    }
}



@end
