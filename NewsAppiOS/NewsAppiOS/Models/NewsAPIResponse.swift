
import Foundation

struct NewsAPIResponse: Codable {
    var pagination: Pagination? = Pagination()
    var data: [NewsData]? = []
    
    enum CodingKeys: String, CodingKey {
        
        case pagination = "pagination"
        case data = "data"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
        data = try values.decodeIfPresent([NewsData].self, forKey: .data)
        
    }
    
    init() {}
}
