//
//  ViewController.h
//  BlurTest
//
//  Created by Alex on 23/09/16.
//  Copyright © 2016 Pixzelle Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *cvColors;

@end

