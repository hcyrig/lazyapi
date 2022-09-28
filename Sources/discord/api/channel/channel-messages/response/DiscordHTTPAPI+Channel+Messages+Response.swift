//
//  DiscordHTTPAPI+Channel+Messages+Response.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIChannelMessages {
  
  public typealias ResponseCallback = SetValueCallback<[Response]>
  
  public struct Response: Codable {
    
    public var id: String
    public var author: UserResponse
    public var content: String?
  }
  
  public struct UserResponse: Codable {
    
    public var id: String
    public var username: String
  }
}
