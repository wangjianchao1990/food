//
//  mapSearchController.h
//  food
//
//  Created by MAC on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件

#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件

#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件

#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件



@protocol huichuanlatitudeandlongitudeDelegate <NSObject>

- (void)huichuanlongitude:(CGFloat)longitude andlatitude:(CGFloat)latitude;

@end

@interface mapSearchController : UIViewController
{
    BMKLocationService* _locService;

}
@property(nonatomic,strong)BMKMapView *mapView;

@property (nonatomic, weak)id <huichuanlatitudeandlongitudeDelegate>delegate;

@end
