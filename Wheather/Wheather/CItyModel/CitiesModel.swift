
import Foundation
import ObjectMapper

struct CitiesModel : Mappable {
	var cities : [String]?
    var id : Int?
    var dummyJson : Map?
	init?(map: Map) {
	}
	mutating func mapping(map: Map) {
        dummyJson = map
		cities <- map["cities"]
        id <- map["id"]
	}

}
