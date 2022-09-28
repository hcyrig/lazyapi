//
//  SlackHTTPClient+SlackHTTPAPI.swift
//

import Foundation

import NOFoundation

extension SlackHTTPClient: SlackHTTPAPI {
  
  public final class Context {
    
    public var token: String
    public var cookie: String
    public var channels: SlackHTTPAPIConversationsType?
    public var channel: String?
    public var userID: String?
    public var messageTS: String?
    
    public init(token: String, cookie: String) {
      
      self.token = token
      self.cookie = cookie
    }
    
    public func reset() {
      
      channels = nil
      channel = nil
      userID = nil
      messageTS = nil
    }
  }
}
