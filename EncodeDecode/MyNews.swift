

import Foundation

struct MyNews:Codable {
    let articles : [Articles]
}

struct Articles : Codable{
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: URL?
    let url: URL?
    
    private enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case urlToImage
        case url 
    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(author, forKey: .author)
//        try container.encode(description, forKey: .description)
//    }
}


