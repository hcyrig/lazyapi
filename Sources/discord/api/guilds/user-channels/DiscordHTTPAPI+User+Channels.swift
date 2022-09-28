//
//  DiscordHTTPAPI+User+Channels.swift
//

import Foundation

import NOFoundation

public enum DiscordHTTPAPIUserChannels { }

extension DiscordHTTPAPI where Self: DiscordHTTPClient {
  
  public func userChannels(
    authKey: String,
    responseCallback: @escaping DiscordHTTPAPIUserChannels.ResponseCallback) {
      
      request {
        
        DiscordHTTPAPIUserChannels.Request(
          authKey: authKey)
        
      } to: {
        
        DiscordHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
