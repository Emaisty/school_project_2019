//
//  GradesViewController.swift
//  school project
//
//  Created by Максим Гусев on 19/04/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController {
    
    @IBOutlet weak var GradesView: UIView!
    var TimetableCells = [UIView]()
    let l = ["Математика","Англиский язык", "География","Индивидуальный проект","Информатика","История","Литература","Обществознание","ОБЖ","Русский язык","Физика","Физическая культура","Спецматематика"]
    var r = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for k in 0...12{
            AddNewCell(i: k)
        }
        addl()
        
    }
    
    func addl(){
        for k in 0...12{
            r.append(UILabel())
            r[k].text = "LOL"
            TimetableCells[k].addSubview(r[k])
            print("LOL")
        }
    }
    
    func AddNewCell(i: Int) {
        TimetableCells.append(UIView())
        TimetableCells[i].backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        GradesView.addSubview(TimetableCells[i])
        TimetableCells[i].layer.cornerRadius = 25
        
        TimetableCells[i].translatesAutoresizingMaskIntoConstraints = false
        let HorizontalConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let SidesMarginConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let HeightConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        var TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: GradesView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        if i > 0{
            TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: TimetableCells[i-1], attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 20)
        }
        view.addConstraints([HorizontalConstraint, SidesMarginConstraint, HeightConstraint, TopConstraint])
    }
    
}
