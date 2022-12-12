

import Foundation
struct ProductBaseModel : Codable, Equatable {
    static func == (lhs: ProductBaseModel, rhs: ProductBaseModel) -> Bool {
      return true
    }
    
    
	let products : [Products]?

	enum CodingKeys: String, CodingKey {

		case products = "products"
	}

//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		products = try values.decodeIfPresent([Products].self, forKey: .products)
//	}

}
