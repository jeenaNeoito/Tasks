//
//  PipIosModule.h
//  Tasks
//
//  Created by neoito on 18/03/23.
//

#import <React/RCTBridgeModule.h>
#import "RCTVideoPlayerViewController.h"

@interface PipIosModule : NSObject <RCTBridgeModule>

@property(nonatomic, strong) AVPlayerViewController *playerViewController;
@property(nonatomic, strong) UIView *playerView;

@end

