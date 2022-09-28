//
//  SlackHTTPAPI+ChatDelete.swift
//

import Foundation

import NOFoundation

public enum SlackHTTPAPIChatDelete { }

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func chatDelete(
    channel: String,
    ts: String,
    token: String,
    cookie: String,
    responseCallback: @escaping SlackHTTPAPIChatDelete.ResponseCallback) {
      
      request {
        
        SlackHTTPAPIChatDelete.Request(
          channel: channel,
          ts: ts,
          apiToken: token,
          cookie: cookie)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
