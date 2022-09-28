//
//  String+RegexMatches.swift
//

import Foundation

import NOFoundation

extension String {
  
  public func matchesBy(regex: String) -> [String] {
    
    do {
      
      let regex = try NSRegularExpression(pattern: regex)
      
      let results = regex.matches(
        in: self,
        range: NSRange(self.startIndex..., in: self))
      
      return results
        .map { String(self[Range($0.range, in: self)!]) }
      
    } catch let error {
      
      NOSTDOUT.display("Invalid regex matches: \(error.localizedDescription)")
      return []
    }
  }
  
  public func replaceFirstBy(_ pattern: String, with replacement: String) -> String {
    
    guard let range = range(of: pattern) else { return self }
    
    return replacingCharacters(in: range, with: replacement)
  }
}
