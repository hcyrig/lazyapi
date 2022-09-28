//
//  SlackHTTPAPI+ConversationList.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func conversationHistory(
    channel: String,
    token: String,
    cookie: String,
    cursor: String? = nil,
    responseCallback: @escaping SlackHTTPAPIConversationHistoryResponseCallback) {
      
      request {
        
        SlackHTTPAPIConversationHistoryRequest(
          channel: channel,
          apiToken: token,
          cookie: cookie,
          cursor: cursor)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
