//
//  KPJDeck.m
//  DeckOfOneCardObjC
//
//  Created by Kyle Jennings on 12/3/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJDeck.h"

@implementation KPJDeck

- (instancetype)initWithCard:(NSString *)card suit:(NSString *)suit imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self)
    {
        _card = card;
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

@end

@implementation KPJDeck (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSArray *cardsArray = dictionary[@"cards"];
    NSString *card = dictionary[@"value"];
    NSString *suit = dictionary[@"suit"];
    NSString *imageURL = dictionary[@"image"];
    
    for (NSDictionary *dictionary in cardsArray)
    {
        card = dictionary[@"value"];
        suit = dictionary[@"suit"];
        imageURL = dictionary[@"images"][@"png"];
        
    }
    
    return [self initWithCard:card suit:suit imageURL:imageURL];
}

@end
