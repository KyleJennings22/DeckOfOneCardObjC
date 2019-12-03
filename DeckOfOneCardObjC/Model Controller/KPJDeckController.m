//
//  KPJDeckController.m
//  DeckOfOneCardObjC
//
//  Created by Kyle Jennings on 12/3/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJDeckController.h"
#import "KPJDeck.h"

static NSString *const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation KPJDeckController

+ (void)fetchNewCard:(NSString *)nothing completion:(void (^)(KPJDeck * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:baseURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            completion(nil);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!topLevelDictionary) {
                NSLog(@"Error parsing JSON: %@", error);
                completion(nil);
                return;
            }
            KPJDeck *deck = [[KPJDeck alloc] initWithDictionary:topLevelDictionary];
            completion(deck);
        }
    }] resume];
}

+ (void)fetchCardImage:(KPJDeck *)deck completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:deck.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            completion(nil);
            return;
        }
        
        if (data)
        {
            UIImage *image = [[UIImage alloc] initWithData:data];
            completion(image);
        }
    }] resume];
}

@end
