//
//  DiscordHTTPAPI+User+Channels+Response.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIUserChannels {
  
  public typealias ResponseCallback = SetValueCallback<[Response]>
  
  public struct Response: Codable {
    
    public var id: String

  }
}
