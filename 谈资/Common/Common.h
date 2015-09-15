//
//  Common.h
//  Weibo
//
//  Created by Kathy on 15-7-13.
//  Copyright (c) 2014年 www.huiwen.com 汇文教育无线学院. All rights reserved.
//

#ifndef HW_Common_h
#define HW_Common_h


//新闻信息url
//#define Newsurl    @"http://mobile.itanzi.com/wap/api/NewsList/0/0/10"


//屏幕的宽、高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


//新浪微博的key
#define kAppKey             @"3174791211"
#define kAppSecret          @"991ae1a4878ded584028203300913c3d"
#define kAppRedirectURI     @"https://api.weibo.com/oauth2/default.html"


//判断是否是iOS7以上
#define ios7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define ios8 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

//定义宏来表示网络申请的URL
#define unread_count @"remind/unread_count.json"  //未读消息
#define home_timeline @"statuses/home_timeline.json"  //微博列表
#define comment @"comments/show.json"
#define send_update @"statuses/update.json"  //发微博(不带图片)
#define send_upload @"statuses/upload.json"  //发微博(带图片)
#define users_profile @"users/show.json"    //用户信息
#define user_timeline @"statuses/user_timeline.json"  //用户的微博列表
#define URL_FRIENDS @"friendships/friends.json" //关注列表
#define URL_FOLOWERS @"friendships/followers.json"  //粉丝列表
#define nearby_timeline @"place/nearby_timeline.json" //附近的微博
#define geo_to_address @"location/geo/geo_to_address.json"  //查询坐标对应的位置


//定义宏来确定weiboView的相关字体大小
#define FontSize_Weibo(isDetail) (isDetail)?15:13
#define FontSize_ReWeibo(isDetail) (isDetail)?14:12



//导航栏的高度
#define kNavigationHeight (ios7?0:64)





#endif
