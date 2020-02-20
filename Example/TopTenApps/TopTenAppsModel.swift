//
//  TopTenAppsModel.swift
//  TopTenApps
//
//  Created by Yogesh Bharate on 1/7/20.
//  Copyright © 2020 Bharate, Yogesh. All rights reserved.
//

import Foundation

struct TopTenAppsModel: Decodable {
  var feed: FeedResponse
  
  enum ModelCodingKeys: String, CodingKey {
    case feed = "feed"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    feed = try container.decode(FeedResponse.self, forKey: .feed)
  }
}

struct FeedResponse: Decodable {
  var title: String
  var results: [Artists]
  
  enum ModelCodingKeys: String, CodingKey {
    case title = "title"
    case results = "results"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    title = try container.decode(String.self, forKey: .title)
    results = try container.decode([Artists].self, forKey: .results)
  }
}

struct Artists: Decodable {
  var artistName: String
  var artistUrl: String
  
  enum ModelCodingKeys: String, CodingKey {
    case artistName = "artistName"
    case artistUrl = "artistUrl"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    artistName = try container.decode(String.self, forKey: .artistName)
    artistUrl = try container.decode(String.self, forKey: .artistUrl)
  }
}
