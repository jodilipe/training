//
//  main.m
//  Cocos2DSimpleGame
//
//  Created by Jon Pedersen on 29/08/13.
//  Copyright jApps 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}
