//
//  DiscordHTTPAPI+Channel+Messages+Request.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIChannelMessages {
  
  public class Request: DiscordHTTPAPIRequest {
    
    public var channelID: String?
    public var nextMessageID: String?
    
    convenience init(
      channelID: String,
      authKey: String,
      nextMessageID: String?) {
        
        self.init(authKey: authKey)
        
        self.channelID = channelID
        
        self.nextMessageID = nextMessageID
      }
    
    public struct RouteURL: NOHTTPURL {
      
      public var host: String! { "https://discord.com/api/v9" }
      public var slag: String?
      
      init(channelID: String) {
        
        self.slag = "/channels/\(channelID)/messages"
      }
    }
    
    open override var url: NOHTTPURL? {
      
      guard let channelID = self.channelID else { return nil }
      
      return RouteURL(channelID: channelID)
    }
    
    open override var params: NOHTTPParams? {
      
      guard let nextMessageID = self.nextMessageID else { return [ "limit": "99" ] }
      
      return [ "before": nextMessageID,
               "limit": "99" ]
    }
  }
}
