//
//  DiscordHTTPAPI+Channel+Messages.swift
//

import Foundation

import NOFoundation

public enum DiscordHTTPAPIChannelMessages { }

extension DiscordHTTPAPI where Self: DiscordHTTPClient {
  
  public func channelMessages(
    channelID: String,
    authKey: String,
    nextMessageID: String?,
    responseCallback: @escaping DiscordHTTPAPIChannelMessages.ResponseCallback) {
      
      request {
        
        DiscordHTTPAPIChannelMessages.Request(
          channelID: channelID,
          authKey: authKey,
          nextMessageID: nextMessageID)
        
      } to: {
        
        DiscordHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
