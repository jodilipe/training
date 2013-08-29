//
//  PRPAppDelegate.m
//  Recipes
//
//  Created by Jon Pedersen on 17/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import "PRPAppDelegate.h"
#import "PRPRecipe.h"
#import "PRPRecipesListViewController.h"


@implementation PRPAppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[PRPRecipesListViewController alloc]
                           initWithNibName:@"PRPRecipesListViewController"
                           bundle:nil];
    self.window.rootViewController = self.viewController;
    self.viewController.recipes = self.recipes;
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSArray *)recipes {
    if(!_recipes) {
        //
        //
        NSMutableArray *localRecipes = [NSMutableArray array];
        PRPRecipe *recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"0 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"0 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"1 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"1 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        //
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"2 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"2 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"3 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"3 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"4 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"4 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"5 - Put some stuff in, and the other stuff, then stir";
        recipe.title = @"5 - One Fine Food";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        [localRecipes addObject:recipe];
        NSString *directions = @"Put the flour and other dry ingredients in a bowl, \
        stir in the eggs until evenly moist. Add chocolate chips and stir in until even. \
        Place tablespoon sized portions on greased cookie sheet and bake at 350Â° for \
        6 minutes.";
        recipe = [[PRPRecipe alloc] init];
        recipe.title = @"Chocolate Chip Cookies";
        recipe.image = [UIImage imageNamed:@"cookies.jpg"];
        recipe.directions = directions;
        [localRecipes addObject:recipe];
        
        //
        self.recipes = localRecipes;
        //
        //
    }
    return _recipes;
}

@end
