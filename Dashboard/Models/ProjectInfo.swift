//
//  ProjectInfo.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 11/8/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation
public class ProjectInfo {
    var month: Int
    var year: Int
    var projectCount : Int
    var lateProjectCount : Int
    var prevLateProjectCount : Int
    
    var projectOMCount: Int?
    var lateProjectOMCount: Int?
    var prevLateProjectOMCount: Int?
    
    init (month: Int, year: Int, projectCount: Int, lateProjectCount: Int, prevLateProjectCount: Int) {
        self.month = month
        self.year = year
        self.projectCount = projectCount
        self.lateProjectCount = lateProjectCount
        self.prevLateProjectCount = prevLateProjectCount
    }
}
