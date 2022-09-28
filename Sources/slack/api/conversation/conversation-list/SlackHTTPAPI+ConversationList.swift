//
//  SlackHTTPAPI+ConversationList.swift
//

import Foundation

import NOFoundation

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func conversationList(
    types: [SlackHTTPAPIConversationsType] = [.public],
    token: String,
    cookie: String,
    responseCallback: @escaping SlackHTTPAPIConversationsListResponseCallback) {
      
      request {
        
        SlackHTTPAPIConversationsListRequest(
          conversationsTypes: types,
          apiToken: token,
          cookie: cookie)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
