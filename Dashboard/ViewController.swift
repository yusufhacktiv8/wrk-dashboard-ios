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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
//        let custom = Triangle(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        cell.statusArrow.addSubview(custom)
        cell.statusArrow.changeColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    


}

