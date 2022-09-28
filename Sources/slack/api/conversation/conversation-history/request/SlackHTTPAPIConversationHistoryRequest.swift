//
//  SlackHTTPAPIConversationHistoryRequest.swift
//

import Foundation

import NOFoundation

public class SlackHTTPAPIConversationHistoryRequest: SlackHTTPAPIRequest {
  
  public var channel: String?
  public var cursor: String?
  
  convenience init(
    channel: String,
    apiToken: String,
    cookie: String?,
    cursor: String?) {
      
      self.init(apiToken: apiToken, cookie: cookie)
      
      self.channel = channel
      self.cursor = cursor
    }
  
  public struct SlackConversationHistoryURL: NOHTTPURL {
    public var host: String! { "https://softorino.slack.com/api/" }
    public var slag: String? { "conversations.history" }
  }
  open override var url: NOHTTPURL? { SlackConversationHistoryURL() }
  
  open override var params: NOHTTPParams? {
    [
      "channel": channel ?? .empty,
      "cursor": cursor ?? .empty
    ]
  }
}
