//
//  ScoreCard.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 11/8/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation

public class ScoreCard {
    var month: Int
    var year: Int
    var total : Int
    var prevTotal : Int
    var target : Int
    
    init (month: Int, year: Int, total: Int, prevTotal: Int, target: Int) {
        self.month = month
        self.year = year
        self.total = total
        self.prevTotal = prevTotal
        self.target = target
    }
}
