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
    
    var netProfit: NetProfit?
    var projectInfo: ProjectInfo?
    var scoreCard: ScoreCard?
    
    var decimalFormatter = NumberFormatter()
    var numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFormatter()
        initMonthYear()
        setMonthYearLabel()
        initChartView()
        initTable()
        loadTableData()
    }
    
    @IBAction func monthSelectDidTouch(_ sender: Any) {
        showFilter()
    }
    
    @IBAction func searchButtonDidTouch(_ sender: Any) {
        showFilter()
    }
    
    private func initFormatter() {
        self.decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        self.decimalFormatter.minimumFractionDigits = 2
        self.decimalFormatter.maximumFractionDigits = 2
        
        self.numberFormatter.numberStyle = NumberFormatter.Style.decimal
        self.numberFormatter.minimumFractionDigits = 0
        self.numberFormatter.maximumFractionDigits = 0
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
    
    func loadNetProfitData() -> Void {
        
        DashboardService.getNetProfitData(year: self.selectedYear, month: self.selectedMonth) { netProfit in
            
            self.netProfit = netProfit
            
            self.summaryTableView.reloadData()
            
//            self.isNetProfitLoaded = true
//            self.updateIndicatorState()
        }
    }
    
    func loadProjectInfo() -> Void {
        DashboardService.getProjectInfoData(year: self.selectedYear, month: self.selectedMonth) { projectInfo in
            
            self.projectInfo = projectInfo
            
            self.summaryTableView.reloadData()
            
            //        self.isProjectIonfoLoaded = true
            //        self.updateIndicatorState()
        }
    }
    
    func loadScoreCardData() -> Void {
        
        DashboardService.getScoreCardData(year: self.selectedYear, month: self.selectedMonth) { scoreCard in
            
            self.scoreCard = scoreCard
            
            self.summaryTableView.reloadData()
            
//            self.isScoreCardLoaded = true
//            self.updateIndicatorState()
        }
    }
    
    func loadTableData() {
        loadNetProfitData()
        loadProjectInfo()
        loadScoreCardData()
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
            
            if let netProfit = self.netProfit {
                cell.amountLabel.text = self.decimalFormatter.string(from: NSNumber(value: netProfit.netProfit))
                
                var progressInPercentage = 0.0
                if netProfit.rkap != 0{
                    progressInPercentage = (netProfit.netProfit / netProfit.rkap) * 100
                    cell.percentageLabel.text = self.decimalFormatter.string(from: NSNumber(value: progressInPercentage))! + "%"
                }else{
                    cell.percentageLabel.text = "-"
                }
                
                var prevProgressInPercentage = 0.0;
                if(netProfit.prevRkap > 0){
                    prevProgressInPercentage = (netProfit.prevNetProfit / netProfit.prevRkap) * 100;
                }
                
//                if progressInPercentage > prevProgressInPercentage{
//                    statusImageName = "up_trend";
//                    percentageLabelColor = UIColor(red:0.21, green:0.63, blue:0.00, alpha:1.0)
//                }else if (progressInPercentage < prevProgressInPercentage){
//                    statusImageName = "down_trend_red";
//                    percentageLabelColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1.0)
//                }
                
            }else{
                cell.amountLabel.text = " - "
            }
            
//            cell.percentageLabel.textColor = percentageLabelColor
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleSummaryTableViewCell") as! SimpleSummaryTableViewCell
            cell.titleLabel.text = "Proyek Kons & Fab"
            if let projectInfo = self.projectInfo {
                
                cell.amountLabel.text = self.numberFormatter.string(from: NSNumber(value: projectInfo.projectCount))
                
//                let lateProjectCount = projectInfo.lateProjectCount;
//                let prevLateProjectCount = projectInfo.prevLateProjectCount;
                
//                if(lateProjectCount < prevLateProjectCount){
//                    statusImageName = "down_trend";
//                }else if(lateProjectCount > prevLateProjectCount){
//                    statusImageName = "up_trend_red";
//                }
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleSummaryTableViewCell") as! SimpleSummaryTableViewCell
            cell.titleLabel.text = "Proyek O & M"
            if let projectInfo = self.projectInfo {
                
                cell.amountLabel.text = self.numberFormatter.string(from: NSNumber(value: projectInfo.projectOMCount!))
                
//                let lateProjectCount = projectInfo.lateProjectCount;
//                let prevLateProjectCount = projectInfo.prevLateProjectCount;
//
//                if(lateProjectCount < prevLateProjectCount){
//                    statusImageName = "down_trend";
//                }else if(lateProjectCount > prevLateProjectCount){
//                    statusImageName = "up_trend_red";
//                }
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
            cell.titleLabel.text = "Score Card"
            cell.descriptionLabel.text = "%Terhadap Target"
            cell.statusArrow.changeColor()
            
            if let scoreCard = self.scoreCard {
                var progressInPercentage = 0.0;
                if (scoreCard.target > 0) {
                    progressInPercentage = (Double(scoreCard.total) / Double(scoreCard.target)) * 100;
                    cell.percentageLabel.text = self.decimalFormatter.string(from: NSNumber(value: progressInPercentage))! + "%"
                }else{
                    cell.percentageLabel.text = "-"
                }
                
                cell.amountLabel.text = numberFormatter.string(from: NSNumber(value: scoreCard.total))
                
//                let total = scoreCard.total;
//                let prevTotal = scoreCard.prevTotal;
//
//                if(total > prevTotal){
//                    statusImageName = "up_trend";
//                    percentageLabelColor = UIColor(red:0.21, green:0.63, blue:0.00, alpha:1.0)
//                }else if(total < prevTotal){
//                    statusImageName = "down_trend_red";
//                    percentageLabelColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1.0)
//                }
            }
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
