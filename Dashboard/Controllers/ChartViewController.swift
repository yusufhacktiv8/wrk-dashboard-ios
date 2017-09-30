//
//  ChartViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartScrollView: UIScrollView!
    @IBOutlet weak var chartStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initChartViews()
    }
    
    private func initChartViews() {
        var chartView = initChart1()
        chartStackView.addArrangedSubview(chartView)
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
        
        chartView = DashboardChart()
        chartView.backgroundColor = UIColor.blue
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
        
        chartView = DashboardChart()
        chartView.backgroundColor = UIColor.yellow
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
    }
    
    private func initChart1() -> DashboardChart {
        let chartView = DashboardChart()
        chartView.backgroundColor = UIColor(red:0.22, green:0.40, blue:0.71, alpha:1.0)
        chartView.valueLabelColor = UIColor.white
        chartView.circle1Color = UIColor.yellow
        chartView.legend1Color = UIColor.white
        chartView.circle2Color = UIColor.blue
        chartView.legend2Color = UIColor.white
        chartView.title = "Omzet Kontrak"
        chartView.titleColor = UIColor.white
        chartView.legend1 = "Realisasi"
        chartView.legend1Color = UIColor.white
        chartView.legend2 = "Rencana"
        chartView.legend2Color = UIColor.white
        return chartView
    }
}
