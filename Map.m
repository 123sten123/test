//
//  Map.m
//  1
//
//  Created by стен on 28.02.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import "Map.h"
#import "ViewControllerInput.h"


@interface Map ()
{
    NSURLSession *session;
    NSString *  endLat ;
    NSString * endLng;
    NSString * startLat;
    NSString * startLng;
    CLLocationCoordinate2D mapCor[2];
  //  NSString *urlAsString;
  
}
@end

@implementation Map
@synthesize mapView;
@synthesize LatInput;
@synthesize LngInput;
@synthesize Latoutput;
@synthesize Lngoutput;

//@synthesize LatLat;





- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithOverlay:overlay] ;
    polylineView.strokeColor = [UIColor blackColor];
    polylineView.lineWidth = 5.0;
    return polylineView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
 
   
    //загружаем данные от google
    /*
   NSString * urlAsString = @"https://maps.googleapis.com/maps/api/directions/json?origin=51.8749997,53.1882357&destination=56.8486065,53.2264456&avoid=transit&key=AIzaSyCY0hUrLEaIgQRPwupNSTrh78fp5QnLgsw";*/
  
    NSString *urlAsString = @"https://maps.googleapis.com/maps/api/directions/json?origin";
    urlAsString = [urlAsString stringByAppendingString:@"=59.89444,30.26417&destination"];//координата начала
    urlAsString = [urlAsString stringByAppendingString:@"=56.8486065,53.2264456&avoid"];//координата конца
    urlAsString = [urlAsString stringByAppendingString:@"=transit&key=AIzaSyCY0hUrLEaIgQRPwupNSTrh78fp5QnLgsw"]; //api-key
    
   // NSLog(@"%@", urlAsString);
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithURL:url  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          if(error)
          {
              NSLog(@"Не подключен интернет");
              NSLog(@"%@", error);
          }
          else
          {
              NSDictionary * personDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
              
              NSDictionary *Routes = personDict[@"routes"];
              NSDictionary *legs;
              NSDictionary *steps;
              NSDictionary *location;
              NSDictionary *startEnd;
             
              
              for(legs in Routes)
              {
                  steps =[legs objectForKey:@"legs"];
                 for(location in steps)
                  {
                      NSDictionary *c = [location objectForKey:@"steps"];
                      for(startEnd in c)
                      {
                          
                        NSDictionary *end = [startEnd objectForKey:@"end_location"];
                        endLat = [end objectForKey:@"lat"];
                        endLng = [end objectForKey:@"lng"];
                        NSDictionary *start = [startEnd objectForKey:@"start_location"];
                        startLat = [start objectForKey:@"lat"];
                        startLng = [start objectForKey:@"lng"];
                        MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:mapCor count:2];
                        mapCor[0]=CLLocationCoordinate2DMake([startLat doubleValue],[startLng doubleValue]);
                        mapCor[1]=CLLocationCoordinate2DMake([endLat doubleValue],[endLng doubleValue]);
                        [mapView addOverlay:polyLine];
                        [mapView setNeedsDisplay];
                        [mapView setDelegate:self];
                          
                         
                        }
                  }
              }
          }
      }] resume];
    
   
   
    
       //настраиваем map
    MKCoordinateRegion region = {{0.0,0.0},{0.0,0.0}};
    region.center.latitude =  56.8749;
    region.center.longitude = 53.1882357;
    region.span.latitudeDelta= 0.01f;
    region.span.longitudeDelta= 0.01f;
    [mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
