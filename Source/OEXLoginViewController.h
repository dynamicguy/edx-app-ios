//
//  OEXLoginViewController.h
//  edXVideoLocker
//
//  Created by Nirbhay Agarwal on 15/05/14.
//  Copyright (c) 2014-2016 edX. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@class OEXLoginViewController;

@protocol OEXLoginViewControllerDelegate <NSObject>

- (void)loginViewControllerDidLogin:(OEXLoginViewController*)loginController;

@end

@interface OEXLoginViewController : UIViewController

@property (weak, nonatomic, nullable) id <OEXLoginViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
