//
//  SlackHTTPAPIRequest.swift
//

import Foundation

import NOFoundation

open class SlackHTTPAPIRequest: NOHTTPRequest {
  
  public var url: NOHTTPURL? { return nil }
  
  open var apiToken: String
  open var cookie: String?
  
  public init(apiToken: String,
              cookie: String?) {
    
    self.apiToken = apiToken
    self.cookie = cookie
  }
  
  open var method: NOHTTPMethod { .get }
  open var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalAndRemoteCacheData }
  open var headers: NOHTTPHeaders? {
    [
      NOHTTPHeader.authorization.rawValue : "Bearer \(apiToken)",
      "Content-Type": "application/x-www-form-urlencoded",
      "token": apiToken,
      "cookie" : cookie ?? .empty
    ]
  }
  
  open var params: NOHTTPParams? { nil }
  
  open var body: Data? { nil }
  
  open var requetType: NOHTTPRequestType { .data }
}
