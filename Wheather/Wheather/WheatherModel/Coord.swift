

import Foundation
import ObjectMapper

struct Coord : Mappable {
	var lon : Double?
	var lat : Double?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {
		lon <- map["lon"]
		lat <- map["lat"]
	}

}
