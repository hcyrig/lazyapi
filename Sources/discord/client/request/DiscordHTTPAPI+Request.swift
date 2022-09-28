//
//  DiscordHTTPAPI+Request.swift
//

import Foundation

import NOFoundation

open class DiscordHTTPAPIRequest: NOHTTPRequest {
  
  public var url: NOHTTPURL? { return nil }
  
  open var authKey: String
  
  public init(authKey: String) {
    
    self.authKey = authKey
  }
  
  open var method: NOHTTPMethod { .get }
  open var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalAndRemoteCacheData }
  open var headers: NOHTTPHeaders? {
    [
      NOHTTPHeader.authorization.rawValue : authKey,
      "Content-Type": "application/x-www-form-urlencoded"
    ]
  }
  
  open var params: NOHTTPParams? { nil }
  
  open var body: Data? { nil }
  
  open var requetType: NOHTTPRequestType { .data }
}
