//
//  Auth0Theme.swift
//


import Foundation
import Lock
import Auth0

private let Auth0ThemeTitleText = "Auth0ThemeTitleText"
private let Auth0ThemeLogoImageName = "Auth0ThemeLogoImageName"
private let Auth0ThemePrimaryButtonColor = "Auth0ThemePrimaryButtonColor"
private let Auth0ThemePrimaryTintButtonColor = "Auth0ThemePrimaryTintButtonColor"
private let Auth0ThemeSecondaryButtonColor = "Auth0ThemeSecondaryButtonColor"
private let Auth0ThemeInputTextColor = "Auth0ThemeInputTextColor"
private let Auth0ThemeInputPlaceholderTextColor = "Auth0ThemeInputPlaceholderTextColor"
private let Auth0ThemeInputIconColor = "Auth0ThemeInputIconColor"
private let Auth0ThemeTitleColor = "Auth0ThemeTitleColor"
private let Auth0ThemeInputBorderColor = "Auth0ThemeInputBorderColor"
private let Auth0ThemeSeperatorTextColor = "Auth0ThemeSeperatorTextColor"
private let Auth0ThemeBackgroundColor = "Auth0ThemeBackgroundColor"
private let Auth0ThemeHeaderColor = "Auth0ThemeHeaderColor"

@objc class Auth0Theme: NSObject {
  
  static func customize(_ lock: (inout Lock), with resources: [String: String]) {
    lock = lock.withStyle({
      
      for resource in resources {
        
        switch resource.key {
        case Auth0ThemeTitleText:
          $0.title = resource.value
        case Auth0ThemeLogoImageName:
          $0.logo = LazyImage(name: resource.value)
        case Auth0ThemePrimaryButtonColor:
          $0.primaryColor = getColor(hex: resource.value)
        case Auth0ThemePrimaryTintButtonColor:
          $0.buttonTintColor = getColor(hex: resource.value)
        case Auth0ThemeSecondaryButtonColor:
          $0.secondaryButtonColor = getColor(hex: resource.value)
        case Auth0ThemeInputTextColor:
          $0.inputTextColor = getColor(hex: resource.value)
        case Auth0ThemeInputPlaceholderTextColor:
          $0.inputPlaceholderTextColor = getColor(hex: resource.value)
        case Auth0ThemeInputIconColor:
          $0.inputIconColor = getColor(hex: resource.value)
        case Auth0ThemeTitleColor:
          $0.titleColor = getColor(hex: resource.value)
        case Auth0ThemeSeperatorTextColor:
          $0.seperatorTextColor = getColor(hex: resource.value)
        case Auth0ThemeBackgroundColor:
          $0.backgroundColor = getColor(hex: resource.value)
        case Auth0ThemeInputBorderColor:
          $0.inputBorderColor = getColor(hex: resource.value)
        case Auth0ThemeHeaderColor:
          $0.headerColor = getColor(hex: resource.value)
        default:
          break
        }
        
      }
      
    })
  }
  
  // MARK: - Private methods
  static private func getColor(hex: String) -> UIColor {
    if hex.isEmpty {
      return UIColor.clear
    } else {
      return UIColor.a0_fromRGB(hex)
    }
    
  }
  
}
