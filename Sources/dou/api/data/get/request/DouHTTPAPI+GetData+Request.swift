//
//  DouHTTPAPI+GetData+Request.swift
//

import Foundation

import NOFoundation

extension DouHTTPAPIGetData {
  
  public class Request: NOHTTPRequest {
    
    var cookie: String
    var csrftoken: String
    var middlewareCsrfToken: String
    
    var city: String?
    var category: String?
    var search: String?
    var exp: String?
    
    var offset: Int
    
    public init(cookie: String,
                csrftoken: String,
                middlewareCsrfToken: String,
                city: String?,
                category: String?,
                search: String?,
                exp: String?,
                offset: Int) {
      
      self.cookie = cookie
      self.csrftoken = csrftoken
      self.middlewareCsrfToken = middlewareCsrfToken
      self.city = city
      self.category = category
      self.search = search
      self.offset = offset
      self.exp = exp
    }
    
    public convenience init?(context: DouHTTPClient.Context) {
      
      guard let cookie = context.cookie, !cookie.isEmpty,
            let csrfToken = context.csrftoken, !csrfToken.isEmpty,
            let middlewareCsrfToken = context.middlewarecsrftoken, !middlewareCsrfToken.isEmpty
      else { return nil }
      
      self.init(cookie: cookie, csrftoken: csrfToken, middlewareCsrfToken: middlewareCsrfToken, city: context.city, category: context.category, search: context.searchText, exp: context.experience, offset: context.offSet)
    }
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://jobs.dou.ua" }
      public var slag: String? { "vacancies/xhr-load/" }
    }
    
    open var url: NOHTTPURL? { RouteURL() }
    
    open var method: NOHTTPMethod { .post }
    
    open var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalAndRemoteCacheData }
    
    open var requetType: NOHTTPRequestType { .data }
    
    open var params: NOHTTPParams? {
      
      var params = [String: String]()
      
      if let city = self.city {
        params["city"] = city
      }
      
      if let search = self.search {
        params["search"] = search
      }
      
      if let category = self.category {
        params["category"] = category
      }
      
      if let exp = self.exp {
        params["exp"] = exp
      }
      
      return params
    }
    
    open var headers: NOHTTPHeaders? {
      
      [
        "Referer": DouHTTPAPIGetSession.Request.RouteURL().host,
        "Cookie": self.csrftoken,
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "x-requested-with": "XMLHttpRequest"
      ]
    }
    
    open var body: Data? {
      
      let csrfmiddlewaretoken = "csrfmiddlewaretoken=\(self.middlewareCsrfToken)"
      
      let count = "count=\(self.offset)"
      
      return (csrfmiddlewaretoken + "&" + count).data(using: .utf8)
    }
  }
}
