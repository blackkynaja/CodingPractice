/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/XHNFMPBYsqNyhx9PP
 */
#import <Foundation/Foundation.h>

BOOL findInVerizon(NSMutableArray<NSMutableArray<NSNumber *> *> * parkingLot, NSMutableArray<NSNumber *> * luckySpot) {
    BOOL isTopThrough = YES;
    BOOL isBottomThrough = YES;
    
    for (NSInteger column = [luckySpot[1] integerValue]; column < [luckySpot[3] integerValue]; column++) {
        for (NSInteger row = [luckySpot[0] integerValue]; row >= 0; row--) {
            NSInteger index = [parkingLot[row][column] integerValue];
            if (index == 1) {
                isTopThrough = NO;
                break;
            }
        }
    }
    
    for (NSInteger column = [luckySpot[1] integerValue]; column < [luckySpot[3] integerValue]; column++) {
        for (NSInteger row = [luckySpot[2] integerValue]; row < [parkingLot count]; row++) {
            NSInteger index = [parkingLot[row][column] integerValue];
            if (index == 1) {
                isBottomThrough = NO;
                break;
            }
        }
    }
    
    return isTopThrough || isBottomThrough;
}

BOOL findInHorizon(NSMutableArray<NSMutableArray<NSNumber *> *> * parkingLot, NSMutableArray<NSNumber *> * luckySpot) {
    BOOL isLeftThrough = YES;
    BOOL isRightThrough = YES;
    
    for (NSInteger row = [luckySpot[0] integerValue]; row < [luckySpot[2] integerValue]; row++) {
        for (NSInteger column = [luckySpot[1] integerValue]; column >= 0; column--) {
            NSInteger index = [parkingLot[row][column] integerValue];
            if (index == 1) {
                isLeftThrough = NO;
                break;
            }
        }
    }
    
    for (NSInteger row = [luckySpot[0] integerValue]; row < [luckySpot[2] integerValue]; row++) {
        for (NSInteger column = [luckySpot[3] integerValue]; column < [parkingLot[row] count]; column++) {
            NSInteger index = [parkingLot[row][column] integerValue];
            if (index == 1) {
                isRightThrough = NO;
                break;
            }
        }
    }
    
    return isLeftThrough || isRightThrough;
}

BOOL findInLuckySpot(NSMutableArray<NSMutableArray<NSNumber *> *> * parkingLot, NSMutableArray<NSNumber *> * luckySpot) {
    for (NSInteger row = [luckySpot[0] integerValue]; row <= [luckySpot[2] integerValue]; row++) {
        for (NSInteger column = [luckySpot[1] integerValue]; column <= [luckySpot[3] integerValue]; column++) {
            NSInteger index = [parkingLot[row][column] integerValue];
            if (index == 1) {
                return NO;
            }
        }
    }
    
    return YES;
}

BOOL parkingSpot(NSMutableArray<NSNumber *> * carDimensions, NSMutableArray<NSMutableArray<NSNumber *> *> * parkingLot, NSMutableArray<NSNumber *> * luckySpot) {
    BOOL canFitInLuckySpot = findInLuckySpot(parkingLot, luckySpot);
    if (!canFitInLuckySpot) {
        return false;
    }
    
    // Find horizon
    if ([luckySpot[2] integerValue] - [luckySpot[0] integerValue] + 1 == [carDimensions[1] integerValue]) {
        // Not Square
        if ([carDimensions[0] integerValue] != [carDimensions[1] integerValue]) {
            return findInHorizon(parkingLot, luckySpot);
        } else { // Square
            return findInHorizon(parkingLot, luckySpot) || findInVerizon(parkingLot, luckySpot);
        }
    } else { // Find verizon
        return findInVerizon(parkingLot, luckySpot);
    }
    
}
