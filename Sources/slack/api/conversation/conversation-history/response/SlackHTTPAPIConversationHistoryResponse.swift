//
//  SlackHTTPAPIConversationHistoryResponse.swift
//

import Foundation

import NOFoundation

public typealias SlackHTTPAPIConversationHistoryResponseCallback = SetValueCallback<SlackHTTPAPIConversationHistoryResponse>

public struct SlackHTTPAPIConversationHistoryResponse: JSONConvertable & Codable {
  
  public var ok: Bool
  public var messages: [SlackHTTPAPIConversationHistoryMessageResponse]
  public var has_more: Bool
  public var pin_count: Int
  public var response_metadata: SlackHTTPAPIConversationHistoryMetaResponse?
}

public struct SlackHTTPAPIConversationHistoryMetaResponse: JSONConvertable & Codable {
  
  public var next_cursor: String?
}

public struct SlackHTTPAPIConversationHistoryMessageResponse: JSONConvertable & Codable {
  
  public var type: String
  public var user: String
  public var text: String
  public var ts: String
}
