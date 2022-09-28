//
//  DiscordHTTPClient+Response+Handler.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPClient {
  
  public static func handleResponse<Response>(
    _ result: NOHTTPClientResult,
    responseCallback: @escaping SetValueCallback<Response>) where Response: Decodable {
      
      switch result {
          
        case .failure(let error, _): NOSTDOUT.display("API status: unknown error: \(error)")
        case .success(let data, _):
          
          guard let responseObj: Response = data.data.decodeJSON() else {
            
            return NOSTDOUT.display("API status: TRUE parse: bad parsing")
          }
          
          responseCallback(responseObj)
      }
    }
}
