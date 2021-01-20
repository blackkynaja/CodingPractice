/*
 Company: Dropbox
 https://app.codesignal.com/company-challenges/dropbox/ffibMFaS7mzKZkAE3
 */

#import <Foundation/Foundation.h>

BOOL incorrectPasscodeAttempts(NSString * passcode, NSMutableArray<NSString *> * attempts) {
    NSInteger count = 0;
    for (int i = 0; i < [attempts count]; i++) {
        NSString *attemp = attempts[i];
        if (![attemp isEqualToString:passcode]) {
            count++;
        } else {
            count = 0;
        }
        
        if (count >= 10) {
            return YES;
        }
    }
    return NO;
}
