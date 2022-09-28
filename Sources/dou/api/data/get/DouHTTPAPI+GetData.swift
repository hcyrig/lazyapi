//
//  DouHTTPAPI+GetSession.swift
//

import Foundation

import NOFoundation

public enum DouHTTPAPIGetData { }

extension DouHTTPAPI where Self: DouHTTPClient {
  
  public func getData(context: DouHTTPClient.Context,
                      responseCallback: @escaping DouHTTPAPIGetData.ResponseCallback) {
    
    guard let httpRequest = DouHTTPAPIGetData.Request(context: context) else { return }
    
    request {
      
      httpRequest
      
    } to: { result in
      
      switch result {
          
        case .failure(let error, _):
          
          NOSTDOUT.display(error)
          
        case .success(let data, _):
          
          guard let vacancyObject: DouHTTPAPIGetData.Response = data.data.decodeJSON() else {
            
            return
          }
          
          responseCallback(vacancyObject)
      }
    }
  }
}
