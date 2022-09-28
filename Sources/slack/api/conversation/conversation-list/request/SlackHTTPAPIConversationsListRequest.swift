//
//  SlackHTTPAPIConversationsListRequest.swift
//

import Foundation

import NOFoundation

public enum SlackHTTPAPIConversationsType {
  
  case `public`
  case `private`
  case direct
  case group
  
  public var key: String {
    
    switch self {
      case .`public`: return "public_channel"
      case .`private`: return "private_channel"
      case .direct: return "im"
      case .group: return "mpim"
    }
  }
}

public class SlackHTTPAPIConversationsListRequest: SlackHTTPAPIRequest {
  
  public var conversationsTypes: [SlackHTTPAPIConversationsType] = [.public]
  
  convenience init(
    conversationsTypes: [SlackHTTPAPIConversationsType],
    apiToken: String,
    cookie: String?) {
      self.init(apiToken: apiToken, cookie: cookie)
      
      self.conversationsTypes = conversationsTypes
    }
  
  public struct SlackConversationListURL: NOHTTPURL {
    public var host: String! { "https://softorino.slack.com/api/" }
    public var slag: String? { "conversations.list" }
  }
  public override var url: NOHTTPURL? { SlackConversationListURL() }
  
  open override var params: NOHTTPParams? {
    [
      "types": conversationsTypes
        .compactMap({ $0.key })
        .joined(separator: ","),
      
      "limit": "999"
    ]
  }
}
