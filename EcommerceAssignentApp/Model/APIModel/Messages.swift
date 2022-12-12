

import Foundation
struct Messages : Codable {
	let secondaryMessage : String?
	//let sash : Sash?

	enum CodingKeys: String, CodingKey {

		case secondaryMessage = "secondaryMessage"
		//case sash = "sash"
	}
//
//	init(from decoder: Decoder) throws {
//		let values = try decoder.container(keyedBy: CodingKeys.self)
//		secondaryMessage = try values.decodeIfPresent(String.self, forKey: .secondaryMessage)
//		//sash = try values.decodeIfPresent(Sash.self, forKey: .sash)
//	}

}
