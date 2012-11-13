//
//  TweetAction.h
//  TweetAction
//
//  Created by Les Stroud on 11/7/12.
//  Copyright (c) 2012 Crafted Code. All rights reserved.
//

#import <Automator/AMBundleAction.h>
#import <AppKit/AppKit.h>

@interface TweetAction : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
