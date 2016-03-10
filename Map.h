//
//  Map.h
//  1
//
//  Created by стен on 28.02.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ViewControllerInput.h"

@interface Map : UIViewController <MKMapViewDelegate, MKOverlay, delegateView>
{
   
}

@property (weak, atomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *LatInput;
@property (nonatomic, retain) NSString *LngInput;
@property (nonatomic, retain) NSString *Latoutput;
@property (nonatomic, retain) NSString *Lngoutput;



@end
