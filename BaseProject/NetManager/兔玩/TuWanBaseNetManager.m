//
//  TuWanBaseNetManager.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/3.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanBaseNetManager.h"
#define kTuWan @"http://cache.tuwan.com/app/"
#define kappid @"appid":@"1"
#define kclassmore @"classmore":@"indexpic"
#define kappver @"appver":@"2.1"
#define kAlldtid @"dtid":@"83623,31528,31537,31538,57067,91821"
@implementation TuWanBaseNetManager
+(id)getListWithType:(TuWanListType)type start:(NSInteger)start completionHandle:(void (^)(TuWanBaseModel *, NSError *))completionHandle
{
    NSString *path = kTuWan;
    NSDictionary *params = [NSDictionary new];
    switch (type) {
        case TuWanListTypeAnhei3:
            params = @{kappid,kclassmore,kappver,@"dtid":@"83623",@"start":@(start)};
            break;
        case TuWanListTypeCos:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"class":@"cos",@"mod":@"cos",@"dtid":@"0"};
            break;
        case TuWanListTypeDujia:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"class":@"heronews",@"mod":@"八卦"};
            break;
        case TuWanListTypeFengbao:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"dtid":@"31538"};
            break;
        case TuWanListTypeHuanhua:
            params = @{kappid,kappver,@"start":@(start),@"class":@"heronews",@"mod":@"幻化"};
            break;
        case TuWanListTypeLushi:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"dtid":@"31528"};
            break;
        case TuWanListTypeMeinv:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"class":@"heronews",@"mod":@"美女",@"typechild":@"cos1"};
            break;
        case TuWanListTypeMoshou:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"dtid":@"31537"};
            break;
        case TuWanListTypeQuwen:
            params = @{kappid,kclassmore,kappver,@"start":@(start),@"dtid":@"0",@"mod":@"趣闻"};
            break;
        case TuWanListTypeShouwang:
            params = @{kappid,kappver,@"start":@(start),@"dtid":@"57067"};
            break;
        case TuWanListTypeToutiao:
            params = @{kappid,kclassmore,kappver,@"start":@(start)};
            break;
        case TuWanListTypeXingji2:
            params = @{kappid,kappver,@"start":@(start),@"dtid":@"91821"};
            break;
        case TuWanListTypeGuide:
            params = @{kappid,kappver,@"start":@(start),kAlldtid,@"type":@"guide"};
            
            break;
        case TuWanListTypePicture:
            params = @{kappid,kappver,@"start":@(start),kAlldtid,@"type":@"pic"};
            break;
        case TuWanListTypeVideo:
            params = @{kappid,kappver,@"start":@(start),kAlldtid,@"type":@"video"};
            break;
        default:
            break;
    }
    path = [self pathWithPercent:path params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanBaseModel mj_objectWithKeyValues:responseObj],error);
    }];
   


}
+(NSString *)pathWithPercent:(NSString *)path params:(NSDictionary *)patams
{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = patams.allKeys;
    NSInteger count = keys.count;
    for (int i = 0; i < count; i++) {
        if(i == 0)
        {
            [percentPath appendFormat:@"?%@=%@",keys[i],patams[keys[i]]];
        }
        else
        {
            [percentPath appendFormat:@"&%@=%@",keys[i],patams[keys[i]]];
        }
    }

    return  [percentPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (id)getVideoDetailWithId:(NSString *)aid completionHandle:(void(^)(NSArray *model,NSError *error))completionHandle
{
    NSDictionary *params = @{kappid,@"aid":aid};
    NSString *path = [self pathWithPercent:kTuWan params:params];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
            completionHandle([TuWanVideoModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
+ (id)getPicDetailWithId:(NSString *)aid completionHandle:(void(^)(NSArray *model,NSError *error))completionHandle
{
    NSDictionary *params = @{kappid, @"aid": aid};
    NSString *path = [self pathWithPercent:kTuWan params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanPicModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
@end
