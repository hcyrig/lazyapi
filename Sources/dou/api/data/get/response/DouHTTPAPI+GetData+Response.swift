//
//  DouHTTPAPI+GetData+Response.swift
//

import Foundation

import NOFoundation

extension DouHTTPAPIGetData {
  
  public typealias ResponseCallback = SetValueCallback<Response>
  
  public struct Response: JSONConvertable & Codable {
    
    public var last: Bool
    public var html: String
    public var num: Int
    
    public enum CodingKeys: String, CodingKey {
      
      case last
      case html
      case num
    }
    
    public init(from decoder: Decoder) throws {
      
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.last = try container.decode(Bool.self, forKey: .last)
      self.html = try container.decode(String.self, forKey: .html)
      self.num = try container.decode(Int.self, forKey: .num)
    }
  }
}
