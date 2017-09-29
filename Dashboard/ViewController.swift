//
//  ViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/26/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{    

    @IBOutlet weak var summaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

