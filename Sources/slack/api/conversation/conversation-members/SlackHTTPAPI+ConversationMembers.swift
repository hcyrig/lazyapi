//
//  SlackHTTPAPI+ConversationMembers.swift
//

import Foundation

import NOFoundation

public enum SlackHTTPAPIConversationMembers { }

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func conversationMembers(
    channel: String,
    token: String,
    cookie: String,
    responseCallback: @escaping SlackHTTPAPIConversationMembers.ResponseCallback) {
      
      request {
        
        SlackHTTPAPIConversationMembers.Request(
          channel: channel,
          apiToken: token,
          cookie: cookie)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
