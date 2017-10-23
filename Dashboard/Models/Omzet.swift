//
//  Omzet.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 10/1/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import Foundation

public class Omzet {
    var month: String
    var plan : Double?
    var actual : Double?
    init (month: String, plan: Double?, actual: Double?) {
        self.month = month
        self.plan = plan
        self.actual = actual
    }
}
