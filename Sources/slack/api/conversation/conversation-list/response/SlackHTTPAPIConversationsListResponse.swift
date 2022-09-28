//
//  SlackHTTPAPIConversationsListResponse.swift
//

import Foundation

import NOFoundation

public typealias SlackHTTPAPIConversationsListResponseCallback = SetValueCallback<SlackHTTPAPIConversationsListResponse>

public struct SlackHTTPAPIConversationsListResponse: JSONConvertable & Codable {
  
  public var ok: Bool
  public var channels: [SlackHTTPAPIChannelResponse]
}

public struct SlackHTTPAPIChannelResponse: JSONConvertable & Codable {
  
  public var id: String
  public var name: String?
  public var is_channel: Bool?
  public var is_private: Bool?
  public var is_general: Bool?
  public var is_mpim: Bool?
  public var num_members: Int?
}
