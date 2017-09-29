//
//  MonthYearPickerViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class MonthYearPickerViewController: UIViewController {
    
    @IBOutlet weak var monthDatePickerView: UIView!
    var selectedMonth: Int = Constant.defaultMonth
    var selectedYear: Int = Constant.defaultYear
    var delegate: MonthYearPickerDelegate?
    var monthPickerView: MonthYearPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let monthYearPicker = MonthYearPickerView()
        self.monthPickerView = monthYearPicker
        monthDatePickerView.addSubview(monthYearPicker)
        
        monthYearPicker.month = selectedMonth
        monthYearPicker.year = selectedYear
    }
    
    
    @IBAction func selectMonthYear(_ sender: Any) {
        if let theDelegate = self.delegate {
            theDelegate.monthYearSelected(month: monthPickerView!.month, year: monthPickerView!.year)
        }
        performSegueToReturnBack()
    }
    
}

protocol MonthYearPickerDelegate {
    func monthYearSelected(month: Int, year: Int)
}
