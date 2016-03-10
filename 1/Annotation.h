//
//  Annotation.h
//  1
//
//  Created by стен on 10.03.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy, readonly) NSString *titel;
@property(nonatomic, copy, readonly) NSString *subTitel;

-(instancetype) initWithCoordinates:(CLLocationCoordinate2D) parCoordinates;
                          /*    title:(NSString *)paramTitel
                           SubTitel:(NSString *) paramSubTitel;
*/
@end
