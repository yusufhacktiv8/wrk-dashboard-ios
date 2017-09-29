//
//  MainViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit
import PopupDialog

class MainViewController: UIViewController, MonthYearPickerDelegate {
    
    let SHOW_MONTH_YEAR_PICKER_SEGUE = "ShowMonthYearPickerSegue"
    
    var selectedMonth: Int = Constant.defaultMonth
    var selectedYear: Int = Constant.defaultYear

    @IBOutlet weak var monthYearLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMonthYear()
        setMonthYearLabel()
    }
    
    @IBAction func monthSelectDidTouch(_ sender: Any) {
        showFilter()
    }
    
    @IBAction func searchButtonDidTouch(_ sender: Any) {
        showFilter()
    }
    
    private func showFilter() {
        performSegue(withIdentifier: SHOW_MONTH_YEAR_PICKER_SEGUE, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC  = segue.destination as? MonthYearPickerViewController
        destinationVC?.selectedYear = self.selectedYear
        destinationVC?.selectedMonth = self.selectedMonth
        destinationVC?.delegate = self
    }
    
    private func initMonthYear() {
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        
        self.selectedMonth = month
        self.selectedYear = year
    }
    
    private func setMonthYearLabel() {
        self.monthYearLabel.setTitle("\(Constant.months[self.selectedMonth - 1]), \(self.selectedYear)", for: .normal)
    }
    
    func monthYearSelected(month: Int, year: Int) {
        self.selectedMonth = month
        self.selectedYear = year
        setMonthYearLabel()
    }
}

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
