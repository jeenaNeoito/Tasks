//
//  PipIosModule.m
//  Tasks
//
//  Created by neoito on 18/03/23.
//

//#import <Foundation/Foundation.h>

#import "PipIosModule.h"
#import <AVKit/AVKit.h>

@implementation PipIosModule

RCT_EXPORT_MODULE(PipIosModule);

RCT_EXPORT_METHOD(startPIPMode:(NSString *)videoURL) {
  NSLog(@"test console");
  dispatch_async(dispatch_get_main_queue(), ^{
    NSURL *url = [NSURL URLWithString:videoURL];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player = player;
    playerViewController.showsPlaybackControls = YES;
    playerViewController.videoGravity = AVLayerVideoGravityResizeAspectFill;

    // Get the video player size and position
    AVPlayerLayer *playerLayer = (AVPlayerLayer *)playerViewController.view.layer;
    [playerLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CGRect videoRect = CGRectMake(0, 0, playerLayer.videoRect.size.width, playerLayer.videoRect.size.height);
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat videoAspectRatio = videoRect.size.width / videoRect.size.height;
    CGFloat screenWidthAspectRatio = screenSize.width / screenSize.height;
    CGFloat scaleFactor = screenWidthAspectRatio > videoAspectRatio ? videoRect.size.width / screenSize.width : videoRect.size.height / screenSize.height;
    CGSize scaledVideoSize = CGSizeMake(videoRect.size.width / scaleFactor, videoRect.size.height / scaleFactor);
    CGPoint scaledVideoOrigin = CGPointMake((screenSize.width - scaledVideoSize.width) / 2, (screenSize.height - scaledVideoSize.height) / 2);
    CGRect scaledVideoRect = CGRectMake(scaledVideoOrigin.x, scaledVideoOrigin.y, scaledVideoSize.width, scaledVideoSize.height);

    // Create a new window for the player
    UIWindow *playerWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [playerWindow makeKeyAndVisible];
    playerWindow.windowLevel = UIWindowLevelAlert + 1;
    playerViewController.view.frame = scaledVideoRect;
    [playerWindow addSubview:playerViewController.view];

////    // Add observer to detect when player finished playing video
////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:player.currentItem];
    [player play];
  });
}

@end

