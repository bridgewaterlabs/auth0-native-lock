//
// Auth0Module.swift
//

import UIKit
import Lock
import Auth0

@objc class Auth0Module: NSObject {
  
  // MARK: - Enums
  enum ProfileDataType {
    case name
    case givenName
    case nickname
    case preferredUsername
    case picture
    case gender
    case birthdate
  }
  
  // MARK: - Singleton instance
  
  static let shared = Auth0Module()
  
  // MARK: - Variables
  var lock: Lock?
  
  // MARK: - Exposed methods
  
  func configure() {
    lock = Lock.classic().withOptions {
      $0.oidcConformant = true
      $0.scope = "openid profile"
    }
  }
  
  func configure(cliendId: String, domain: String) {
    lock = Lock.classic(clientId: cliendId, domain: domain).withOptions {
      $0.oidcConformant = true
      $0.scope = "openid profile"
    }
  }
  
  func show(success: @escaping ((String) -> (Void)), failure: @escaping ((String) -> (Void))) {
    if let controller = UIApplication.shared.windows.first?.rootViewController {
      
      lock?.onAuth { credentials in
        guard let accessToken = credentials.accessToken else {
          failure("Access token is missing.")
          return
        }
        
        success(accessToken)
        }.onError(callback: { error in
          failure(error.localizedDescription)
        })
        .present(from: controller)
    }
  }
  
  func hide(callback: @escaping (() -> (Void))) {
    if let controller = UIApplication.shared.windows.first?.rootViewController {
      controller.dismiss(animated: true, completion: callback)
    } else {
      callback()
    }
  }
  
  func fetchProfile(accessToken: String,
                        success: @escaping (([String: String]) -> (Void)), failure: @escaping ((String) -> (Void))) {
    Auth0
      .authentication()
      .userInfo(withAccessToken: accessToken)
      .start { result in
        switch result {
        case .success(let profile):
          let tempJson = Parser.toDictionary(object: profile)
          if let json = tempJson as? [String : String] {
            success(json)
          } else {
            failure("Error serializing JSON")
          }
        case .failure(let error):
          failure(error.localizedDescription)
        }
    }
  }
  
  func showAndFetchProfile(success: @escaping ((String,[String: String]) -> (Void)),
                           failure: @escaping ((String) -> (Void))) {
    show(success: { [weak self] accessToken in
      self?.fetchProfile(accessToken: accessToken, success: { profile in
          success(accessToken, profile)
      }, failure: failure)
    }, failure: failure)
  }
  
  /*
   * Method for theme customization
   *
   **/
  
  func customize(with resources: [String: String]) {
    if var unwrappedLock = lock {
      Auth0Theme.customize(&unwrappedLock, with: resources)
    }
  }
}
