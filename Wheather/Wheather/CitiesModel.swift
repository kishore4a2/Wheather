
import Foundation
import ObjectMapper

struct CitiesModel : Mappable {
	var cities : [String]?
	init?(map: Map) {
	}
	mutating func mapping(map: Map) {
		cities <- map["cities"]
	}

}
