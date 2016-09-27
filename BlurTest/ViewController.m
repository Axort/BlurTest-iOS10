//
//  ViewController.m
//  BlurTest
//
//  Created by Alex on 23/09/16.
//  Copyright © 2016 Pixzelle Studio. All rights reserved.
//

#import "ViewController.h"
#import "ColorCollectionViewCell.h"
#import "PresentationAnimator.h"
#import "DismissAnimator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) NSMutableArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.colors = [NSMutableArray array];
    
    [self.colors addObject:[UIColor redColor]];
    [self.colors addObject:[UIColor purpleColor]];
    [self.colors addObject:[UIColor greenColor]];
    [self.colors addObject:[UIColor grayColor]];
    [self.colors addObject:[UIColor cyanColor]];
    [self.colors addObject:[UIColor magentaColor]];
    [self.colors addObject:[UIColor brownColor]];
    
    [self.cvColors registerNib:[UINib nibWithNibName:@"ColorCollectionViewCell"
                                              bundle:[NSBundle mainBundle]]
    forCellWithReuseIdentifier:@"colorCell"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueBlur"]) {
        ((UIViewController *)segue.destinationViewController).providesPresentationContextTransitionStyle = YES;
        ((UIViewController *)segue.destinationViewController).definesPresentationContext = YES;
        ((UIViewController *)segue.destinationViewController).modalPresentationStyle = UIModalPresentationOverFullScreen;
        
        ((UIViewController *)segue.destinationViewController).transitioningDelegate = self;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ColorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colorCell" forIndexPath:indexPath];
    
    cell.vColor.backgroundColor = self.colors[arc4random_uniform([self.colors count])];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"segueBlur" sender:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width * 0.5, self.view.frame.size.width * 0.5);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0f;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0f;
}

#pragma mark - Custom Transition

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [PresentationAnimator new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DismissAnimator new];
}

@end
