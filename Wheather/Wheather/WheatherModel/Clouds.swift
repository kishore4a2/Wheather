

import Foundation
import ObjectMapper

struct Clouds : Mappable {
	var all : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		all <- map["all"]
	}

}
