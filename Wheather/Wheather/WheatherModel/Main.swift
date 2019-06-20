

import Foundation
import ObjectMapper

struct Main : Mappable {
	var temp : Double?
	var pressure : Int?
	var humidity : Int?
	var temp_min : Double?
	var temp_max : Double?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		temp <- map["temp"]
		pressure <- map["pressure"]
		humidity <- map["humidity"]
		temp_min <- map["temp_min"]
		temp_max <- map["temp_max"]
	}

}
