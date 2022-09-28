//
//  SlackHTTPAPI+ConversationMembers+Response.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPIConversationMembers {
  
  public typealias ResponseCallback = SetValueCallback<Response>
  public struct Response: JSONConvertable & Codable {
    
    public var ok: Bool
    public var members: [String]
  }
}
