//
//  PRPViewController.h
//  Recipes
//
//  Created by Jon Pedersen on 17/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipe.h"

@interface PRPViewController : UIViewController
@property(nonatomic, strong) IBOutlet UILabel *recipeTitle;
@property(nonatomic, strong) PRPRecipe *recipe;
@end
