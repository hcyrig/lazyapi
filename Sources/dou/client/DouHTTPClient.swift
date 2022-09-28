//
//  DouHTTPClient.swift
//

import Foundation

import NOFoundation

public final class DouHTTPClient: NOHTTPClient {
  
  public var context: Context
  
  public override var isLimited: Bool { return false}
  
  public var globalCachePolicy: NSURLRequest.CachePolicy {
    .reloadIgnoringLocalAndRemoteCacheData
  }
  
  public init(context: Context) {
    
    self.context = context
    
    super.init(suffix: "dou.http.client")
  }
}
