//
//  TimetableViewController.swift
//  school project
//
//  Created by Максим Гусев on 17/03/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController {

    @IBOutlet weak var Timetable: UIView!
    @IBOutlet weak var MonthLabel: UILabel!
    var Cells = ["muda"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetMonth()
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        Timetable.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let leftMarginConstraint = NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 10)
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([horizontalConstraint, leftMarginConstraint, heightConstraint])
        
    }
    
    func SetMonth() {
        let components = Calendar.current.dateComponents([ .month], from: Date())
        let months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        MonthLabel.text = months[components.month!-1]
    }

}
