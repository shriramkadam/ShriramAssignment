
import Foundation
struct PurchaseTypes : Codable {
	let purchaseType : String?
	let displayName : String?
	let unitPrice : Double?
	let minQtyLimit : Int?
	let maxQtyLimit : Int?
	let cartQty : Int?

	enum CodingKeys: String, CodingKey {

		case purchaseType = "purchaseType"
		case displayName = "displayName"
		case unitPrice = "unitPrice"
		case minQtyLimit = "minQtyLimit"
		case maxQtyLimit = "maxQtyLimit"
		case cartQty = "cartQty"
	}

//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		purchaseType = try values.decodeIfPresent(String.self, forKey: .purchaseType)
//		displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
//		unitPrice = try values.decodeIfPresent(Double.self, forKey: .unitPrice)
//		minQtyLimit = try values.decodeIfPresent(Int.self, forKey: .minQtyLimit)
//		maxQtyLimit = try values.decodeIfPresent(Int.self, forKey: .maxQtyLimit)
//		cartQty = try values.decodeIfPresent(Int.self, forKey: .cartQty)
//	}

}
