//
//  DiscordHTTPAPI+Channel+Delete-Message+Request.swift
//

import Foundation

import NOFoundation

extension DiscordHTTPAPIChannelDeleteMessage {

  public class Request: DiscordHTTPAPIRequest {

    public override var method: NOHTTPMethod { .delete }

    public var channelID: String?
    public var messageID: String?

    convenience init(
      channelID: String,
      messageID: String,
      authKey: String) {

        self.init(authKey: authKey)

        self.channelID = channelID
        self.messageID = messageID
      }

    public struct RouteURL: NOHTTPURL {

      public var host: String! { "https://discord.com/api/v9" }
      public var slag: String?

      init(channelID: String, messageID: String) {

        self.slag = "/channels/\(channelID)/messages/\(messageID)"
      }
    }

    open override var url: NOHTTPURL? {

      return RouteURL(channelID: self.channelID ?? .empty,
                      messageID: self.messageID ?? .empty)
    }

    open override var params: NOHTTPParams? {
      return [:]
    }
  }
}
