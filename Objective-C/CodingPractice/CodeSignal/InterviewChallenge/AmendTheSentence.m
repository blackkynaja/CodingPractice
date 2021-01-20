/*
 https://app.codesignal.com/interview-practice/task/yXDg4rAk9ooEjLjdj/description
 */

#import <Foundation/Foundation.h>

NSString * amendTheSentence(NSString * s) {
    NSString *string = @"";
    
    int i = 0;
    while (i < [s length]) {
        char c = [s characterAtIndex:i];
        NSLog(@"%c",c);
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c]) {
            if ([string length] == 0 && i > 0) {
                string = [string stringByAppendingString:[s substringWithRange:NSMakeRange(0, i)]];
            }
            int nextCap = -1;
            for (int j = i+1; j < [s length]; j++) {
                char nextC = [s characterAtIndex:j];
                if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:nextC]) {
                    nextCap = j;
                    break;
                }
            }
            
            if (nextCap != -1) {
                if (i != 0) {
                    string = [string stringByAppendingString:@" "];
                }
                string = [string stringByAppendingString:[s substringWithRange:NSMakeRange(i, nextCap-i)]];
                i = nextCap;
            } else if (nextCap == [s length] - 1) {
                string = [string stringByAppendingString:[s substringWithRange:NSMakeRange(i, [s length]-i)]];
                
            } else {
                if (i != 0) {
                    string = [string stringByAppendingString:@" "];
                }
                string = [string stringByAppendingString:[s substringWithRange:NSMakeRange(i, [s length]-i)]];
                break;
            }
        } else {
            i++;
        }
    }
    
    return  [string lowercaseString];
}
