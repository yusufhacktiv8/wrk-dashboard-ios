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
    
    static func parseProjectInfo(data: AnyObject) -> ProjectInfo {
        let month = data["month"] as? Int ?? 0
        let year = data["year"] as? Int ?? 0
        let projectCount = data["projectCount"] as? Int ?? 0
        let lateProjectCount = data["lateProjectCount"] as? Int ?? 0
        let prevLateProjectCount = data["prevLateProjectCount"] as? Int ?? 0
        
        let projectOMCount = data["projectOMCount"] as? Int ?? 0
        let lateProjectOMCount = data["lateProjectOMCount"] as? Int ?? 0
        let prevLateProjectOMCount = data["prevLateProjectOMCount"] as? Int ?? 0
        
        let projectInfo = ProjectInfo(month: month, year: year, projectCount: projectCount, lateProjectCount: lateProjectCount, prevLateProjectCount: prevLateProjectCount)
        
        projectInfo.projectOMCount = projectOMCount
        projectInfo.lateProjectCount = lateProjectOMCount
        projectInfo.prevLateProjectOMCount = prevLateProjectOMCount
        
        return projectInfo
    }
    
    static func parseScoreCard(data: AnyObject) -> ScoreCard {
        let month = data["month"] as? Int ?? 0
        let year = data["year"] as? Int ?? 0
        let total = data["total"] as? Int ?? 0
        let prevTotal = data["prevTotal"] as? Int ?? 0
        let target = data["target"] as? Int ?? 0
        
        return ScoreCard(month: month, year: year, total: total, prevTotal: prevTotal, target: target)
    }
}
