//
//  MainViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit
import PopupDialog

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func monthSelectDidTouch(_ sender: Any) {
        performSegue(withIdentifier: "ShowMonthYearPickerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC  = segue.destination as? MonthYearPickerViewController
        destinationVC?.selectedYear = 2017
        destinationVC?.selectedMonth = 9
    }
    
}
