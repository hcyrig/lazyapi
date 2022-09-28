//
//  DiscordHTTPAPI+User+Guilds+Response.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIUserGuilds {
  
  public typealias ResponseCallback = SetValueCallback<[Response]>
  
  public struct Response: Codable {
    
    public var id: String
    public var name: String?
  }
}
