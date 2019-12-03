//
//  KPJDeck.h
//  DeckOfOneCardObjC
//
//  Created by Kyle Jennings on 12/3/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KPJDeck : NSObject

@property (nonatomic, readonly) NSString *card;
@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) NSString *imageURL;

- (instancetype)initWithCard: (NSString *)card
                        suit: (NSString *)suit
                    imageURL: (NSString *)imageURL;

@end

@interface KPJDeck (JSONConvertable)

- (instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
