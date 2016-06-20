//
//  mapSearchController.m
//  food
//
//  Created by MAC on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "mapSearchController.h"

@interface mapSearchController () <BMKMapViewDelegate,BMKLocationServiceDelegate>


@end

@implementation mapSearchController
{
    CGFloat ax;
    CGFloat ay;
}

- (BMKMapView *)mapView
{
    if (!_mapView) {
        BMKMapView *mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
        
        _mapView = mapView;
    }
    return _mapView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
    [_mapView setZoomLevel:18];
    
    [self dingwei];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    // Do any additional setup after loading the view.
}

- (void)back
{
    if ([self.delegate respondsToSelector:@selector(huichuanlongitude:andlatitude:)])
    {
        [self.delegate huichuanlongitude:ax andlatitude:ay];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


- (void)dingwei
{
//    [_mapView removeAnnotation:_orAnnotation];
    
//    DingweiCenter = 1;
    
    _locService = [[BMKLocationService alloc]init];
    
    _locService.delegate = self;
    
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    
    [self startUserLocationService];
    
}

- (void)startUserLocationService
{
    [_locService startUserLocationService];
    
//    _updateNum = 1;
    
//    searchCenter = 1;
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
//    if (_updateNum == 1)
//    {
//        _myLocation = userLocation;
    
        ax = userLocation.location.coordinate.longitude;
        ay = userLocation.location.coordinate.latitude;
        
        [self didUpdateBMKUserLocation:userLocation];
        
        //  定位后数据刷新
//        searchCenter = 1;
    
        //  设置屏幕中心点
//        DingweiCenter = 0;
    
    NSLog(@"%f___%f", ax , ay);
    
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:NO];
        
        _mapView.zoomLevel = 18;
        
        [_mapView updateLocationData:userLocation];
        
//    }
    
    _mapView.showsUserLocation = YES;
    
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
