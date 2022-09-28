//
//  SlackHTTPAPI+UserInfo+Request.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIUserInfo {
  
  public class Request: SlackHTTPAPIRequest {
    
    public var userID: String?
    
    convenience init(
      userID: String,
      apiToken: String,
      cookie: String?) {
        
        self.init(apiToken: apiToken, cookie: cookie)
        
        self.userID = userID
      }
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://softorino.slack.com/api/" }
      public var slag: String? { "users.info" }
    }
    open override var url: NOHTTPURL? { RouteURL() }
    
    open override var params: NOHTTPParams? {
      [
        "user": userID ?? .empty
      ]
    }
  }
}
