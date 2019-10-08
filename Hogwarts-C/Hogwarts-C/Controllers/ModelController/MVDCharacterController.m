//
//  MVDCharacterController.m
//  Hogwarts-C
//
//  Created by Michael Di Cesare on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "MVDCharacterController.h"

static NSString * const baseURLString = @"https://www.potterapi.com/v1/";
static NSString * const apiKeyValue = @"$2a$10$ipHhcp4crl6up4vfXxBV4us/OYeh52SKjlaKOTWC4rjLCJlYW1hNS";
static NSString * const kApiKeyKey = @"key";
static NSString * const characterString = @"characters";

@implementation MVDCharacterController


+ (instancetype)sharedInstance
{
    static MVDCharacterController * sharedInstance= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MVDCharacterController alloc] init];
    });
    return sharedInstance;
}
// fixed nil error by changing the completeion handler
+ (void)fetchCharacters:(void (^)(NSArray<MVDCharacter *> * _Nullable))completion
{
    // setp 1 Build url
    //base =
    // component ==
    // query item
    
    //step 2 start the data task
    //check the error
    //handle the responce
    // work the data
    //       if data exist then do stuff
    //          data to
    //        serilalize return array of dict of [string : any]
    //        for dict in [array] init with Dict
    NSURL *url = [NSURL URLWithString:baseURLString];
    NSURL *characterURL = [url URLByAppendingPathComponent:characterString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:characterURL  resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:kApiKeyKey value:apiKeyValue];

    urlComponents.queryItems = @[queryItem];

    NSURL *finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"there is an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *topLevelDicionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDicionary)
            {
                NSLog(@"error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            NSMutableArray *characterArray = [NSMutableArray new];
            for (NSDictionary *dictionary in topLevelDicionary)
            {
                MVDCharacter *character= [[MVDCharacter alloc] initWithDictionary:dictionary];
                [characterArray addObject:character];
            }
            completion(characterArray);
        }
        
    }]resume];
}


@end
