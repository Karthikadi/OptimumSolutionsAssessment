//
//  MovieModel.swift
//  OptimumSolutionsAssessment
//
//  Created by Karthika on 27/02/25.
//

import Foundation

struct MovieModel: Decodable{
    var search:[MovieDataModel]?
    public enum CodingKeys: String, CodingKey{
        case search = "Search"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        search = try container.decodeIfPresent([MovieDataModel].self, forKey: .search )
    }
}

struct MovieDataModel : Decodable{
    let title: String?
    let year: String?
    let poster: String?
    enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        year = try container.decodeIfPresent(String.self, forKey: .year)
        poster = try container.decodeIfPresent(String.self, forKey: .poster)
    }
}
