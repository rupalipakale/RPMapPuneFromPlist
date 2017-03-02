//
//  ViewController.h
//  RPMapPune
//
//  Created by Student P_07 on 13/01/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
    NSArray *cityArray;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

