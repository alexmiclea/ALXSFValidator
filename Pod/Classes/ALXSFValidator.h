//
//  ALXSFValidator.h
//  ALXSFValidator
//
//  Created by Alex Miclea on 19/02/16.
//  Copyright © 2016 Alex Miclea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALXSFValidator : NSObject

typedef NS_ENUM(NSInteger, StringValidatorErrorType) {
    StringValidatorSuccess = 0,
    StringValidatorErrorEmptyString,
    StringValidatorErrorDoesNotMatch,
    StringValidatorErrorDoesNotFitPattern,
    StringValidatorErrorStringTooShort,
    StringValidatorErrorStringTooLong,
    StringValidatorErrorStringContainsSpecialCharacters
};


#pragma mark - General Validators

/** Check if the given string is empty. */
+ (StringValidatorErrorType)checkIfEmptyString:(NSString *) string;

/** Validate the username format using the given regular expression. */
+ (StringValidatorErrorType)validateString:(NSString *) username withRegularExpression:(NSString *) regularExpression;

/** Validate the username format using the given regular expression.
 Additional rules for the string to be validated are:
 - The string must be at least minChar characters long.
 - The string must not be be longer that maxChar characters. */
+ (StringValidatorErrorType)validateString:(NSString *) username withRegularExpression:(NSString *) regularExpression withMinimumCharacters:(int) minChar andMaximumCharacters:(int)maxChar;

/** Validate if two strings are equal. */
+ (StringValidatorErrorType)checkIfString:(NSString *) firstString matchesString:(NSString *) secondString;

/** Check if the given string has the given minimum number of characters. */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMinimumOfCharacters:(int) minimumCharacters;

/** Check if the given string has the given  */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMaximumfCharacters:(int) maximumCharactes;

/** Check if the given string has the given minimum number of characters and the
 maximum number of characters.. */
+ (StringValidatorErrorType)checkIfString:(NSString *) string hasMinimumOfCharacters:(int) minimumCharacters andMaximumfCharacters:(int) maximumCharactes;

#pragma mark - Username Validators

/** Validate the username format using the following regular expression:
 "^[A-Za-z0-9_-]{3,16}$." The rules for the string to be validated are:
    - The string must be at least 3 characters long.
    - The string must not be be longer that 16 characters.
    - The string must only contain alphanumeric characters.*/
+ (StringValidatorErrorType)validateGeneralUsernameFormat:(NSString *) username;

/** Validate the username format using the following regular expression:
 "^[A-Za-z0-9_-]{minChar,maxChar}$." The rules for the string to be validated are:
 - The string must be at least minChar characters long.
 - The string must not be be longer that maxChar characters.
 - The string must only contain alphanumeric characters.*/
+ (StringValidatorErrorType)validateUsernameFormat:(NSString *) username withMinimumCharacters:(int) minChar andMaximumCharacters:(int)maxChar;

#pragma mark - Email Validators

/** Validate the email format using regular expression. */
+ (StringValidatorErrorType)validateEmailFormat:(NSString *) email;

#pragma mark - Password Validators

/** Validate the password format using regular expression. */
+ (StringValidatorErrorType)validatePasswordFormat:(NSString *) password;

@end
