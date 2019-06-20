

import Foundation
import ObjectMapper

struct Rain : Mappable {
	var oneh : Double?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		oneh <- map["1h"]
	}

}
