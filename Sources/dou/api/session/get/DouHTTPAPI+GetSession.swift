//
//  DouHTTPAPI+GetSession.swift
//

import Foundation

import NOFoundation

public enum DouHTTPAPIGetSession { }

extension DouHTTPAPI where Self: DouHTTPClient {
  
  public func getSession(
    responseCallback: @escaping DouHTTPAPIGetSession.ResponseCallback) {
      
      request {
        
        DouHTTPAPIGetSession.Request()
        
      } to: { result in
        
        switch result {
            
          case .failure(let error, _):
            
            NOSTDOUT.display(error)
            
          case .success(let data, _):
            
            guard let setCookieValue = data.response.allHeaderFields["Set-Cookie"] as? String
            else {
              NOSTDOUT.display("NO Set-Cookie response header")
              return
            }
            
            responseCallback(.init(cookie: setCookieValue, data: data.data))
        }
      }
    }
}
