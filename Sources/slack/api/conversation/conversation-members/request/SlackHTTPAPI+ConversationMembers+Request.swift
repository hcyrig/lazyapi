//
//  SlackHTTPAPI+ConversationMembers+Request.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIConversationMembers {
  
  public class Request: SlackHTTPAPIRequest {
    
    public var channel: String?
    
    convenience init(
      channel: String,
      apiToken: String,
      cookie: String?) {
        
        self.init(apiToken: apiToken, cookie: cookie)
        
        self.channel = channel
      }
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://softorino.slack.com/api/" }
      public var slag: String? { "conversations.members" }
    }
    open override var url: NOHTTPURL? { RouteURL() }
    
    open override var params: NOHTTPParams? {
      [
        "channel": channel ?? .empty
      ]
    }
  }
}
