/*
 Company: SpaceX
 https://app.codesignal.com/company-challenges/spacex/EcQD8xYZotKM77FKM
 */

#import <Foundation/Foundation.h>

BOOL launchSequenceChecker(NSMutableArray<NSString *> * systemNames, NSMutableArray<NSNumber *> * stepNumbers) {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [systemNames count]; i++) {
        NSNumber *value = [dict objectForKey:systemNames[i]];
        NSNumber *stepNumber = stepNumbers[i];
        if (value != nil) {
            if (stepNumber.intValue <= value.intValue) {
                return NO;
            } else {
                [dict setValue:stepNumber forKey:systemNames[i]];
            }
        } else {
            [dict setValue:stepNumber forKey:systemNames[i]];
        }
//        NSLog(@"%@", dict);
    }
    return YES;
}
