//
//  SlackHTTPAPI+UserInfo+Response.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIUserInfo {
  
  public typealias ResponseCallback = SetValueCallback<Response>
  
  public struct Response: JSONConvertable & Codable {
    
    public var ok: Bool
    public var user: UserResponse
  }
  
  public struct UserResponse: JSONConvertable & Codable {
    
    public var id: String?
    public var name: String?
    public var real_name: String?
  }
}
