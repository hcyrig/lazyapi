//
//  DiscordHTTPAPI+User+Channels+Request.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIUserChannels {
  
  public class Request: DiscordHTTPAPIRequest {
    
    public struct RouteURL: NOHTTPURL {
      
      public var host: String! { "https://discord.com/api/v9" }
      public var slag: String?
      
      init() {
        
        self.slag = "/users/@me/channels"
      }
    }
    
    open override var url: NOHTTPURL? {
      
      return RouteURL()
    }
    
    open override var params: NOHTTPParams? {
      
      return [ "limit": "200" ]
    }
  }
}
