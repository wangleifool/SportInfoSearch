//
//	Team.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Team : Codable {

	let idAPIfootball : String?
	let idLeague : String?
	let idSoccerXML : String?
	let idTeam : String?
	let intFormedYear : String?
	let intLoved : String?
	let intStadiumCapacity : String?
	let strAlternate : String?
	let strCountry : String?
	let strDescriptionCN : String?
	let strDescriptionDE : String?
	let strDescriptionEN : String?
	let strDescriptionES : String?
	let strDescriptionFR : String?
	let strDescriptionHU : String?
	let strDescriptionIL : String?
	let strDescriptionIT : String?
	let strDescriptionJP : String?
	let strDescriptionNL : String?
	let strDescriptionNO : String?
	let strDescriptionPL : String?
	let strDescriptionPT : String?
	let strDescriptionRU : String?
	let strDescriptionSE : String?
	let strDivision : String?
	let strFacebook : String?
	let strGender : String?
	let strInstagram : String?
	let strKeywords : String?
	let strLeague : String?
	let strLocked : String?
	let strManager : String?
	let strRSS : String?
	let strSport : String?
	let strStadium : String?
	let strStadiumDescription : String?
	let strStadiumLocation : String?
	let strStadiumThumb : String?
	let strTeam : String?
	let strTeamBadge : String?
	let strTeamBanner : String?
	let strTeamFanart1 : String?
	let strTeamFanart2 : String?
	let strTeamFanart3 : String?
	let strTeamFanart4 : String?
	let strTeamJersey : String?
	let strTeamLogo : String?
	let strTeamShort : String?
	let strTwitter : String?
	let strWebsite : String?
	let strYoutube : String?


	enum CodingKeys: String, CodingKey {
		case idAPIfootball = "idAPIfootball"
		case idLeague = "idLeague"
		case idSoccerXML = "idSoccerXML"
		case idTeam = "idTeam"
		case intFormedYear = "intFormedYear"
		case intLoved = "intLoved"
		case intStadiumCapacity = "intStadiumCapacity"
		case strAlternate = "strAlternate"
		case strCountry = "strCountry"
		case strDescriptionCN = "strDescriptionCN"
		case strDescriptionDE = "strDescriptionDE"
		case strDescriptionEN = "strDescriptionEN"
		case strDescriptionES = "strDescriptionES"
		case strDescriptionFR = "strDescriptionFR"
		case strDescriptionHU = "strDescriptionHU"
		case strDescriptionIL = "strDescriptionIL"
		case strDescriptionIT = "strDescriptionIT"
		case strDescriptionJP = "strDescriptionJP"
		case strDescriptionNL = "strDescriptionNL"
		case strDescriptionNO = "strDescriptionNO"
		case strDescriptionPL = "strDescriptionPL"
		case strDescriptionPT = "strDescriptionPT"
		case strDescriptionRU = "strDescriptionRU"
		case strDescriptionSE = "strDescriptionSE"
		case strDivision = "strDivision"
		case strFacebook = "strFacebook"
		case strGender = "strGender"
		case strInstagram = "strInstagram"
		case strKeywords = "strKeywords"
		case strLeague = "strLeague"
		case strLocked = "strLocked"
		case strManager = "strManager"
		case strRSS = "strRSS"
		case strSport = "strSport"
		case strStadium = "strStadium"
		case strStadiumDescription = "strStadiumDescription"
		case strStadiumLocation = "strStadiumLocation"
		case strStadiumThumb = "strStadiumThumb"
		case strTeam = "strTeam"
		case strTeamBadge = "strTeamBadge"
		case strTeamBanner = "strTeamBanner"
		case strTeamFanart1 = "strTeamFanart1"
		case strTeamFanart2 = "strTeamFanart2"
		case strTeamFanart3 = "strTeamFanart3"
		case strTeamFanart4 = "strTeamFanart4"
		case strTeamJersey = "strTeamJersey"
		case strTeamLogo = "strTeamLogo"
		case strTeamShort = "strTeamShort"
		case strTwitter = "strTwitter"
		case strWebsite = "strWebsite"
		case strYoutube = "strYoutube"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
		idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
		idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
		idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
		intFormedYear = try values.decodeIfPresent(String.self, forKey: .intFormedYear)
		intLoved = try values.decodeIfPresent(String.self, forKey: .intLoved)
		intStadiumCapacity = try values.decodeIfPresent(String.self, forKey: .intStadiumCapacity)
		strAlternate = try values.decodeIfPresent(String.self, forKey: .strAlternate)
		strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
		strDescriptionCN = try values.decodeIfPresent(String.self, forKey: .strDescriptionCN)
		strDescriptionDE = try values.decodeIfPresent(String.self, forKey: .strDescriptionDE)
		strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
		strDescriptionES = try values.decodeIfPresent(String.self, forKey: .strDescriptionES)
		strDescriptionFR = try values.decodeIfPresent(String.self, forKey: .strDescriptionFR)
		strDescriptionHU = try values.decodeIfPresent(String.self, forKey: .strDescriptionHU)
		strDescriptionIL = try values.decodeIfPresent(String.self, forKey: .strDescriptionIL)
		strDescriptionIT = try values.decodeIfPresent(String.self, forKey: .strDescriptionIT)
		strDescriptionJP = try values.decodeIfPresent(String.self, forKey: .strDescriptionJP)
		strDescriptionNL = try values.decodeIfPresent(String.self, forKey: .strDescriptionNL)
		strDescriptionNO = try values.decodeIfPresent(String.self, forKey: .strDescriptionNO)
		strDescriptionPL = try values.decodeIfPresent(String.self, forKey: .strDescriptionPL)
		strDescriptionPT = try values.decodeIfPresent(String.self, forKey: .strDescriptionPT)
		strDescriptionRU = try values.decodeIfPresent(String.self, forKey: .strDescriptionRU)
		strDescriptionSE = try values.decodeIfPresent(String.self, forKey: .strDescriptionSE)
		strDivision = try values.decodeIfPresent(String.self, forKey: .strDivision)
		strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
		strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
		strInstagram = try values.decodeIfPresent(String.self, forKey: .strInstagram)
		strKeywords = try values.decodeIfPresent(String.self, forKey: .strKeywords)
		strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
		strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
		strManager = try values.decodeIfPresent(String.self, forKey: .strManager)
		strRSS = try values.decodeIfPresent(String.self, forKey: .strRSS)
		strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
		strStadium = try values.decodeIfPresent(String.self, forKey: .strStadium)
		strStadiumDescription = try values.decodeIfPresent(String.self, forKey: .strStadiumDescription)
		strStadiumLocation = try values.decodeIfPresent(String.self, forKey: .strStadiumLocation)
		strStadiumThumb = try values.decodeIfPresent(String.self, forKey: .strStadiumThumb)
		strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
		strTeamBadge = try values.decodeIfPresent(String.self, forKey: .strTeamBadge)
		strTeamBanner = try values.decodeIfPresent(String.self, forKey: .strTeamBanner)
		strTeamFanart1 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart1)
		strTeamFanart2 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart2)
		strTeamFanart3 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart3)
		strTeamFanart4 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart4)
		strTeamJersey = try values.decodeIfPresent(String.self, forKey: .strTeamJersey)
		strTeamLogo = try values.decodeIfPresent(String.self, forKey: .strTeamLogo)
		strTeamShort = try values.decodeIfPresent(String.self, forKey: .strTeamShort)
		strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
		strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
		strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
	}


}