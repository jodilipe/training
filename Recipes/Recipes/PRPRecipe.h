//
//  PRPRecipe.h
//  Recipes
//
//  Created by Jon Pedersen on 17/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPRecipe : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *directions;
@property(nonatomic, strong) UIImage *image;
@end
