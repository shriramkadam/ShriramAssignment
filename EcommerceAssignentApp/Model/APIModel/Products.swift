import Foundation
struct Products : Codable, Identifiable{
    static func == (lhs: Products, rhs: Products) -> Bool {
       return true
    }
    
	let citrusId : String?
	let title : String?
	let id : String?
	let imageURL : String?
	let price : [Price]?
	let brand : String?
	let badges : [String]?
	let ratingCount : Double?
	//let messages : Messages?
	let isAddToCartEnable : Bool?
	let addToCartButtonText : String?
	let isInTrolley : Bool?
	let isInWishlist : Bool?
	let purchaseTypes : [PurchaseTypes]?
	let isFindMeEnable : Bool?
	let saleUnitPrice : Double?
	let totalReviewCount : Int?
	let isDeliveryOnly : Bool?
	let isDirectFromSupplier : Bool?

	enum CodingKeys: String, CodingKey {

		case citrusId = "citrusId"
		case title = "title"
		case id = "id"
		case imageURL = "imageURL"
		case price = "price"
		case brand = "brand"
		case badges = "badges"
		case ratingCount = "ratingCount"
		//case messages = "messages"
		case isAddToCartEnable = "isAddToCartEnable"
		case addToCartButtonText = "addToCartButtonText"
		case isInTrolley = "isInTrolley"
		case isInWishlist = "isInWishlist"
		case purchaseTypes = "purchaseTypes"
		case isFindMeEnable = "isFindMeEnable"
		case saleUnitPrice = "saleUnitPrice"
		case totalReviewCount = "totalReviewCount"
		case isDeliveryOnly = "isDeliveryOnly"
		case isDirectFromSupplier = "isDirectFromSupplier"
	}

}
