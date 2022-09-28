//
//  SlackHTTPAPI+UserInfo.swift
//

import Foundation

import NOFoundation

public enum SlackHTTPAPIUserInfo { }

extension SlackHTTPAPI where Self: SlackHTTPClient {
  
  public func userInfo(
    userID: String,
    token: String,
    cookie: String,
    responseCallback: @escaping SlackHTTPAPIUserInfo.ResponseCallback) {
      
      request {
        
        SlackHTTPAPIUserInfo.Request(
          userID: userID,
          apiToken: token,
          cookie: cookie)
        
      } to: {
        
        SlackHTTPClient.handleResponse($0, responseCallback: responseCallback)
      }
    }
}
