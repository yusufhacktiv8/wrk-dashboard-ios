//
//  MainViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MonthYearPickerDelegate {
    
    let SHOW_MONTH_YEAR_PICKER_SEGUE = "ShowMonthYearPickerSegue"
    
    var selectedMonth: Int = Constant.defaultMonth
    var selectedYear: Int = Constant.defaultYear

    @IBOutlet weak var monthYearLabel: UIButton!
    @IBOutlet weak var scrollPageContainer: UIView!
    @IBOutlet weak var chartContainer: UIView!
    @IBOutlet weak var summaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMonthYear()
        setMonthYearLabel()
        initChartView()
        initTable()
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
    
    private func initChartView() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let chartViewController = storyboard.instantiateViewController(withIdentifier: "chartViewController") as! ChartViewController
        
        chartContainer.addSubview(chartViewController.view)
        chartViewController.view.frame = scrollPageContainer.bounds
        chartViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initTable() {
        self.summaryTableView.delegate = self
        self.summaryTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
            cell.titleLabel.text = "Laba Bersih"
            cell.descriptionLabel.text = "%Terhadap RKAP"
            cell.statusArrow.changeColor()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleSummaryTableViewCell") as! SimpleSummaryTableViewCell
            cell.titleLabel.text = "Proyek Kons & Fab"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleSummaryTableViewCell") as! SimpleSummaryTableViewCell
            cell.titleLabel.text = "Proyek O & M"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
            cell.titleLabel.text = "Score Card"
            cell.descriptionLabel.text = "%Terhadap Target"
            cell.statusArrow.changeColor()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
            cell.titleLabel.text = ""
            cell.descriptionLabel.text = ""
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
