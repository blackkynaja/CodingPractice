/*
 https://app.codesignal.com/interview-practice/task/Ss4qyHoGJQhpvaGWc/description
 */

#import <Foundation/Foundation.h>

NSString * classifyStrings(NSString * s) {
    int countVow = 0;
    int countCon = 0;
    int countMark = 0;
    BOOL hasMark = NO;
    BOOL isMarkCon = NO;
    NSString *status = @"good";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    
    for (int i = 0; i < s.length; i++) {
        char c = [s characterAtIndex:i];
        if (c == '?') {
            countCon++;
            countVow++;
            hasMark = YES;
            countMark++;
            if (countMark > 1) {
                isMarkCon = YES;
            }
        } else {
            countMark = 0;
            if (i > 0) {
                char c1 = [s characterAtIndex:i];
                char c2 = [s characterAtIndex:i-1];
                if ([set characterIsMember:c1] != [set characterIsMember:c2] && c2 != '?') {
                    hasMark = NO;
                    countCon = 0;
                    countVow = 0;
                }
            }
            
            if ([set characterIsMember:c]) {
                countVow++;
            } else {
                countCon++;
            }
        }
        
        if (countVow >= 3 || countCon >= 5) {
            if (!hasMark) {
                return @"bad";
            } else {
                if (countVow >= 3 && countCon >= 5 && !isMarkCon) {
                    return @"bad";
                } else {
                    status = @"mixed";
                }
            }
        }
    }
    
    return status;
}
