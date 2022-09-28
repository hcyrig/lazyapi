//
//  DiscordHTTPClient+DiscordHTTPAPI.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPClient: DiscordHTTPAPI {
  
  public final class Context {
    
    public var auth: String
    public var userName: String
    public var channelID: String?
    public var messageID: String?
    
    public init(auth: String, userName: String) {
      
      self.auth = auth
      self.userName = userName
    }
    
    public func reset() {
      
      channelID = nil
      messageID = nil
    }
  }
}
