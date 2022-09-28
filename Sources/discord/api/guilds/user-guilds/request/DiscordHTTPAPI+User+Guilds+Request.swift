//
//  DiscordHTTPAPI+User+Guilds+Request.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIUserGuilds {
  
  public class Request: DiscordHTTPAPIRequest {
    
    public var beforeGuildID: String?
    
    convenience init(
      beforeGuildID: String? = nil,
      authKey: String) {
        
        self.init(authKey: authKey)
        
        self.beforeGuildID = beforeGuildID
      }
    
    public struct RouteURL: NOHTTPURL {
      
      public var host: String! { "https://discord.com/api/v9" }
      public var slag: String?
      
      init() {
        
        self.slag = "/users/@me/guilds"
      }
    }
    
    open override var url: NOHTTPURL? {
      
      return RouteURL()
    }
    
    open override var params: NOHTTPParams? {
      
      guard let beforeGuildID = self.beforeGuildID else { return [ "limit": "200" ] }
      
      return [ "before": beforeGuildID,
               "limit": "200" ]
    }
  }
}
