//
//  PRPAppDelegate.h
//  Recipes
//
//  Created by Jon Pedersen on 17/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import <UIKit/UIKit.h>

//
@class PRPRecipesListViewController;
@interface PRPAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PRPRecipesListViewController *viewController;
@property (copy, nonatomic) NSArray *recipes;
@end
//
