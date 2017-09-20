//
//  CollectionViewController.m
//  Less_12
//
//  Created by Nikita Vintonovich on 9/19/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 8; i++)
    {
        CGFloat red = (arc4random() % 101) * 0.01f;
        CGFloat green = (arc4random() % 101) * 0.01f;
        CGFloat blue = (arc4random() % 101) * 0.01f;
        
        UIColor *randomColor = [UIColor colorWithRed:red
                                               green:green
                                                blue:blue
                                               alpha:1.0f];
        
        NSString *textValue = [NSString stringWithFormat:@"%lu", i+1];
        
        NSDictionary *dictionary = @{@"textKey" : textValue,
                                     @"colorKey" : randomColor};
        
        [self.array addObject:dictionary];
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UILabel *label = [cell.contentView subviews].firstObject;
    
    if (label == nil)
    {
        label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
    }
    
    NSDictionary *dictionary = [self.array objectAtIndex:indexPath.row];
    
    NSString *text = [dictionary objectForKey:@"textKey"];
    UIColor *color = [dictionary objectForKey:@"colorKey"];
    
    label.text = text;
    label.backgroundColor = color;
    
// короткая запись:
//    label.text = self.array[indexPath.row][@"textKey"];
//    label.backgroundColor = self.array[indexPath.row][@"colorKey"];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    
}


@end
