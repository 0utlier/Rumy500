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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self sortCards];
    [self create13of52];
    //    [self printMe];
    
}

#pragma mark - FUCKING AROUND DELETE
-(void)sortCards {
    NSMutableArray *cardsForSet = [[NSMutableArray alloc]initWithObjects:@45,@2,@0,@43,@44, nil];
    NSLog(@"my cards are %@", cardsForSet);
    
    cardsForSet = [NSMutableArray arrayWithArray:[cardsForSet sortedArrayUsingSelector: @selector(compare:)]];
    [cardsForSet sortedArrayUsingSelector: @selector(compare:)];
    NSLog(@"my SORTED second cards are %@", cardsForSet);
    
}

-(void)create13of52 {
    [self createClubs];
    [self createDiamonds];
    [self createHearts];
    [self createSpades];
    
    // add to array
    self.allCards = [[NSMutableArray alloc]init];
    [self.allCards addObjectsFromArray: self.clubsArray];
    [self.allCards addObjectsFromArray: self.diamondsArray];
    [self.allCards addObjectsFromArray: self.heartsArray];
    [self.allCards addObjectsFromArray: self.spadesArray];
    
    for (Card *myCard in self.allCards) {
        NSLog(@"%d", myCard.noOfFiftyTwo);
    }
}

