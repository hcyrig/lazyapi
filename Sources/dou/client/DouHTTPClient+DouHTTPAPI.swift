//
//  DouHTTPClient+DouHTTPAPI.swift
//

import Foundation

import NOFoundation

extension DouHTTPClient: DouHTTPAPI {
  
  public final class Context {
    
    public var destinationFolderURL: URL?
    
    public var cookie: String?
    public var csrftoken: String?
    public var middlewarecsrftoken: String?
    
    public var city: String?
    public var category: String?
    public var experience: String?
    public var searchText: String?
    
    public var offSet: Int = .zero
    
    public init() { }
    
    public func reset() {
      
      destinationFolderURL = nil
      
      cookie = nil
      csrftoken = nil
      middlewarecsrftoken = nil
      
      city = nil
      category = nil
      experience = nil
      searchText = nil
      
      offSet = .zero
    }
    
    public var searchTitle: String {
      
      var searchTitle = String.empty
      if let category = self.category {
        searchTitle += category
      }
      if let city = self.city {
        searchTitle += searchTitle.isEmpty ? city : "-\(city)"
      }
      if let exp = self.experience {
        searchTitle += searchTitle.isEmpty ? exp : "-\(exp)"
      }
      if let searchText = self.searchText {
        searchTitle += searchTitle.isEmpty ? searchText : "-\(searchText)"
      }
      
      searchTitle = searchTitle.replacingOccurrences(of: "/", with: "")
      
      return searchTitle
    }
  }
}
