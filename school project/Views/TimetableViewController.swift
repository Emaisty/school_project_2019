//
//  TimetableViewController.swift
//  school project
//
//  Created by Максим Гусев on 17/03/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController {
    
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var Timetable: UIView!
    
    var TimetableCells = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetMonth()
        let numberoflessons = 10 - 1
        
        for k in 0...numberoflessons{
            AddNewCell(i: k)
        }
    }
    
    func SetMonth() {
        let components = Calendar.current.dateComponents([ .month], from: Date())
        let months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        MonthLabel.text = months[components.month!-1]
    }
    
    func AddNewCell(i: Int) {
        TimetableCells.append(UIView())
        TimetableCells[i].backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        Timetable.addSubview(TimetableCells[i])
        TimetableCells[i].layer.cornerRadius = 25
        
        TimetableCells[i].translatesAutoresizingMaskIntoConstraints = false
        let HorizontalConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let SidesMarginConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let HeightConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        var TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Timetable, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20)
        if i > 0{
            TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: TimetableCells[i-1], attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 20)
        }
        view.addConstraints([HorizontalConstraint, SidesMarginConstraint, HeightConstraint, TopConstraint])
    }
    
}
