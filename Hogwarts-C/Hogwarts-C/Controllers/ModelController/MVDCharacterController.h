//
//  MVDCharacterController.h
//  Hogwarts-C
//
//  Created by Michael Di Cesare on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVDCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVDCharacterController : NSObject

// singleton = not needed but for review
//+(instancetype)sharedInstance;

+ (void)fetchCharacters:(void(^)(NSArray<MVDCharacter *>*character))completion;

@end

NS_ASSUME_NONNULL_END

/*
 1    2    3            4      5    6        7         8 9  10        11       12
 */
//+ (void)fetchCharacters:(void(^)(NSArray<TRWCharacter *>*character))completion;

/*
 1: Method type (+ = class, - = instance)
 2: Return Type of "3"
 3: Name of Method
 4: Return Type of "11"
 5: Block (closure)
 6: Type to complete (NSArray)
 7: Generic type of objects in array (TRWCharacter)
 8: Pointer to "7"
 9: Pointer to "6"
 10: Name of array
 11: Name of Second method
 12: ;
 */
