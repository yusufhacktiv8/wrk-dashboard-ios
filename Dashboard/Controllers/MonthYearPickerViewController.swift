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
    var selectedMonth: Int = 1
    var selectedYear: Int = 2008
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let monthYearPicker = MonthYearPickerView()
        monthDatePickerView.addSubview(monthYearPicker)
        
        monthYearPicker.selectRow(selectedMonth, inComponent: 0, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
