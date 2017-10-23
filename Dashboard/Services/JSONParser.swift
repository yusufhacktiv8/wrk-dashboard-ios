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
}
