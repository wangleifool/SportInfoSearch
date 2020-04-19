//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct TeamResult : Codable {

	let teams : [Team]?


	enum CodingKeys: String, CodingKey {
		case teams = "teams"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		teams = try values.decodeIfPresent([Team].self, forKey: .teams)
	}


}
