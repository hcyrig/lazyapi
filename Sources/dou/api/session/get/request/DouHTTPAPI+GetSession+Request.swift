//
//  DouHTTPAPI+GetSession+Request.swift
//

import Foundation

import NOFoundation

extension DouHTTPAPIGetSession {
  
  public class Request: NOHTTPRequest {
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://dou.ua" }
      public var slag: String? { .empty }
    }
    open var url: NOHTTPURL? { RouteURL() }
    
    open var method: NOHTTPMethod { .get }
    
    open var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalAndRemoteCacheData }
    
    open var requetType: NOHTTPRequestType { .data }
  }
}
