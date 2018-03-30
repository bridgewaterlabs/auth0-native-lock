//
//  UserInfo+Extension.swift
//

import Lock
import Auth0

extension UserInfo: Encodable {
  
  enum CodingKeys: String, CodingKey {
    case name
    case givenName
    case familyName
    case middleName
    case nickname
    case birthdate
    case email
    case gender
    case profile
    case picture
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    if let unwrappedName = name {
      try container.encode(unwrappedName, forKey: .name)
    }

    if let unwrappedGivenName = givenName {
      try container.encode(unwrappedGivenName, forKey: .givenName)
    }
    
    if let unwrappedFamilyName = familyName {
      try container.encode(unwrappedFamilyName, forKey: .familyName)
    }
    
    if let unwrappedMiddleName = middleName {
      try container.encode(unwrappedMiddleName, forKey: .middleName)
    }
    
    if let unwrappedNickname = nickname {
      try container.encode(unwrappedNickname, forKey: .nickname)
    }
    
    if let unwrappedBirthdate = birthdate {
      try container.encode(unwrappedBirthdate, forKey: .birthdate)
    }
    
    if let unwrappedEmail = email {
      try container.encode(unwrappedEmail, forKey: .email)
    }
    
    if let unwrappedGender = gender {
      try container.encode(unwrappedGender, forKey: .gender)
    }
    
    if let profileUrl = profile?.absoluteString {
      try container.encode(profileUrl, forKey: .profile)
    }
    
    if let pictureUrl = picture?.absoluteString {
      try container.encode(pictureUrl, forKey: .picture)
    }
  }
  
}
