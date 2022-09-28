//
//  SlackHTTPClient+Response+Error.swift
//

import Foundation

import NOFoundation

public struct SlackHTTPAPIErrorResponse: JSONConvertable & Codable {
  
  public var ok: Bool
  public var error: String
  public var req_method: String?
}
