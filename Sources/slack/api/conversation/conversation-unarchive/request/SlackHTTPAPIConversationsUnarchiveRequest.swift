//
//  SlackHTTPAPIConversationsUnarchiveRequest.swift
//

import Foundation

import NOFoundation

public class SlackHTTPAPIConversationsUnarchiveRequest: SlackHTTPAPIRequest {
  
  public var channelID: String
  
  init(channelID: String,
       apiToken: String,
       cookie: String?) {
    
    self.channelID = channelID
    
    super.init(apiToken: apiToken, cookie: cookie)
  }
  
  public struct SlackConversationUnarchiveURL: NOHTTPURL {
    public var host: String! { "https://softorino.slack.com/api/" }
    public var slag: String? { "conversations.unarchive" }
  }
  public override var url: NOHTTPURL? { SlackConversationUnarchiveURL() }
  public override var params: NOHTTPParams? {
    [
      "channel": channelID
    ]
  }
}
