//
//  SlackHTTPAPI+ConversationUnarchive.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func conversationUnarchive(
    channelID: String,
    token: String,
    cookie: String,
    responseCallback: @escaping SlackHTTPAPIConversationsUnarchiveResponseCallback) {
      
      request {
        
        SlackHTTPAPIConversationsUnarchiveRequest(
          channelID: channelID,
          apiToken: token,
          cookie: cookie)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
