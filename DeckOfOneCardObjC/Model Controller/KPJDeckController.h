//
//  KPJDeckController.h
//  DeckOfOneCardObjC
//
//  Created by Kyle Jennings on 12/3/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPJDeck.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPJDeckController : NSObject

+ (void)fetchNewCard: (NSString *)nothing completion: (void (^_Nullable) (KPJDeck *_Nullable))completion;

+ (void)fetchCardImage: (KPJDeck *)deck completion: (void (^_Nullable) (UIImage *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
