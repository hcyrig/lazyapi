//
//  SlackHTTPAPI+ChatDelete+Response.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIChatDelete {
  
  public typealias ResponseCallback = SetValueCallback<Response>
  
  public struct Response: JSONConvertable & Codable {
    
    public var ok: Bool
    public var channel: String
    public var ts: String
  }
}
