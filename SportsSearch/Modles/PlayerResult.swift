//
//	searchPlayer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct PlayerResult : Codable {

	let player : [Player]?


	enum CodingKeys: String, CodingKey {
		case player = "player"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		player = try values.decodeIfPresent([Player].self, forKey: .player)
	}


}
