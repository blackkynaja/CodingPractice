/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/4c3qzzQg8Zg9AfLKH
 */

#import <Foundation/Foundation.h>

NSString * fancyRide(int l, NSMutableArray<NSNumber *> * fares) {
    NSArray *options = @[@"UberX", @"UberXL", @"UberPlus", @"UberBlack", @"UberSUV"];
    for (NSInteger i = fares.count-1; i >= 0; i--) {
        NSNumber *fare = fares[i];
        CGFloat cost = [fare floatValue]*l;
        if (cost <= 20.0) {
            return options[i];
        }
    }
    return options[0];
}
