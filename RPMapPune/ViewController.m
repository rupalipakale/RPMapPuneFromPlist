//
//  ViewController.m
//  RPMapPune
//
//  Created by Student P_07 on 13/01/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"Showing five cities annotations on map.";
        [self initLocationManager];
        [self getPlistArray];
}
-(void)initLocationManager
{
    locationManager=[[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager requestAlwaysAuthorization];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
 
}

-(void)getPlistArray
{
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"PuneLatLong" ofType:@"plist"];
    cityArray=[[NSArray alloc]initWithContentsOfFile:path];
    NSLog(@"%@",cityArray);
    if(cityArray.count>0)
        [self showPointsOnMap];
    
}

-(void)showPointsOnMap
{
    MKPointAnnotation *point;
    for (int i=0; i<cityArray.count; i++) {
        point = [[MKPointAnnotation alloc]init];
        point.title =[[cityArray objectAtIndex:i]valueForKey:@"City"];
        
        CLLocationCoordinate2D coord;
        coord.longitude = (CLLocationDegrees)[[[cityArray objectAtIndex:i]valueForKey:@"Longitude"] doubleValue];
        coord.latitude = (CLLocationDegrees)[[[cityArray objectAtIndex:i]valueForKey:@"Latitude"] doubleValue];
        point.coordinate=coord;
        NSLog(@"%@",point.title);
        NSLog(@"%lf",coord.latitude);
        NSLog(@"%lf",coord.longitude);
        [_mapView addAnnotation:point];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
