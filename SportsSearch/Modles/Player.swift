//
//	Player.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Player : Codable {

	let dateBorn : String?
	let dateSigned : String?
	let idAPIfootball : String?
	let idPlayer : String?
	let idPlayerManager : String?
	let idSoccerXML : String?
	let idTeam : String?
	let idTeam2 : String?
	let idTeamNational : String?
	let intLoved : String?
	let intSoccerXMLTeamID : String?
	let strAgent : String?
	let strBanner : String?
	let strBirthLocation : String?
	let strCollege : String?
	let strCreativeCommons : String?
	let strCutout : String?
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
	let strFacebook : String?
	let strFanart1 : String?
	let strFanart2 : String?
	let strFanart3 : String?
	let strFanart4 : String?
	let strGender : String?
	let strHeight : String?
	let strInstagram : String?
	let strKit : String?
	let strLocked : String?
	let strNationality : String?
	let strNumber : String?
	let strOutfitter : String?
	let strPlayer : String?
	let strPosition : String?
	let strRender : String?
	let strSide : String?
	let strSigning : String?
	let strSport : String?
	let strTeam : String?
	let strTeam2 : String?
	let strThumb : String?
	let strTwitter : String?
	let strWage : String?
	let strWebsite : String?
	let strWeight : String?
	let strYoutube : String?


	enum CodingKeys: String, CodingKey {
		case dateBorn = "dateBorn"
		case dateSigned = "dateSigned"
		case idAPIfootball = "idAPIfootball"
		case idPlayer = "idPlayer"
		case idPlayerManager = "idPlayerManager"
		case idSoccerXML = "idSoccerXML"
		case idTeam = "idTeam"
		case idTeam2 = "idTeam2"
		case idTeamNational = "idTeamNational"
		case intLoved = "intLoved"
		case intSoccerXMLTeamID = "intSoccerXMLTeamID"
		case strAgent = "strAgent"
		case strBanner = "strBanner"
		case strBirthLocation = "strBirthLocation"
		case strCollege = "strCollege"
		case strCreativeCommons = "strCreativeCommons"
		case strCutout = "strCutout"
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
		case strFacebook = "strFacebook"
		case strFanart1 = "strFanart1"
		case strFanart2 = "strFanart2"
		case strFanart3 = "strFanart3"
		case strFanart4 = "strFanart4"
		case strGender = "strGender"
		case strHeight = "strHeight"
		case strInstagram = "strInstagram"
		case strKit = "strKit"
		case strLocked = "strLocked"
		case strNationality = "strNationality"
		case strNumber = "strNumber"
		case strOutfitter = "strOutfitter"
		case strPlayer = "strPlayer"
		case strPosition = "strPosition"
		case strRender = "strRender"
		case strSide = "strSide"
		case strSigning = "strSigning"
		case strSport = "strSport"
		case strTeam = "strTeam"
		case strTeam2 = "strTeam2"
		case strThumb = "strThumb"
		case strTwitter = "strTwitter"
		case strWage = "strWage"
		case strWebsite = "strWebsite"
		case strWeight = "strWeight"
		case strYoutube = "strYoutube"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dateBorn = try values.decodeIfPresent(String.self, forKey: .dateBorn)
		dateSigned = try values.decodeIfPresent(String.self, forKey: .dateSigned)
		idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
		idPlayer = try values.decodeIfPresent(String.self, forKey: .idPlayer)
		idPlayerManager = try values.decodeIfPresent(String.self, forKey: .idPlayerManager)
		idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
		idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
		idTeam2 = try values.decodeIfPresent(String.self, forKey: .idTeam2)
		idTeamNational = try values.decodeIfPresent(String.self, forKey: .idTeamNational)
		intLoved = try values.decodeIfPresent(String.self, forKey: .intLoved)
		intSoccerXMLTeamID = try values.decodeIfPresent(String.self, forKey: .intSoccerXMLTeamID)
		strAgent = try values.decodeIfPresent(String.self, forKey: .strAgent)
		strBanner = try values.decodeIfPresent(String.self, forKey: .strBanner)
		strBirthLocation = try values.decodeIfPresent(String.self, forKey: .strBirthLocation)
		strCollege = try values.decodeIfPresent(String.self, forKey: .strCollege)
		strCreativeCommons = try values.decodeIfPresent(String.self, forKey: .strCreativeCommons)
		strCutout = try values.decodeIfPresent(String.self, forKey: .strCutout)
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
		strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
		strFanart1 = try values.decodeIfPresent(String.self, forKey: .strFanart1)
		strFanart2 = try values.decodeIfPresent(String.self, forKey: .strFanart2)
		strFanart3 = try values.decodeIfPresent(String.self, forKey: .strFanart3)
		strFanart4 = try values.decodeIfPresent(String.self, forKey: .strFanart4)
		strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
		strHeight = try values.decodeIfPresent(String.self, forKey: .strHeight)
		strInstagram = try values.decodeIfPresent(String.self, forKey: .strInstagram)
		strKit = try values.decodeIfPresent(String.self, forKey: .strKit)
		strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
		strNationality = try values.decodeIfPresent(String.self, forKey: .strNationality)
		strNumber = try values.decodeIfPresent(String.self, forKey: .strNumber)
		strOutfitter = try values.decodeIfPresent(String.self, forKey: .strOutfitter)
		strPlayer = try values.decodeIfPresent(String.self, forKey: .strPlayer)
		strPosition = try values.decodeIfPresent(String.self, forKey: .strPosition)
		strRender = try values.decodeIfPresent(String.self, forKey: .strRender)
		strSide = try values.decodeIfPresent(String.self, forKey: .strSide)
		strSigning = try values.decodeIfPresent(String.self, forKey: .strSigning)
		strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
		strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
		strTeam2 = try values.decodeIfPresent(String.self, forKey: .strTeam2)
		strThumb = try values.decodeIfPresent(String.self, forKey: .strThumb)
		strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
		strWage = try values.decodeIfPresent(String.self, forKey: .strWage)
		strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
		strWeight = try values.decodeIfPresent(String.self, forKey: .strWeight)
		strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
	}

    init(name: String?,
         location: String?,
         sports: String?,
         coutry: String?,
         number: String?,
         description: String?,
         thumbUrl: String?,
         bannerUrl: String?,
         photos: String?,
         facebook: String?,
         twitter: String?,
         instagram: String?) {
        
    
        strBanner = bannerUrl
        strBirthLocation = location
        strDescriptionEN = description
        strFacebook = facebook
        
        let photosArray = Player.unarchiveStringToImages(photos)
        strFanart1 = photosArray.
        case strFanart2 = "strFanart2"
        case strFanart3 = "strFanart3"
        case strFanart4 = "strFanart4"
        case strGender = "strGender"
        case strHeight = "strHeight"
        case strInstagram = "strInstagram"
        case strKit = "strKit"
        case strLocked = "strLocked"
        case strNationality = "strNationality"
        case strNumber = "strNumber"
        case strOutfitter = "strOutfitter"
        case strPlayer = "strPlayer"
        case strPosition = "strPosition"
        case strRender = "strRender"
        case strSide = "strSide"
        case strSigning = "strSigning"
        case strSport = "strSport"
        case strTeam = "strTeam"
        case strTeam2 = "strTeam2"
        case strThumb = "strThumb"
        case strTwitter = "strTwitter"
        case strWage = "strWage"
        case strWebsite = "strWebsite"
        case strWeight = "strWeight"
        case strYoutube = "strYoutube"
    }
}

extension Player {
    func archiveImagesToString() -> String? {
        return [strFanart1, strFanart2, strFanart3, strFanart4]
            .compactMap { $0 }
            .joined(separator: "{}")
    }

    static func unarchiveStringToImages(_ imageString: String?) -> [String] {
        guard let imageStr = imageString else {
            return []
        }
        return imageStr.components(separatedBy: "{}")
            .compactMap { $0 }
    }
}
