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
@property int numberOfPlayers;
@property int whosUP;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I love Objective C");
    
    // set how many players there are
    self.numberOfPlayers = 3;
    
    // build deck
    [self create52of52];
    // create users // currently using 2 players 07.06.20
    [self createUser:self.numberOfPlayers];
    [self dealInitialRound:7];
    [self addFirstCardToPile];
    [self showPlayerHand:self.whosUP];
    [self startPlaying];
    [self startPlaying];
    [self startPlaying];
    //    [self printMe];
    
}

-(void)createRumy:(int)cardSelectedIndex { //change this to "cardOf52Number" for easier readability of this func
    // create 2 arrays for SET use [STRAIGHT vs 3ofKind]
    NSMutableArray *currentSetStraight = [[NSMutableArray alloc]init];
    NSMutableArray *currentSet3Kind = [[NSMutableArray alloc]init];
    // add current card to current sets // remove later if array is < 3
    [currentSetStraight addObject:[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]];
    [currentSet3Kind addObject:[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]];
    // mark card as BOARD
    [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]setStatusOfCard:BOARD];
    
    NSLog(@"Player%d has selected: %d",self.whosUP, [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]);
    
    // check if any other cards are available that can connect to this for a potential set
    /**/ /**/
    // forIn cards in hand
    // if not same card
    //   if same face, addObject currentSet
    //   else if same suit
    //      if next card over
    //      if not same as any of the cards in the currentSet, and compare to all in currentSet
    
    // make the int something it could never be, so that it gets assigned only when it needs to
    int cardAddedToCurrentSet = 53;
    
    for (Card *potentialMatch in [self.playersOfGame[self.whosUP]cardsInHand]) {
        NSLog(@"The cards we are comparing: %d AND %d",potentialMatch.noOfFiftyTwo, [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]);
        
        // pass by same card in hand
        if (potentialMatch.noOfFiftyTwo != [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]) {
            
            // check if face is same
            if (potentialMatch.face == [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]face]) {
                NSLog(@"potential card's FACE is %d, our card %d",potentialMatch.face, [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]face]);
                // add to set
                [currentSet3Kind addObject:potentialMatch];
                // mark cards as BOARD in allCards
            }
            
            // added back 07.07.20, since checking suit first is necessary to ensure that absolute value is not from king to ace of other suit!
            // check if suit is same
            else if (potentialMatch.suit == [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]suit]) {
                // NSLog(@"the card's suit is %d",potentialMatch.suit);
                // check if noOf52 is +/-1
                NSLog(@"potential card's NO. is %d, our card %d", potentialMatch.noOfFiftyTwo, [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]);
                
                // check if card has a neighboring card // check if noOf52 is +/-1
                // OR next to another card that is already in the set as well
                if ((abs(potentialMatch.noOfFiftyTwo - [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo])==2)/*needs to be 1*/ || (abs(potentialMatch.noOfFiftyTwo - cardAddedToCurrentSet)==3)) {
                    NSLog(@"the card's NO. are %d AND %d, so it was added",potentialMatch.noOfFiftyTwo, [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]);
                    [currentSetStraight addObject:potentialMatch];
                    // assign and check next round
                    cardAddedToCurrentSet = potentialMatch.noOfFiftyTwo;
                }
                // mark card as BOOL straight
            }
            // remove cards from HAND [player's array]
        } /**/ /**/
        //        for (Card *inCurrentSet in currentSet) {
        //            NSLog(@"CurrentSet contains: %d",inCurrentSet.noOfFiftyTwo);
        //        }
        NSLog(@"3 of a kind array: %@", [currentSet3Kind valueForKey:@"face"]);
        NSLog(@"Straight: %@", [currentSetStraight valueForKey:@"noOfFiftyTwo"]);
    } //end for in for cards compare
    
    if ([currentSet3Kind count] > 2||[currentSetStraight count] > 2) {
        NSLog(@"Player %d's 3KindSET has 3 or more",[self.playersOfGame[self.whosUP]playerNumber]);
        if ([currentSet3Kind count] > 2) {
            NSLog(@"3 of a Kind!");
        }
        if ([currentSetStraight count] > 2) {
            NSLog(@"Straight!!");
        }
        // erase currentSet
        // give option to throw
        
        // reassign cards HAND
        for (Card *inCurrentSet in [self.playersOfGame[self.whosUP]cardsInHand]) {
            [inCurrentSet setStatusOfCard:HAND];
        }
        
        
        
    }
}

