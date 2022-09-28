//
//  SlackHTTPClient+Response+Status.swift
//

import Foundation

import NOFoundation

public struct SlackHTTPAPIStatusResponse: JSONConvertable & Codable {
  
  public var ok: Bool
}
