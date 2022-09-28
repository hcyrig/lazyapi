//
//  SlackHTTPAPIConversationsUnarchiveResponse.swift
//

import Foundation

import NOFoundation

public typealias SlackHTTPAPIConversationsUnarchiveResponseCallback = SetValueCallback<SlackHTTPAPIConversationsUnarchiveResponse>

public struct SlackHTTPAPIConversationsUnarchiveResponse: JSONConvertable & Codable {
  
  var ok: Bool
  var error: String?
}
