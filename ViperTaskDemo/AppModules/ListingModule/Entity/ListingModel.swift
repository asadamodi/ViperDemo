
import Foundation

    // MARK: - ListingModelElement
struct ListingModel: Codable {
    var domains: [String]
    var stateProvince: String?
    var name: String
    var webPages: [String]
    var country: String?
    var alphaTwoCode: String?
    
    enum CodingKeys: String, CodingKey {
        case domains = "domains"
        case stateProvince = "state-province"
        case name = "name"
        case webPages = "web_pages"
        case country = "country"
        case alphaTwoCode = "alpha_two_code"
    }
}
