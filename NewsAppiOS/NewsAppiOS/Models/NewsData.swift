
import Foundation

struct NewsData: Codable {
    
    let id = UUID()
    
    var author: String? = nil
    var title: String? = nil
    var description: String? = nil
    var url: String? = nil
    var source: String? = nil
    var image: String? = nil
    var category: String? = nil
    var language: String? = nil
    var country: String? = nil
    var publishedAt: String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case author      = "author"
        case title       = "title"
        case description = "description"
        case url         = "url"
        case source      = "source"
        case image       = "image"
        case category    = "category"
        case language    = "language"
        case country     = "country"
        case publishedAt = "published_at"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        author      = try values.decodeIfPresent(String.self , forKey: .author)
        title       = try values.decodeIfPresent(String.self , forKey: .title)
        description = try values.decodeIfPresent(String.self , forKey: .description)
        url         = try values.decodeIfPresent(String.self , forKey: .url)
        source      = try values.decodeIfPresent(String.self , forKey: .source)
        image       = try values.decodeIfPresent(String.self , forKey: .image)
        category    = try values.decodeIfPresent(String.self , forKey: .category)
        language    = try values.decodeIfPresent(String.self , forKey: .language)
        country     = try values.decodeIfPresent(String.self , forKey: .country)
        publishedAt = try values.decodeIfPresent(String.self , forKey: .publishedAt)
        
    }
    
    init() {}
    
}

extension NewsData: Equatable {}
extension NewsData: Identifiable {}

extension NewsData {
    
    static var previewData: [NewsData] {
        GetJsonData.getNewsApiMockData()
    }
}
