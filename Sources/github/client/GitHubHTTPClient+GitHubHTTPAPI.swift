//
//  GitHubHTTPClient+GitHubHTTPAPI.swift
//

import Foundation

import NOFoundation

extension GitHubHTTPClient: GitHubHTTPAPI {
  
  public enum Consts {
    
    public static let perPageCount = 30
    public static let firstPageNum = 1
  }
  
  public final class Context {
    
    public var destinationFolderURL: URL?
    
    public var token: String?
    
    public var searchString: String?
    
    public var sortType: GitHubHTTPAPISearchRepositories.SortRepoType?
    
    public var page: Int = Consts.firstPageNum
    
    public var perPage: Int = Consts.perPageCount
    
    public var maxPage: Int = Consts.firstPageNum
    
    public var isLastPage: Bool { return page > maxPage }
    
    public init() { }
    
    public func reset() {
      
      self.destinationFolderURL = nil
      self.token = nil
      self.searchString = nil
      
      self.sortType = nil
      self.page = Consts.firstPageNum
      self.perPage = Consts.perPageCount
    }
  }
}
