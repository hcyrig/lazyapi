//
//  GitHubHTTPAPI+SearchRepositories.swift
//

import Foundation

import NOFoundation

public enum GitHubHTTPAPISearchRepositories { }

extension GitHubHTTPAPI where Self: GitHubHTTPClient {
  
  public func getData(context: GitHubHTTPClient.Context,
                      responseCallback: @escaping GitHubHTTPAPISearchRepositories.ResponseCallback) {
    
    guard let httpRequest = GitHubHTTPAPISearchRepositories.Request(context: context) else { return }
    
    request {
      
      httpRequest
      
    } to: { result in
      
      switch result {
          
        case .failure(let error, _):
          
          NOSTDOUT.display(error)
          
        case .success(let data, _):
          
          guard let vacancyObject: GitHubHTTPAPISearchRepositories.Response = data.data.decodeJSON() else {
            
            return
          }
          
          responseCallback(vacancyObject)
      }
    }
  }
}
