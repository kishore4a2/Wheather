
import Foundation
import ObjectMapper

struct Wind : Mappable {
	var speed : Double?
	var deg : Double?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		speed <- map["speed"]
		deg <- map["deg"]
	}

}
