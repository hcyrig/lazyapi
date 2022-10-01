//
//  GitHubHTTPAPI+SearchRepositories+Request.swift
//

import Foundation

import NOFoundation

extension GitHubHTTPAPISearchRepositories {
  
  public enum SortRepoType: String, CaseIterable {
    
    case best
    case stars
    case forks
    case help = "help-wanted-issues"
    case updated
  }
  
  public class Request: NOHTTPRequest {
    
    var token: String
    var searchString: String
    var sortType: SortRepoType
    var page: Int
    var perPage: Int
    
    public init(token: String,
                searchString: String,
                sortType: SortRepoType,
                page: Int,
                perPage: Int) {
      
      self.token = token
      self.searchString = searchString
      self.sortType = sortType
      self.page = page
      self.perPage = perPage
    }
    
    public convenience init?(context: GitHubHTTPClient.Context) {
      
      guard let token = context.token, !token.isEmpty,
            let searchString = context.searchString, !searchString.isEmpty,
            let sortType = context.sortType
              
      else { return nil }
      
      self.init(token: token,
                searchString: searchString,
                sortType: sortType,
                page: context.page,
                perPage: context.perPage)
    }
    
    public struct RouteURL: NOHTTPURL {
      public var host: String! { "https://api.github.com" }
      public var slag: String? { "search/repositories" }
    }
    
    open var url: NOHTTPURL? { RouteURL() }
    
    open var method: NOHTTPMethod { .get }
    
    open var cachePolicy: URLRequest.CachePolicy { .reloadIgnoringLocalAndRemoteCacheData }
    
    open var requetType: NOHTTPRequestType { .data }
    
    open var params: NOHTTPParams? {
      
      var params = [String: String]()
      
      params["q"] = self.searchString
      params["sort"] = self.sortType.rawValue
      params["page"] = String(self.page)
      params["per_page"] = String(self.perPage)
      
      return params
    }
    
    open var headers: NOHTTPHeaders? {
      
      [
        "Authorization": "Bearer \(self.token)",
        "Accept": "application/vnd.github+json",
      ]
    }
    
    open var body: Data? { return nil }
  }
}
