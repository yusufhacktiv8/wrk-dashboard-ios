//
//  NetProfit.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 10/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation

public class NetProfit {
    var month: Int
    var year: Int
    var netProfit : Double
    var prevNetProfit : Double
    var rkap : Double
    var prevRkap: Double
    
    init (month: Int, year: Int, netProfit: Double, prevNetProfit: Double, rkap: Double, prevRkap: Double) {
        self.month = month
        self.year = year
        self.netProfit = netProfit
        self.prevNetProfit = prevNetProfit
        self.rkap = rkap
        self.prevRkap = prevRkap
    }
}
