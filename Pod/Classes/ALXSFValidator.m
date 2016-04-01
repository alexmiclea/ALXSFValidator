//
//  ALXSFValidator.m
//  ALXSFValidator
//
//  Created by Alex Miclea on 19/02/16.
//  Copyright © 2016 Alex Miclea. All rights reserved.
//

#import "ALXSFValidator.h"

@implementation ALXSFValidator

#pragma mark - General Validators

/** Check if the given string is empty. */
+ (StringValidatorErrorType)checkIfEmptyString:(NSString *) string {
    
    if ((!string) || (![string length])) {
        return StringValidatorErrorEmptyString;
    } else {
        return StringValidatorSuccess;
    }
}

/** Validate the username format using the given regular expression. */
+ (StringValidatorErrorType)validateString:(NSString *) username withRegularExpression:(NSString *) regularExpression {
    if ((!username) || (![username length])) {
        return StringValidatorErrorEmptyString;
    } else {
        NSError  *error = nil;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: regularExpression options:0 error:&error];
        NSTextCheckingResult *match = [regex firstMatchInString:username options:0 range: NSMakeRange(0, [username length])];
        if (match) {
            return StringValidatorSuccess;
        } else {
            return StringValidatorErrorDoesNotFitPattern;
        }
    }
}

/** Validate the username format using the given regular expression.
 Additional rules for the string to be validated are:
 - The string must be at least minChar characters long.
 - The string must not be be longer that maxChar characters. */
+ (StringValidatorErrorType)validateString:(NSString *) username withRegularExpression:(NSString *) regularExpression withMinimumCharacters:(int) minChar andMaximumCharacters:(int)maxChar {
   
    if ((!username) || (![username length])) {
        return StringValidatorErrorEmptyString;
    } else {
        if ([username length] < minChar) {
            return StringValidatorErrorStringTooShort;
        } else if ([username length] > maxChar) {
            return StringValidatorErrorStringTooLong;
        } else {
            NSError  *error = nil;
            NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: regularExpression options:0 error:&error];
            NSTextCheckingResult *match = [regex firstMatchInString:username options:0 range: NSMakeRange(0, [username length])];
            if (match) {
                return StringValidatorSuccess;
            } else {
                return StringValidatorErrorStringContainsSpecialCharacters;
            }
        }
        
    }
}

/** Validate if two strings are equal. */
+ (StringValidatorErrorType)checkIfString:(NSString *) firstString matchesString:(NSString *) secondString {
    if ([firstString isEqualToString:secondString]) {
        return StringValidatorSuccess;
    } else {
        return StringValidatorErrorDoesNotMatch;
    }
}

/** Check if the given string has the given minimum number of characters. */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMinimumOfCharacters:(int) minimumCharacters {
    if ([string length] < minimumCharacters) {
        return StringValidatorErrorStringTooShort;
    } else {
        return StringValidatorSuccess;
    }
}

/** Check if the given string has the given  */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMaximumfCharacters:(int) maximumCharactes {
    if ([string length] < maximumCharactes) {
        return StringValidatorErrorStringTooLong;
    } else {
        return StringValidatorSuccess;
    }
}

/** Check if the given string has the given minimum number of characters and the
 maximum number of characters.. */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMinimumOfCharacters:(int) minimumCharacters andMaximumfCharacters:(int) maximumCharactes {
    
    if ([string length] < minimumCharacters) {
        return StringValidatorErrorStringTooShort;
    } else if ([string length] < maximumCharactes) {
        return StringValidatorErrorStringTooLong;
    } else {
        return StringValidatorSuccess;
    }
}

#pragma mark - Username Validators

/** Validate the username format using the following regular expression:
 "^[A-Za-z0-9_-]{3,16}$." The rules for the string to be validated are:
 - The string must be at least 3 characters long.
 - The string must not be be longer that 16 characters.
 - The string must only contain alphanumeric characters.*/
+ (StringValidatorErrorType)validateGeneralUsernameFormat:(NSString *) username {
    
    if ((!username) || (![username length])) {
        return StringValidatorErrorEmptyString;
    } else {
        if ([username length] < 3) {
            return StringValidatorErrorStringTooShort;
        } else if ([username length] > 16) {
            return StringValidatorErrorStringTooLong;
        } else {
            NSString *pattern = @"^[A-Za-z0-9_-]";
            NSError  *error = nil;
            NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
            NSTextCheckingResult *match = [regex firstMatchInString:username options:0 range: NSMakeRange(0, [username length])];
            if (match) {
                return StringValidatorSuccess;
            } else {
                return StringValidatorErrorStringContainsSpecialCharacters;
            }
        }

    }
}

/** Validate the username format using the following regular expression:
 "^[A-Za-z0-9_-]{minChar,maxChar}$." The rules for the string to be validated are:
 - The string must be at least minChar characters long.
 - The string must not be be longer that maxChar characters.
 - The string must only contain alphanumeric characters.*/
+ (StringValidatorErrorType)validateUsernameFormat:(NSString *) username withMinimumCharacters:(int) minChar andMaximumCharacters:(int)maxChar {
    
    if ((!username) || (![username length])) {
        return StringValidatorErrorEmptyString;
    } else {
        if ([username length] < minChar) {
            return StringValidatorErrorStringTooShort;
        } else if ([username length] > maxChar) {
            return StringValidatorErrorStringTooLong;
        } else {
            NSString *pattern = @"^[A-Za-z0-9_-]";
            NSError  *error = nil;
            NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
            NSTextCheckingResult *match = [regex firstMatchInString:username options:0 range: NSMakeRange(0, [username length])];
            if (match) {
                return StringValidatorSuccess;
            } else {
                return StringValidatorErrorStringContainsSpecialCharacters;
            }
        }
        
    }
}

@end