-(void)createClubs {
    Card *aceClubs = [[Card alloc]init];
    // int values assigned
    aceClubs.suit = 0;
    aceClubs.face = 0;
    aceClubs.value = 5;
    aceClubs.noOfFiftyTwo = 0;
    // BOOLS assign
    aceClubs.deck = YES;
    Card *twoClubs = [[Card alloc]init];
    // int values assigned
    twoClubs.suit = 0;
    twoClubs.face = 1;
    twoClubs.value = 5;
    twoClubs.noOfFiftyTwo = 1;
    // BOOLS assign
    twoClubs.deck = YES;
    Card *threeClubs = [[Card alloc]init];
    // int values assigned
    threeClubs.suit = 0;
    threeClubs.face = 2;
    threeClubs.value = 5;
    threeClubs.noOfFiftyTwo = 2;
    // BOOLS assign
    threeClubs.deck = YES;
    Card *fourClubs = [[Card alloc]init];
    // int values assigned
    fourClubs.suit = 0;
    fourClubs.face = 3;
    fourClubs.value = 5;
    fourClubs.noOfFiftyTwo = 3;
    // BOOLS assign
    fourClubs.deck = YES;
    Card *fiveClubs = [[Card alloc]init];
    // int values assigned
    fiveClubs.suit = 0;
    fiveClubs.face = 4;
    fiveClubs.value = 5;
    fiveClubs.noOfFiftyTwo = 4;
    // BOOLS value assigned
    fiveClubs.deck = YES;
    Card *sixClubs = [[Card alloc]init];
    // int values assigned
    sixClubs.suit = 0;
    sixClubs.face = 5;
    sixClubs.value = 5;
    sixClubs.noOfFiftyTwo = 5;
    // BOOLS value assigned
    sixClubs.deck = YES;
    Card *sevenClubs = [[Card alloc]init];
    // int values assigned
    sevenClubs.suit = 0;
    sevenClubs.face = 6;
    sevenClubs.value = 5;
    sevenClubs.noOfFiftyTwo = 6;
    // BOOLS value assigned
    sevenClubs.deck = YES;
    Card *eightClubs = [[Card alloc]init];
    // int values assigned
    eightClubs.suit = 0;
    eightClubs.face = 7;
    eightClubs.value = 5;
    eightClubs.noOfFiftyTwo = 7;
    // BOOLS value assigned
    eightClubs.deck = YES;
    Card *nineClubs = [[Card alloc]init];
    // int values assigned
    nineClubs.suit = 0;
    nineClubs.face = 8;
    nineClubs.value = 5;
    nineClubs.noOfFiftyTwo = 8;
    // BOOLS value assigned
    nineClubs.deck = YES;
    Card *tenClubs = [[Card alloc]init];
    // int values assigned
    tenClubs.suit = 0;
    tenClubs.face = 9;
    tenClubs.value = 5;
    tenClubs.noOfFiftyTwo = 9;
    // BOOLS value assigned
    tenClubs.deck = YES;
    Card *jackClubs = [[Card alloc]init];
    // int values assigned
    jackClubs.suit = 0;
    jackClubs.face = 10;
    jackClubs.value = 10;
    jackClubs.noOfFiftyTwo = 10;
    // BOOLS value assigned
    jackClubs.deck = YES;
    Card *queenClubs = [[Card alloc]init];
    // int values assigned
    queenClubs.suit = 0;
    queenClubs.face = 11;
    queenClubs.value = 10;
    queenClubs.noOfFiftyTwo = 11;
    // BOOLS value assigned
    queenClubs.deck = YES;
    Card *kingClubs = [[Card alloc]init];
    // int values assigned
    kingClubs.suit = 0;
    kingClubs.face = 12;
    kingClubs.value = 10;
    kingClubs.noOfFiftyTwo = 12;
    // BOOLS value assigned
    kingClubs.deck = YES;
    
    self.clubsArray = [[NSMutableArray alloc]initWithObjects:aceClubs, twoClubs, threeClubs, fourClubs, fiveClubs, sixClubs, sevenClubs, eightClubs, nineClubs, tenClubs, jackClubs, queenClubs, kingClubs, nil];
    NSLog(@"%@", self.clubsArray);
}
-(void)createDiamonds {
    Card *aceDiamonds = [[Card alloc]init];
    // int values assigned
    aceDiamonds.suit = 0;
    aceDiamonds.face = 0;
    aceDiamonds.value = 5;
    aceDiamonds.noOfFiftyTwo = 13;
    // BOOLS value assigned
    aceDiamonds.deck = YES;
    Card *twoDiamonds = [[Card alloc]init];
    // int values assigned
    twoDiamonds.suit = 0;
    twoDiamonds.face = 1;
    twoDiamonds.value = 5;
    twoDiamonds.noOfFiftyTwo = 14;
    // BOOLS value assigned
    twoDiamonds.deck = YES;
    Card *threeDiamonds = [[Card alloc]init];
    // int values assigned
    threeDiamonds.suit = 0;
    threeDiamonds.face = 2;
    threeDiamonds.value = 5;
    threeDiamonds.noOfFiftyTwo = 15;
    // BOOLS value assigned
    threeDiamonds.deck = YES;
    Card *fourDiamonds = [[Card alloc]init];
    // int values assigned
    fourDiamonds.suit = 0;
    fourDiamonds.face = 3;
    fourDiamonds.value = 5;
    fourDiamonds.noOfFiftyTwo = 16;
    // BOOLS value assigned
    fourDiamonds.deck = YES;
    Card *fiveDiamonds = [[Card alloc]init];
    // int values assigned
    fiveDiamonds.suit = 0;
    fiveDiamonds.face = 4;
    fiveDiamonds.value = 5;
    fiveDiamonds.noOfFiftyTwo = 17;
    // BOOLS value assigned
    fiveDiamonds.deck = YES;
    Card *sixDiamonds = [[Card alloc]init];
    // int values assigned
    sixDiamonds.suit = 0;
    sixDiamonds.face = 5;
    sixDiamonds.value = 5;
    sixDiamonds.noOfFiftyTwo = 18;
    // BOOLS value assigned
    sixDiamonds.deck = YES;
    Card *sevenDiamonds = [[Card alloc]init];
    // int values assigned
    sevenDiamonds.suit = 0;
    sevenDiamonds.face = 6;
    sevenDiamonds.value = 5;
    sevenDiamonds.noOfFiftyTwo = 19;
    // BOOLS value assigned
    sevenDiamonds.deck = YES;
    Card *eightDiamonds = [[Card alloc]init];
    // int values assigned
    eightDiamonds.suit = 0;
    eightDiamonds.face = 7;
    eightDiamonds.value = 5;
    eightDiamonds.noOfFiftyTwo = 20;
    // BOOLS value assigned
    eightDiamonds.deck = YES;
    Card *nineDiamonds = [[Card alloc]init];
    // int values assigned
    nineDiamonds.suit = 0;
    nineDiamonds.face = 8;
    nineDiamonds.value = 5;
    nineDiamonds.noOfFiftyTwo = 21;
    // BOOLS value assigned
    nineDiamonds.deck = YES;
    Card *tenDiamonds = [[Card alloc]init];
    // int values assigned
    tenDiamonds.suit = 0;
    tenDiamonds.face = 9;
    tenDiamonds.value = 5;
    tenDiamonds.noOfFiftyTwo = 22;
    // BOOLS value assigned
    tenDiamonds.deck = YES;
    Card *jackDiamonds = [[Card alloc]init];
    // int values assigned
    jackDiamonds.suit = 0;
    jackDiamonds.face = 10;
    jackDiamonds.value = 10;
    jackDiamonds.noOfFiftyTwo = 23;
    // BOOLS value assigned
    jackDiamonds.deck = YES;
    Card *queenDiamonds = [[Card alloc]init];
    // int values assigned
    queenDiamonds.suit = 0;
    queenDiamonds.face = 11;
    queenDiamonds.value = 10;
    queenDiamonds.noOfFiftyTwo = 24;
    // BOOLS value assigned
    queenDiamonds.deck = YES;
    Card *kingDiamonds = [[Card alloc]init];
    // int values assigned
    kingDiamonds.suit = 0;
    kingDiamonds.face = 12;
    kingDiamonds.value = 10;
    kingDiamonds.noOfFiftyTwo = 25;
    // BOOLS value assigned
    kingDiamonds.deck = YES;
    
    self.diamondsArray = [[NSMutableArray alloc]initWithObjects:aceDiamonds, twoDiamonds, threeDiamonds, fourDiamonds, fiveDiamonds, sixDiamonds, sevenDiamonds, eightDiamonds, nineDiamonds, tenDiamonds, jackDiamonds, queenDiamonds, kingDiamonds, nil];
    NSLog(@"%@", self.diamondsArray);
    
}
-(void)createHearts {
    Card *aceHearts = [[Card alloc]init];
    // int values assigned
    aceHearts.suit = 0;
    aceHearts.face = 0;
    aceHearts.value = 5;
    aceHearts.noOfFiftyTwo = 26;
    // BOOLS value assigned
    aceHearts.deck = YES;
    Card *twoHearts = [[Card alloc]init];
    // int values assigned
    twoHearts.suit = 0;
    twoHearts.face = 1;
    twoHearts.value = 5;
    twoHearts.noOfFiftyTwo = 27;
    // BOOLS value assigned
    twoHearts.deck = YES;
    Card *threeHearts = [[Card alloc]init];
    // int values assigned
    threeHearts.suit = 0;
    threeHearts.face = 2;
    threeHearts.value = 5;
    threeHearts.noOfFiftyTwo = 28;
    // BOOLS value assigned
    threeHearts.deck = YES;
    Card *fourHearts = [[Card alloc]init];
    // int values assigned
    fourHearts.suit = 0;
    fourHearts.face = 3;
    fourHearts.value = 5;
    fourHearts.noOfFiftyTwo = 29;
    // BOOLS value assigned
    fourHearts.deck = YES;
    Card *fiveHearts = [[Card alloc]init];
    // int values assigned
    fiveHearts.suit = 0;
    fiveHearts.face = 4;
    fiveHearts.value = 5;
    fiveHearts.noOfFiftyTwo = 30;
    // BOOLS value assigned
    fiveHearts.deck = YES;
    Card *sixHearts = [[Card alloc]init];
    // int values assigned
    sixHearts.suit = 0;
    sixHearts.face = 5;
    sixHearts.value = 5;
    sixHearts.noOfFiftyTwo = 31;
    // BOOLS value assigned
    sixHearts.deck = YES;
    Card *sevenHearts = [[Card alloc]init];
    // int values assigned
    sevenHearts.suit = 0;
    sevenHearts.face = 6;
    sevenHearts.value = 5;
    sevenHearts.noOfFiftyTwo = 32;
    // BOOLS value assigned
    sevenHearts.deck = YES;
    Card *eightHearts = [[Card alloc]init];
    // int values assigned
    eightHearts.suit = 0;
    eightHearts.face = 7;
    eightHearts.value = 5;
    eightHearts.noOfFiftyTwo = 33;
    // BOOLS value assigned
    eightHearts.deck = YES;
    Card *nineHearts = [[Card alloc]init];
    // int values assigned
    nineHearts.suit = 0;
    nineHearts.face = 8;
    nineHearts.value = 5;
    nineHearts.noOfFiftyTwo = 34;
    // BOOLS value assigned
    nineHearts.deck = YES;
    Card *tenHearts = [[Card alloc]init];
    // int values assigned
    tenHearts.suit = 0;
    tenHearts.face = 9;
    tenHearts.value = 5;
    tenHearts.noOfFiftyTwo = 35;
    // BOOLS value assigned
    tenHearts.deck = YES;
    Card *jackHearts = [[Card alloc]init];
    // int values assigned
    jackHearts.suit = 0;
    jackHearts.face = 10;
    jackHearts.value = 10;
    jackHearts.noOfFiftyTwo = 36;
    // BOOLS value assigned
    jackHearts.deck = YES;
    Card *queenHearts = [[Card alloc]init];
    // int values assigned
    queenHearts.suit = 0;
    queenHearts.face = 11;
    queenHearts.value = 10;
    queenHearts.noOfFiftyTwo = 37;
    // BOOLS value assigned
    queenHearts.deck = YES;
    Card *kingHearts = [[Card alloc]init];
    // int values assigned
    kingHearts.suit = 0;
    kingHearts.face = 12;
    kingHearts.value = 10;
    kingHearts.noOfFiftyTwo = 38;
    // BOOLS value assigned
    kingHearts.deck = YES;
    
    self.heartsArray = [[NSMutableArray alloc]initWithObjects:aceHearts, twoHearts, threeHearts, fourHearts, fiveHearts, sixHearts, sevenHearts, eightHearts, nineHearts, tenHearts, jackHearts, queenHearts, kingHearts, nil];
    NSLog(@"%@", self.heartsArray);
    
    
}
-(void)createSpades {
    Card *aceSpades = [[Card alloc]init];
    // int values assigned
    aceSpades.suit = 0;
    aceSpades.face = 0;
    aceSpades.value = 5;
    aceSpades.noOfFiftyTwo = 39;
    // BOOLS value assigned
    aceSpades.deck = YES;
    Card *twoSpades = [[Card alloc]init];
    // int values assigned
    twoSpades.suit = 0;
    twoSpades.face = 1;
    twoSpades.value = 5;
    twoSpades.noOfFiftyTwo = 40;
    // BOOLS value assigned
    twoSpades.deck = YES;
    Card *threeSpades = [[Card alloc]init];
    // int values assigned
    threeSpades.suit = 0;
    threeSpades.face = 2;
    threeSpades.value = 5;
    threeSpades.noOfFiftyTwo = 41;
    // BOOLS value assigned
    threeSpades.deck = YES;
    Card *fourSpades = [[Card alloc]init];
    // int values assigned
    fourSpades.suit = 0;
    fourSpades.face = 3;
    fourSpades.value = 5;
    fourSpades.noOfFiftyTwo = 42;
    // BOOLS value assigned
    fourSpades.deck = YES;
    Card *fiveSpades = [[Card alloc]init];
    // int values assigned
    fiveSpades.suit = 0;
    fiveSpades.face = 4;
    fiveSpades.value = 5;
    fiveSpades.noOfFiftyTwo = 43;
    // BOOLS value assigned
    fiveSpades.deck = YES;
    Card *sixSpades = [[Card alloc]init];
    // int values assigned
    sixSpades.suit = 0;
    sixSpades.face = 5;
    sixSpades.value = 5;
    sixSpades.noOfFiftyTwo = 44;
    // BOOLS value assigned
    sixSpades.deck = YES;
    Card *sevenSpades = [[Card alloc]init];
    // int values assigned
    sevenSpades.suit = 0;
    sevenSpades.face = 6;
    sevenSpades.value = 5;
    sevenSpades.noOfFiftyTwo = 45;
    // BOOLS value assigned
    sevenSpades.deck = YES;
    Card *eightSpades = [[Card alloc]init];
    // int values assigned
    eightSpades.suit = 0;
    eightSpades.face = 7;
    eightSpades.value = 5;
    eightSpades.noOfFiftyTwo = 46;
    // BOOLS value assigned
    eightSpades.deck = YES;
    Card *nineSpades = [[Card alloc]init];
    // int values assigned
    nineSpades.suit = 0;
    nineSpades.face = 8;
    nineSpades.value = 5;
    nineSpades.noOfFiftyTwo = 47;
    // BOOLS value assigned
    nineSpades.deck = YES;
    Card *tenSpades = [[Card alloc]init];
    // int values assigned
    tenSpades.suit = 0;
    tenSpades.face = 9;
    tenSpades.value = 5;
    tenSpades.noOfFiftyTwo = 48;
    // BOOLS value assigned
    tenSpades.deck = YES;
    Card *jackSpades = [[Card alloc]init];
    // int values assigned
    jackSpades.suit = 0;
    jackSpades.face = 10;
    jackSpades.value = 10;
    jackSpades.noOfFiftyTwo = 49;
    // BOOLS value assigned
    jackSpades.deck = YES;
    Card *queenSpades = [[Card alloc]init];
    // int values assigned
    queenSpades.suit = 0;
    queenSpades.face = 11;
    queenSpades.value = 10;
    queenSpades.noOfFiftyTwo = 50;
    // BOOLS value assigned
    queenSpades.deck = YES;
    Card *kingSpades = [[Card alloc]init];
    // int values assigned
    kingSpades.suit = 0;
    kingSpades.face = 12;
    kingSpades.value = 10;
    kingSpades.noOfFiftyTwo = 51;
    // BOOLS value assigned
    kingSpades.deck = YES;
    
    self.spadesArray = [[NSMutableArray alloc]initWithObjects:aceSpades, twoSpades, threeSpades, fourSpades, fiveSpades, sixSpades, sevenSpades, eightSpades, nineSpades, tenSpades, jackSpades, queenSpades, kingSpades, nil];
    
    
}


-(void)printMe {
    self.printMeArray = [[NSMutableArray alloc]initWithObjects:@"ace", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"jack", @"queen", @"king", nil];
    //    NSLog(@"array = %@", self.printMeArray);
    
    NSString *currentSuit = @"Clubs";//@"Diamonds";//@"Hearts";//@"Spades";//
    int face = 0;
    int value = 5;
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
        NSLog(@"%@%@.value = %d;", cardNumber, currentSuit, value);
        NSLog(@"%@%@.noOfFiftyTwo = %d;", cardNumber, currentSuit, noOf52);
        NSLog(@"// BOOLS value assigned");
        NSLog(@"%@%@.deck = YES;", cardNumber, currentSuit);
        
        if ([cardNumber isEqualToString:@"ten"]) {
            value = 10;
        }
        face++;
        noOf52++;
        
    }
}



@end
