//
//  DiscordHTTPClient.swift
//

import Foundation

import NOFoundation

public final class DiscordHTTPClient: NOHTTPClient {
  
  public var context: Context
  
  public var globalCachePolicy: NSURLRequest.CachePolicy {
    .reloadIgnoringLocalAndRemoteCacheData
  }
  
  public init(context: Context) {
    
    self.context = context
    
    super.init(suffix: "discord.http.client")
  }
}
