//
//  Auth0Provider.m
//

#import "Auth0Provider.h"
#import <UIKit/UIKit.h>
#import "reactAuth0-Swift.h"

@implementation Auth0Provider
  RCT_EXPORT_MODULE();
  
  RCT_EXPORT_METHOD(configure) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] configure];
    });
  }
  
  RCT_EXPORT_METHOD(configureWithClientId:(NSString*) clientId andDomain:(NSString*) domain) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] configureWithCliendId:clientId domain:domain];
    });
  }
  
  RCT_EXPORT_METHOD(showWithCallback:(RCTResponseSenderBlock) callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] showWithSuccess:^(NSString *msg) {
        callback(@[[NSNumber numberWithBool:YES], msg]);
      } failure: ^(NSString *msg) {
        callback(@[[NSNumber numberWithBool:NO], msg]);
      }];
    });
  }
  
  RCT_EXPORT_METHOD(hideWithCallback:(RCTResponseSenderBlock) callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] hideWithCallback: ^{
        callback(@[]);
      }];
    });
  }
  
  RCT_EXPORT_METHOD(fetchProfileWithAccessToken:(NSString*) accessToken
                    callback:(RCTResponseSenderBlock) callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] configure];
      
      [[Auth0Module shared] fetchProfileWithAccessToken:accessToken success:^(NSDictionary *profileData) {
        callback(@[[NSNumber numberWithBool:YES], profileData]);
      } failure: ^(NSString *msg) {
        callback(@[[NSNumber numberWithBool:NO], msg]);
      }];
    });
    
  }
  
  
  RCT_EXPORT_METHOD(showAndFetchProfileWithCallback:(RCTResponseSenderBlock) callback) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] showAndFetchProfileWithSuccess:^(NSString *accessToken, NSDictionary *profileData) {
        callback(@[accessToken, profileData]);
      } failure:^(NSString *msg) {
        callback(@[msg, @""]);
      }];
    });
    
  }
  
  /*
   * Methods for theme customization
   *
   **/
  
  RCT_EXPORT_METHOD(customizeWithResources:(NSDictionary*) resources) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[Auth0Module shared] customizeWith:resources];
    });
  }
  
  
  @end
