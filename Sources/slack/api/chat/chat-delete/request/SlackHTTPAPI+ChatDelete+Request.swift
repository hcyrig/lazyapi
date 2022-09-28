//
//  SlackHTTPAPI+ChatDelete+Request.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIChatDelete {
  
  public class Request: SlackHTTPAPIRequest {
    
    public var channel: String?
    public var ts: String?
    
    convenience init(
      channel: String,
      ts: String,
      apiToken: String,
      cookie: String?) {
        
        self.init(apiToken: apiToken, cookie: cookie)
        
        self.channel = channel
        self.ts = ts
      }
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://softorino.slack.com/api/" }
      public var slag: String? { "chat.delete" }
    }
    open override var url: NOHTTPURL? { RouteURL() }
    
    open override var params: NOHTTPParams? {
      [
        "channel": channel ?? .empty,
        "ts": ts ?? .empty
      ]
    }
  }
}
