//
//  SlackHTTPClient+Response+Handler.swift
//

import Foundation

import NOFoundation

extension SlackHTTPClient {
  
  public static func handleResponse<Response>(
    _ result: NOHTTPClientResult,
    responseCallback: @escaping SetValueCallback<Response>) where Response: JSONConvertable & Decodable {
      
      switch result {
          
        case .failure(let error, _): NOSTDOUT.display("API status: unknown error: \(error)")
        case .success(let data, _):
          
          guard let statusObj: SlackHTTPAPIStatusResponse = data.data.decodeJSON() else {
            
            return NOSTDOUT.display("API status: unknown error: unknown")
          }
          
          guard statusObj.ok else {
            
            guard let errorObj: SlackHTTPAPIErrorResponse = data.data.decodeJSON() else {
              
              return NOSTDOUT.display("API status: FALSE error: unknown")
            }
            
            return NOSTDOUT.display("API status: FALSE error: \(errorObj)")
          }
          
          guard let responseObj: Response = data.data.decodeJSON() else {
            
            return NOSTDOUT.display("API status: TRUE parse: bad parsing")
          }
          
          responseCallback(responseObj)
      }
    }
}
