//
//  PRPViewController.m
//  Recipes
//
//  Created by Jon Pedersen on 17/05/13.
//  Copyright (c) 2013 jApps. All rights reserved.
//

#import "PRPViewController.h"

@interface PRPViewController ()

@end

@implementation PRPViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.recipeTitle.text = self.recipe.title;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
