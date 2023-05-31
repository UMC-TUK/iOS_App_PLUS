//
//  MovieScreening.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation

// MARK: - Welcome
struct Movie: Codable {
    let movieScreening: [MovieScreening]?
    enum CodingKeys: String, CodingKey {
        case movieScreening = "MovieScreening"
    }
}

// MARK: - MovieScreening
struct MovieScreening: Codable {
    let head: [Head]?
    let row: [Row]
}

// MARK: - Head
struct Head: Codable {
    let listTotalCount: Int?
    let result: Result?
    let apiVersion: String?

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case apiVersion = "api_version"
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String?

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
    
    let sigunCD, sigunNm, bizplcNm, licensgDe: String?
    let licensgCanclDe: JSONNull?
    let bsnStateNm: BsnStateNm?
    let clsbizDe: String?
    let bsnStateDivCD: String?
    let buldngPurposNm, performPLCFormDivNm, culturBizmanDivNm: JSONNull?
    let locplcFacltTelno: String?
    let culturPhstrnIndutypeNm: CulturPhstrnIndutypeNm?
    let locplcArInfo, sondfacltYn, videoRegenrtNm, emgncyStairsYn: JSONNull?
    let emgnexitYn: JSONNull?
    let roadnmZipCD: String?
    let facltAr: Int?
    let soundFacltYn, aotoVentltnYn, lightFacltExtno, regionDivNm: JSONNull?
    let yongroomCnt, yongroomYn: JSONNull?
    let firstRegistPntTm: String?
    let passwayBrth, bizcondDivNmInfo, speclLightYn: JSONNull?
    let xCrdntVl: String?
    let convnceFacltYn: JSONNull?
    let yCrdntVl: String?
    let prodlstNm: JSONNull?
    let totFloorCnt: Int?
    let circumfrEnvrnNm, manufactTrtmntProdlstCont: JSONNull?
    let groundFloorCnt, ugrwtrFloorCnt: Int?
    let refineLotnoAddr: String?
    let refineRoadnmAddr: String?
    let refineZipCD: String?
    let lightFacltIlumQty: JSONNull?
    let refineWgs84Logt, refineWgs84Lat: String?
    let sngrumRlCnt, firefacltYn, totGamemchnCnt, existngOtfgmbizIndutypeNm: JSONNull?
    let provsnGameswNm: JSONNull?

    
//마커 찍을 때 사용하는 거
//     let BIZPLC_NM: String?
//     let REFINE_WGS84_LOGT: String?
//     let REFINE_WGS84_LAT: String?
//
    
    enum CodingKeys: String, CodingKey {
        case sigunCD = "SIGUN_CD"
        case sigunNm = "SIGUN_NM"
        case bizplcNm = "BIZPLC_NM"
        case licensgDe = "LICENSG_DE"
        case licensgCanclDe = "LICENSG_CANCL_DE"
        case bsnStateNm = "BSN_STATE_NM"
        case clsbizDe = "CLSBIZ_DE"
        case bsnStateDivCD = "BSN_STATE_DIV_CD"
        case buldngPurposNm = "BULDNG_PURPOS_NM"
        case performPLCFormDivNm = "PERFORM_PLC_FORM_DIV_NM"
        case culturBizmanDivNm = "CULTUR_BIZMAN_DIV_NM"
        case locplcFacltTelno = "LOCPLC_FACLT_TELNO"
        case culturPhstrnIndutypeNm = "CULTUR_PHSTRN_INDUTYPE_NM"
        case locplcArInfo = "LOCPLC_AR_INFO"
        case sondfacltYn = "SONDFACLT_YN"
        case videoRegenrtNm = "VIDEO_REGENRT_NM"
        case emgncyStairsYn = "EMGNCY_STAIRS_YN"
        case emgnexitYn = "EMGNEXIT_YN"
        case roadnmZipCD = "ROADNM_ZIP_CD"
        case facltAr = "FACLT_AR"
        case soundFacltYn = "SOUND_FACLT_YN"
        case aotoVentltnYn = "AOTO_VENTLTN_YN"
        case lightFacltExtno = "LIGHT_FACLT_EXTNO"
        case regionDivNm = "REGION_DIV_NM"
        case yongroomCnt = "YONGROOM_CNT"
        case yongroomYn = "YONGROOM_YN"
        case firstRegistPntTm = "FIRST_REGIST_PNT_TM"
        case passwayBrth = "PASSWAY_BRTH"
        case bizcondDivNmInfo = "BIZCOND_DIV_NM_INFO"
        case speclLightYn = "SPECL_LIGHT_YN"
        case xCrdntVl = "X_CRDNT_VL"
        case convnceFacltYn = "CONVNCE_FACLT_YN"
        case yCrdntVl = "Y_CRDNT_VL"
        case prodlstNm = "PRODLST_NM"
        case totFloorCnt = "TOT_FLOOR_CNT"
        case circumfrEnvrnNm = "CIRCUMFR_ENVRN_NM"
        case manufactTrtmntProdlstCont = "MANUFACT_TRTMNT_PRODLST_CONT"
        case groundFloorCnt = "GROUND_FLOOR_CNT"
        case ugrwtrFloorCnt = "UGRWTR_FLOOR_CNT"
        case refineLotnoAddr = "REFINE_LOTNO_ADDR"
        case refineRoadnmAddr = "REFINE_ROADNM_ADDR"
        case refineZipCD = "REFINE_ZIP_CD"
        case lightFacltIlumQty = "LIGHT_FACLT_ILUM_QTY"
        case refineWgs84Logt = "REFINE_WGS84_LOGT"
        case refineWgs84Lat = "REFINE_WGS84_LAT"
        case sngrumRlCnt = "SNGRUM_RL_CNT"
        case firefacltYn = "FIREFACLT_YN"
        case totGamemchnCnt = "TOT_GAMEMCHN_CNT"
        case existngOtfgmbizIndutypeNm = "EXISTNG_OTFGMBIZ_INDUTYPE_NM"
        case provsnGameswNm = "PROVSN_GAMESW_NM"
    }
}

enum BsnStateNm: String, Codable {
    case 영업중 = "영업중"
    case 폐업 = "폐업"
}

enum CulturPhstrnIndutypeNm: String, Codable {
    case 영화상영업 = "영화상영업"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
