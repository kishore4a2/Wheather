

import Foundation
import ObjectMapper

struct Sys : Mappable {
	var type : Int?
	var id : Int?
	var message : Double?
	var country : String?
	var sunrise : Int?
	var sunset : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		type <- map["type"]
		id <- map["id"]
		message <- map["message"]
		country <- map["country"]
		sunrise <- map["sunrise"]
		sunset <- map["sunset"]
	}

}
