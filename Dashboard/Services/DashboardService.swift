//
//  DashboardService.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 10/1/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation
import Alamofire

public struct DashboardService {
    
    // Designer News API Doc: http://developers.news.layervault.com
    //                    V2: https://github.com/metalabdesign/dn_api_v2
    
    
    private enum ResourcePath: CustomStringConvertible {
        case Login
        case NetProfitData(year: Int, month: Int)
        case ProjectInfoData(year: Int, month: Int)
        case ScoreCardData(year: Int, month: Int)
        case RiskInfoData(year: Int, month: Int)
        case SmwgData(year: Int, month: Int)
        case OmzetData(year: Int)
        case SalesData(year: Int)
        case DataProgress(year: Int, month: Int)
        
        var description: String {
            switch self {
            case .Login: return "/oauth/token"
            case .NetProfitData(let year, let month): return "/summarydata/net-profit/\(year)/\(month)"
            case .ProjectInfoData(let year, let month): return "/summarydata/project-info/\(year)/\(month)"
            case .ScoreCardData(let year, let month): return "/summarydata/score-card/\(year)/\(month)"
            case .RiskInfoData(let year, let month): return "/summarydata/risk-info/\(year)/\(month)"
            case .SmwgData(let year, let month): return "/summarydata/smwg/\(year)/\(month)"
            case .OmzetData(let year): return "/summarydata/sales/\(year)"
            case .SalesData(let year): return "/summarydata/financial/\(year)"
            case .DataProgress(let year, let month): return "/summarydata/data-progress/\(year)/\(month)"
            }
        }
    }
    
    
    public static func getOmzetData(year: Int, myResponse: @escaping ([Omzet]) -> ()) {
        let urlString = DashboardConstant.BASE_URL + ResourcePath.OmzetData(year: year).description
        
        let username = "dea", password = "wrkadmin"
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]

        Alamofire.request(urlString, headers: headers).responseJSON { response in
            
            if let JSON = response.result.value {
                
                var omzetList: [Omzet] = [Omzet]()
                
                let dataArray = (JSON as! NSArray) as Array
                
                for omzetData in dataArray {
                    let omzet = JSONParser.parseOmzet(data: omzetData)
                    omzetList.append(omzet)
                }
                
                myResponse(omzetList)
            }
            
        }
    }
    
}
