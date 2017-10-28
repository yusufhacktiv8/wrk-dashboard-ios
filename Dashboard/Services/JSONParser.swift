//
//  JSONParser.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 10/23/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation

struct JSONParser {
    static func parseOmzet(data: AnyObject) -> Omzet {
        let month = data["month"] as? String ?? ""
        let plan = data["plan"] as? Double ?? nil
        let actual = data["actual"] as? Double ?? nil
        return Omzet(month: month, plan: plan, actual: actual)
    }
    
    static func parseNetProfit(data: AnyObject) -> NetProfit {
        let month = data["month"] as? Int ?? 0
        let year = data["year"] as? Int ?? 0
        let netProfit = data["netProfit"] as? Double ?? 0.0
        let prevNetProfit = data["prevNetProfit"] as? Double ?? 0.0
        let rkap = data["rkap"] as? Double ?? 0.0
        let prevRkap = data["prevRkap"] as? Double ?? 0.0
        return NetProfit(month: month, year: year, netProfit: netProfit, prevNetProfit: prevNetProfit, rkap: rkap, prevRkap: prevRkap)
    }
}
