//
//  DiscordHTTPAPI+Channel+Delete-Message.swift
//

import Foundation

import NOFoundation

public enum DiscordHTTPAPIChannelDeleteMessage { }

extension DiscordHTTPAPI where Self: DiscordHTTPClient {
  
  public func channelDeleteMessage(
    channelID: String,
    messageID: String,
    authKey: String,
    responseCallback: @escaping SetValueCallback<NOHTTPClientResult>) {
      
      request {
        
        DiscordHTTPAPIChannelDeleteMessage.Request(
          channelID: channelID,
          messageID: messageID,
          authKey: authKey)
        
      } to: {
        
        responseCallback($0)
      }
    }
}