-(void)startPlaying {
    // check whos turn
    NSLog(@"It is player%d's turn",[self.playersOfGame[self.whosUP]playerNumber]);
    
    // TODO 07.10.20 give player option to choose between DECK and PILE
    // if player selects a card on the PILE
    //      Obtain index of the card and ADD/MOVE all of them from that card on To HAND/playerHand
    // else if player selects DECK, proceed
    // Mark player PICKED
    // Enforce SET to BOARD [disable ability to throw to PILE before releasing set]
    // QUESTION: Make it possible to pick up in first place without checking if set WILL exist? Or give user UNDO option
    
    if (self.whosUP > 100/*TODO 07.10.20 - player selects card from pile*/) {
        NSLog(@"Player %D has picked from the pile", self.whosUP);
        
        // player has picked FROM this card in the PILE
        NSMutableArray *cardsPickedUpFromPile = [[NSMutableArray alloc]init];
        int indexChosen = 4;  /*07.10.20 HARDCODE TODO this will be assigned by where the player has selected*/
        for (int i = 8/*07.10.20 HARDCODE TODO(int)[self.pileCards count]//count of the pile*/;
             i >= indexChosen;
             indexChosen++) {
            NSLog(@"This is the card at index %d", indexChosen);
            // add to temp array to add to Hand later
            //        [cardsPickedUpFromPile addObject:self.pileCards[indexChosen]]; // uncomment me 07.10.20 hardcoded is causing this to crash
            
        }
        for (Card *pickedUpFromPile in cardsPickedUpFromPile) {
            
            // mark as HAND in allCards
            for (Card *originalCard in self.allCards) {
                if (originalCard.noOfFiftyTwo == pickedUpFromPile.noOfFiftyTwo) {
                    originalCard.statusOfCard = HAND;
                }}
            // add to player's hand
            [[self.playersOfGame[self.whosUP]cardsInHand] addObject:pickedUpFromPile];
            
            // mark Player as PICKED
            [self.playersOfGame[self.whosUP]setStatusOfPlayer:PICKED];
        }
        //    NSLog(@"The card that was picked: %d",[self.pileCards[indexChosen]noOfFiftyTwo]);
    }
    
    else if (self.whosUP > 0/*TODO 07.10.20 - player selects card from deck*/) {
    // TODO 07.07.20 add randomization for the card
    // pick card from DECK add to/mark HAND, set player to picked
    for (Card *cardForPick in self.allCards) {
        if (cardForPick.statusOfCard == DECK) {
            [[self.playersOfGame[self.whosUP] cardsInHand] addObject:cardForPick];
            cardForPick.statusOfCard = HAND;
            // announce which card is there
            NSLog(@"the card picked by player%d: %d",[self.playersOfGame[self.whosUP]playerNumber], [[[self.playersOfGame[self.whosUP]cardsInHand] lastObject] noOfFiftyTwo]);
            break;
        }
        else {
            //            NSLog(@"card%d is unavailable with status %d", cardForPick.noOfFiftyTwo, cardForPick.statusOfCard);
        }
    }
    [self.playersOfGame[self.whosUP]setStatusOfPlayer:PICKED];
    // player has picked a card and now needs to either put cards on the board, or
    }
    // player selects a card 07.07.20 HARDCODED for now
    // change this to the noOf52 of the card when ready [makes function easier to read]
    int cardSelectedIndex = 4;
    
    // if player selects a card, check if possible to create set, otherwise return and offer to throw
    [self createRumy:cardSelectedIndex];
    
    // TODO 07.07.20 assign noOF52 of card to an int, and assign the allCards array of that to be PILE
    // ^^[maybe by subtracting 1 and using that as index]
    
    // throw card add to/mark PILE, set player to thrown
    int currentCardNo = [[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo];
    for (Card *cardForMarkInPile in self.allCards) {
        if (cardForMarkInPile.noOfFiftyTwo == currentCardNo) {
            cardForMarkInPile.statusOfCard = PILE;
            NSLog(@"The card that was thrown to the pile: %d",cardForMarkInPile.noOfFiftyTwo);
            break;
        }
    }
    // add card to pile array
    //    [self.pileCards addObject:[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]];
    [self.pileCards addObject:self.allCards[currentCardNo]];
    NSLog(@"player%d threw the card: %d",[self.playersOfGame[self.whosUP] playerNumber], [self.allCards[currentCardNo]noOfFiftyTwo]);
    //[[self.playersOfGame[self.whosUP]cardsInHand][cardSelectedIndex]noOfFiftyTwo]);
    // remove card from hand
    [[self.playersOfGame[self.whosUP]cardsInHand] removeObjectAtIndex:cardSelectedIndex];
//    NSInteger pileCount = [self.pileCards count]; // why did I make this? 07.10.20
    for (Card *cardInPile in self.pileCards) {
//        NSLog(@"The pile has the cards: %d AND %d cards available",cardInPile.noOfFiftyTwo, (int)self.pileCards.count);
    }
    NSLog(@"The array of PILE CARDS: %@",[self.pileCards valueForKey:@"noOfFiftyTwo"]);

    [self.playersOfGame[self.whosUP] setStatusOfPlayer:THROWN];
    
    
    // check if player has zero cards
    if ([self.playersOfGame[self.whosUP]cardsInHand] == 0) {
        return; // game is over, due to this player having no cards
    }
    // increase number to playerWhosUp
    if (self.whosUP == (self.numberOfPlayers-1)) { // if at the top of the array, reset to zero
        self.whosUP=0;
    }
    else {
        self.whosUP+=1;
    }
    NSLog(@"It is now player%d's turn",[self.playersOfGame[self.whosUP]playerNumber]);
    
    // make recursive, so that game continues. Will continue until one player is at ZERO
    // disabled 07.07.20 since we are not there yet
    //    [self startPlaying];
    
}

-(void)showValueOfCardsInHand {
    int negativeValue = 0;
    for (Card *myCard in self.playersOfGame[self.whosUP]) {
        negativeValue += myCard.valuePoint;
        // display myCard.valuePoint next to card too
    }
}

-(int)randomCardFromDeck {
    int chosenCard = 0;
    NSMutableArray *cardsInDeck = [[NSMutableArray alloc]init];
    //filter through deck and ensure it is set to DECK
    for (Card *deckOrNot in self.allCards) {
        if (deckOrNot.statusOfCard == DECK) {
//            NSLog(@"card%d is in DECK", deckOrNot.noOfFiftyTwo);
            [cardsInDeck addObject:deckOrNot];
        }}
    //        NSUInteger randomIndex = arc4random() % self.allCards.count;
    NSUInteger randomIndex = arc4random() % cardsInDeck.count;
    chosenCard = [cardsInDeck[randomIndex]noOfFiftyTwo];
//    NSLog(@"The array has %@",[cardsInDeck valueForKey:@"noOfFiftyTwo"]);

    return chosenCard;
}

-(void)addFirstCardToPile {
    
    // create the PILE
    self.pileCards = [[NSMutableArray alloc]init];
    //    NSLog(@"card0 has status %d",[self.allCards[3] statusOfCard]);
    int cardToBeAdded = [self randomCardFromDeck];
    NSLog(@"Added to the PILE:%d",cardToBeAdded);
    for (Card *cardForPile in self.allCards) {
        if (cardForPile.noOfFiftyTwo == cardToBeAdded) {
            [self.pileCards addObject:cardForPile];
            cardForPile.statusOfCard = PILE;
            // announce which card is there
            NSLog(@"first card on pile: %d",[self.pileCards[0] noOfFiftyTwo]);
            break;
        }
    }
/* // removed 07.10.20 because I created a randomizer instead
    // TODO 07.07.20 add randomization for the card
    for (Card *cardForPile in self.allCards) {
        if (cardForPile.statusOfCard == HAND) {
            //            NSLog(@"card%d is in someone's hand", cardForPile.noOfFiftyTwo);
        }
        else {
            [self.pileCards addObject:cardForPile];
            cardForPile.statusOfCard = PILE;
            NSLog(@"card%d is available and now on the pile, with status %d", cardForPile.noOfFiftyTwo, cardForPile.statusOfCard);
            // announce which card is there
            NSLog(@"first card on pile: %d",[self.pileCards[0] noOfFiftyTwo]);
            
            break;
        }
    }*/
    
}

-(void)showPlayerHand:(int)forPlayerNumber {
    for (Card *myCard in [self.playersOfGame[forPlayerNumber] cardsInHand]) {
        NSLog(@"player%d has card%d", [self.playersOfGame[forPlayerNumber] playerNumber], myCard.noOfFiftyTwo);
        //        NSLog(@"player%d has cards %d",[self.playersOfGame[forPlayerNumber]playerNumber], [[[self.playersOfGame[forPlayerNumber] cardsInHand] objectAtIndex:2]noOfFiftyTwo]);
    }
    
}

-(void)dealInitialRound:(int)amount {
    NSInteger k = 0; // to compare to and count from "0 until i"
    // determine how many cards need to be dealt
    NSInteger i = self.numberOfPlayers;
    i = amount*i;
    NSLog(@"%ld cards will be dealt, %d to each player",i, amount);
    
    //    TODO 07.07.20
    // check if inDeck
    // deal random card to each user
    // mark card inHand
    
    
    while (i>k) {
        for (Player *player in self.playersOfGame) {
//            [player.cardsInHand addObject:[self.allCards objectAtIndex:k] ]; //HARDCODED
            NSUInteger randomIndex = arc4random() % self.allCards.count;
            [player.cardsInHand addObject:[self.allCards objectAtIndex:randomIndex]];
//                        NSLog(@"card face: %d",[self.allCards[randomIndex] noOfFiftyTwo]);
            
            [[self.allCards objectAtIndex:k] setStatusOfCard:HAND];
            //            NSLog(@"valuePointfor status = %d",[[self.allCards objectAtIndex:i]statusOfCard]);
            // SHOWS the cards being dealt out. helpful 07.06.20
            //            NSLog(@"Player%d has %ld cards in their hand", player.playerNumber, [player.cardsInHand count]);
            k++;
        }
    }
    
    //    TODO
    // check inDeck
    // deal random card to pile
    // mark card as inPile, change inDeck
    
}

#pragma mark - CREATE USER

-(void)createUser:(int)playersCount {
    self.playersOfGame = [[NSMutableArray alloc]init];
    int k = 0; // to compare to and increase
    //    for (playersCount=playersCount; playersCount > 0; playersCount--) {
    while (playersCount>k) {
        
        Player *playerNew = [[Player alloc]init];
        // hardcoded for now, but will need prompt for name. Fixed outside for loop currently 07.06.20
        playerNew.name = @"JD";
        playerNew.playerNumber = k;
        playerNew.statusOfPlayer = THROWN;
        playerNew.currentTurn = NO;
        playerNew.cardsInHand = [[NSMutableArray alloc]init];
        NSLog(@"add a new user: %d with name: %@", k, playerNew.name);
        [self.playersOfGame addObject:playerNew];
        k++;
    }
    for (Player *playerN in self.playersOfGame) {
        NSLog(@"player%d is added to the array of players", playerN.playerNumber);
    }
    // assign first of the array to be up
    self.whosUP = 0;
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
    aceDiamonds.suit = 1;
    aceDiamonds.face = 0;
    aceDiamonds.valuePoint = 5;
    aceDiamonds.noOfFiftyTwo = 13;
    aceDiamonds.statusOfCard = DECK;
    Card *twoDiamonds = [[Card alloc]init];
    twoDiamonds.suit = 1;
    twoDiamonds.face = 1;
    twoDiamonds.valuePoint= 5;
    twoDiamonds.noOfFiftyTwo = 14;
    twoDiamonds.statusOfCard = DECK;
    Card *threeDiamonds = [[Card alloc]init];
    threeDiamonds.suit = 1;
    threeDiamonds.face = 2;
    threeDiamonds.valuePoint= 5;
    threeDiamonds.noOfFiftyTwo = 15;
    threeDiamonds.statusOfCard = DECK;
    Card *fourDiamonds = [[Card alloc]init];
    fourDiamonds.suit = 1;
    fourDiamonds.face = 3;
    fourDiamonds.valuePoint= 5;
    fourDiamonds.noOfFiftyTwo = 16;
    fourDiamonds.statusOfCard = DECK;
    Card *fiveDiamonds = [[Card alloc]init];
    fiveDiamonds.suit = 1;
    fiveDiamonds.face = 4;
    fiveDiamonds.valuePoint= 5;
    fiveDiamonds.noOfFiftyTwo = 17;
    fiveDiamonds.statusOfCard = DECK;
    Card *sixDiamonds = [[Card alloc]init];
    sixDiamonds.suit = 1;
    sixDiamonds.face = 5;
    sixDiamonds.valuePoint= 5;
    sixDiamonds.noOfFiftyTwo = 18;
    sixDiamonds.statusOfCard = DECK;
    Card *sevenDiamonds = [[Card alloc]init];
    sevenDiamonds.suit = 1;
    sevenDiamonds.face = 6;
    sevenDiamonds.valuePoint= 5;
    sevenDiamonds.noOfFiftyTwo = 19;
    sevenDiamonds.statusOfCard = DECK;
    Card *eightDiamonds = [[Card alloc]init];
    eightDiamonds.suit = 1;
    eightDiamonds.face = 7;
    eightDiamonds.valuePoint= 5;
    eightDiamonds.noOfFiftyTwo = 20;
    eightDiamonds.statusOfCard = DECK;
    Card *nineDiamonds = [[Card alloc]init];
    nineDiamonds.suit = 1;
    nineDiamonds.face = 8;
    nineDiamonds.valuePoint= 5;
    nineDiamonds.noOfFiftyTwo = 21;
    nineDiamonds.statusOfCard = DECK;
    Card *tenDiamonds = [[Card alloc]init];
    tenDiamonds.suit = 1;
    tenDiamonds.face = 9;
    tenDiamonds.valuePoint= 5;
    tenDiamonds.noOfFiftyTwo = 22;
    tenDiamonds.statusOfCard = DECK;
    Card *jackDiamonds = [[Card alloc]init];
    jackDiamonds.suit = 1;
    jackDiamonds.face = 10;
    jackDiamonds.valuePoint= 10;
    jackDiamonds.noOfFiftyTwo = 23;
    jackDiamonds.statusOfCard = DECK;
    Card *queenDiamonds = [[Card alloc]init];
    queenDiamonds.suit = 1;
    queenDiamonds.face = 11;
    queenDiamonds.valuePoint= 10;
    queenDiamonds.noOfFiftyTwo = 24;
    queenDiamonds.statusOfCard = DECK;
    Card *kingDiamonds = [[Card alloc]init];
    kingDiamonds.suit = 1;
    kingDiamonds.face = 12;
    kingDiamonds.valuePoint= 10;
    kingDiamonds.noOfFiftyTwo = 25;
    kingDiamonds.statusOfCard = DECK;
    
    self.diamondsArray = [[NSMutableArray alloc]initWithObjects:aceDiamonds, twoDiamonds, threeDiamonds, fourDiamonds, fiveDiamonds, sixDiamonds, sevenDiamonds, eightDiamonds, nineDiamonds, tenDiamonds, jackDiamonds, queenDiamonds, kingDiamonds, nil];
    //    NSLog(@"%@", self.diamondsArray);
    
}
-(void)createHearts {
    Card *aceHearts = [[Card alloc]init];
    aceHearts.suit = 2;
    aceHearts.face = 0;
    aceHearts.valuePoint= 5;
    aceHearts.noOfFiftyTwo = 26;
    aceHearts.statusOfCard = DECK;
    Card *twoHearts = [[Card alloc]init];
    twoHearts.suit = 2;
    twoHearts.face = 1;
    twoHearts.valuePoint= 5;
    twoHearts.noOfFiftyTwo = 27;
    twoHearts.statusOfCard = DECK;
    Card *threeHearts = [[Card alloc]init];
    threeHearts.suit = 2;
    threeHearts.face = 2;
    threeHearts.valuePoint= 5;
    threeHearts.noOfFiftyTwo = 28;
    threeHearts.statusOfCard = DECK;
    Card *fourHearts = [[Card alloc]init];
    fourHearts.suit = 2;
    fourHearts.face = 3;
    fourHearts.valuePoint= 5;
    fourHearts.noOfFiftyTwo = 29;
    fourHearts.statusOfCard = DECK;
    Card *fiveHearts = [[Card alloc]init];
    fiveHearts.suit = 2;
    fiveHearts.face = 4;
    fiveHearts.valuePoint= 5;
    fiveHearts.noOfFiftyTwo = 30;
    fiveHearts.statusOfCard = DECK;
    Card *sixHearts = [[Card alloc]init];
    sixHearts.suit = 2;
    sixHearts.face = 5;
    sixHearts.valuePoint= 5;
    sixHearts.noOfFiftyTwo = 31;
    sixHearts.statusOfCard = DECK;
    Card *sevenHearts = [[Card alloc]init];
    sevenHearts.suit = 2;
    sevenHearts.face = 6;
    sevenHearts.valuePoint= 5;
    sevenHearts.noOfFiftyTwo = 32;
    sevenHearts.statusOfCard = DECK;
    Card *eightHearts = [[Card alloc]init];
    eightHearts.suit = 2;
    eightHearts.face = 7;
    eightHearts.valuePoint= 5;
    eightHearts.noOfFiftyTwo = 33;
    eightHearts.statusOfCard = DECK;
    Card *nineHearts = [[Card alloc]init];
    nineHearts.suit = 2;
    nineHearts.face = 8;
    nineHearts.valuePoint= 5;
    nineHearts.noOfFiftyTwo = 34;
    nineHearts.statusOfCard = DECK;
    Card *tenHearts = [[Card alloc]init];
    tenHearts.suit = 2;
    tenHearts.face = 9;
    tenHearts.valuePoint= 5;
    tenHearts.noOfFiftyTwo = 35;
    tenHearts.statusOfCard = DECK;
    Card *jackHearts = [[Card alloc]init];
    jackHearts.suit = 2;
    jackHearts.face = 10;
    jackHearts.valuePoint= 10;
    jackHearts.noOfFiftyTwo = 36;
    jackHearts.statusOfCard = DECK;
    Card *queenHearts = [[Card alloc]init];
    queenHearts.suit = 2;
    queenHearts.face = 11;
    queenHearts.valuePoint= 10;
    queenHearts.noOfFiftyTwo = 37;
    queenHearts.statusOfCard = DECK;
    Card *kingHearts = [[Card alloc]init];
    kingHearts.suit = 2;
    kingHearts.face = 12;
    kingHearts.valuePoint= 10;
    kingHearts.noOfFiftyTwo = 38;
    kingHearts.statusOfCard = DECK;
    
    self.heartsArray = [[NSMutableArray alloc]initWithObjects:aceHearts, twoHearts, threeHearts, fourHearts, fiveHearts, sixHearts, sevenHearts, eightHearts, nineHearts, tenHearts, jackHearts, queenHearts, kingHearts, nil];
    //    NSLog(@"%@", self.heartsArray);
    
    
}
-(void)createSpades {
    Card *aceSpades = [[Card alloc]init];
    aceSpades.suit = 3;
    aceSpades.face = 0;
    aceSpades.valuePoint= 5;
    aceSpades.noOfFiftyTwo = 39;
    aceSpades.statusOfCard = DECK;
    Card *twoSpades = [[Card alloc]init];
    twoSpades.suit = 3;
    twoSpades.face = 1;
    twoSpades.valuePoint= 5;
    twoSpades.noOfFiftyTwo = 40;
    twoSpades.statusOfCard = DECK;
    Card *threeSpades = [[Card alloc]init];
    threeSpades.suit = 3;
    threeSpades.face = 2;
    threeSpades.valuePoint= 5;
    threeSpades.noOfFiftyTwo = 41;
    threeSpades.statusOfCard = DECK;
    Card *fourSpades = [[Card alloc]init];
    fourSpades.suit = 3;
    fourSpades.face = 3;
    fourSpades.valuePoint= 5;
    fourSpades.noOfFiftyTwo = 42;
    fourSpades.statusOfCard = DECK;
    Card *fiveSpades = [[Card alloc]init];
    fiveSpades.suit = 3;
    fiveSpades.face = 4;
    fiveSpades.valuePoint= 5;
    fiveSpades.noOfFiftyTwo = 43;
    fiveSpades.statusOfCard = DECK;
    Card *sixSpades = [[Card alloc]init];
    sixSpades.suit = 3;
    sixSpades.face = 5;
    sixSpades.valuePoint= 5;
    sixSpades.noOfFiftyTwo = 44;
    sixSpades.statusOfCard = DECK;
    Card *sevenSpades = [[Card alloc]init];
    sevenSpades.suit = 3;
    sevenSpades.face = 6;
    sevenSpades.valuePoint= 5;
    sevenSpades.noOfFiftyTwo = 45;
    sevenSpades.statusOfCard = DECK;
    Card *eightSpades = [[Card alloc]init];
    eightSpades.suit = 3;
    eightSpades.face = 7;
    eightSpades.valuePoint= 5;
    eightSpades.noOfFiftyTwo = 46;
    eightSpades.statusOfCard = DECK;
    Card *nineSpades = [[Card alloc]init];
    nineSpades.suit = 3;
    nineSpades.face = 8;
    nineSpades.valuePoint= 5;
    nineSpades.noOfFiftyTwo = 47;
    nineSpades.statusOfCard = DECK;
    Card *tenSpades = [[Card alloc]init];
    tenSpades.suit = 3;
    tenSpades.face = 9;
    tenSpades.valuePoint= 5;
    tenSpades.noOfFiftyTwo = 48;
    tenSpades.statusOfCard = DECK;
    Card *jackSpades = [[Card alloc]init];
    jackSpades.suit = 3;
    jackSpades.face = 10;
    jackSpades.valuePoint= 10;
    jackSpades.noOfFiftyTwo = 49;
    jackSpades.statusOfCard = DECK;
    Card *queenSpades = [[Card alloc]init];
    queenSpades.suit = 3;
    queenSpades.face = 11;
    queenSpades.valuePoint= 10;
    queenSpades.noOfFiftyTwo = 50;
    queenSpades.statusOfCard = DECK;
    Card *kingSpades = [[Card alloc]init];
    kingSpades.suit = 3;
    kingSpades.face = 12;
    kingSpades.valuePoint= 10;
    kingSpades.noOfFiftyTwo = 51;
    kingSpades.statusOfCard = DECK;
    
    self.spadesArray = [[NSMutableArray alloc]initWithObjects:aceSpades, twoSpades, threeSpades, fourSpades, fiveSpades, sixSpades, sevenSpades, eightSpades, nineSpades, tenSpades, jackSpades, queenSpades, kingSpades, nil];
    //        NSLog(@"%@", self.spadesArray);
    
    
}


-(void)printMe { //used to create print outs of creationMethods
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
