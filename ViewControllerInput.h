//
//  ViewControllerInput.h
//  1
//
//  Created by стен on 09.03.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol delegateView <NSObject>

-(void) nameViewDelegate: (NSString *) Lal : (NSString *) Lng;

@end

@interface ViewControllerInput : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *LatStr;
@property (weak, nonatomic) NSString *LngStr;
@property (nonatomic, weak) id<delegateView> delegate;

@end
