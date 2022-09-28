//
//  DiscordHTTPAPI+User+Guilds.swift
//

import Foundation

import NOFoundation

public enum DiscordHTTPAPIUserGuilds { }

extension DiscordHTTPAPI where Self: DiscordHTTPClient {
  
  public func userGuilds(
    authKey: String,
    beforeGuildID: String?,
    responseCallback: @escaping DiscordHTTPAPIUserGuilds.ResponseCallback) {
      
      request {
        
        DiscordHTTPAPIUserGuilds.Request(
          beforeGuildID: beforeGuildID,
          authKey: authKey)
        
      } to: {
        
        DiscordHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
