

import Foundation
struct Price : Codable {
	let message : String?
	let value : Double?
	let isOfferPrice : Bool?

	enum CodingKeys: String, CodingKey {

		case message = "message"
		case value = "value"
		case isOfferPrice = "isOfferPrice"
	}

//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		message = try values.decodeIfPresent(String.self, forKey: .message)
//		value = try values.decodeIfPresent(Double.self, forKey: .value)
//		isOfferPrice = try values.decodeIfPresent(Bool.self, forKey: .isOfferPrice)
//	}

}
