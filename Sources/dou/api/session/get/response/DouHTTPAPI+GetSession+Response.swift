//
//  DouHTTPAPI+GetSession+Response.swift
//

import Foundation

import NOFoundation

extension DouHTTPAPIGetSession {
  
  public typealias ResponseCallback = SetValueCallback<Response>
  
  public struct Response: JSONConvertable & Codable {
    
    public var cookie: String
    public var data: Data
  }
}
