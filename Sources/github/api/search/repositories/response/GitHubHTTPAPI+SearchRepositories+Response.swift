//
//  GitHubHTTPAPI+SearchRepositories+Response.swift
//

import Foundation

import NOFoundation

extension GitHubHTTPAPISearchRepositories {
  
  public typealias ResponseCallback = SetValueCallback<Response>

  public struct Response: Decodable {
    
    public var totalCount: Int
    public var isIncomplete: Bool
    public var items: [Repo]
    
    public enum CodingKeys: String, CodingKey {
      
      case totalCount = "total_count"
      case items
      case isIncomplete = "incomplete_results"
    }
  }
  
  public struct Repo: Decodable {
    
    public var id: Int
    public var htmlURL: String
    public var stars: Int
    public var description: String?
    public var name: String?
    
    public enum CodingKeys: String, CodingKey {
      
      case id
      case htmlURL = "html_url"
      case stars = "stargazers_count"
      case description
      case name
    }
  }
}
