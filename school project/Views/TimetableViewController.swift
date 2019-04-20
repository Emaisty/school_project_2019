//
//  TimetableViewController.swift
//  school project
//
//  Created by Максим Гусев on 17/03/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

struct Day: Decodable {
    var lessons: [lesson]
    struct lesson: Decodable {
        var id: Int
        var Date: [Int]
        var begin_time : [Int]
        var end_time: [Int]
        var day_number: Int
        var lesson_number: Int
        var subject: String
        var lesson_name: Int
        var comment: String
        var marks: [Int]
        var homework: [homewrk]
        struct homewrk:Decodable {
            var description: String
            var attachments: [Int]
            
        }
        
    }
}

class TimetableViewController: UIViewController {
    
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var Timetable: UIView!
    @IBOutlet weak var TimetableScrollView: UIScrollView!
    
    var TimetableCells = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetMonth()
        
        
        let numberoflessons = 7
        
        for k in 0...numberoflessons{
            AddNewCell(i: k)
        }
        for k in 0...numberoflessons{
            AddNumbLess(i: k)
        }
        Timetabl()
    }
    
    func Timetabl(){
        let urllogpass = "https://api.julista.org/schedule/?token=91ef2afe72d45d6a152cfb214ca26988&pid=2995882&student_profile_id=2995882&from=2019-04-01&to=2019-04-01"
        let url = URL(string: urllogpass)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in guard let data = data else { return }
            do{
                let OneDay = try JSONDecoder().decode(Day.self, from: data)
                self.table(Timetable: OneDay)
            } catch let error{
                //self.displayMyAlertMessage(userMessage: "Uncorrect")
                return
            }
        }
        task.resume()
    }
    
    func table(Timetable: Day) {
        print(Timetable)
    }
    
    func SetMonth() {
        let components = Calendar.current.dateComponents([ .month], from: Date())
        let months = ["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"]
        MonthLabel.text = months[components.month!-1]
    }
    
    func SetTimetableView(hieght: Int) {
        
    }
    
    func AddNewCell(i: Int) {
        TimetableCells.append(UIView())
        TimetableCells[i].backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        Timetable.addSubview(TimetableCells[i])
        TimetableCells[i].layer.cornerRadius = 25
        
        TimetableCells[i].translatesAutoresizingMaskIntoConstraints = false
        let HorizontalConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let SidesMarginConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let HeightConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60)
        var TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Timetable, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        if i > 0{
            TopConstraint = NSLayoutConstraint(item: TimetableCells[i], attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: TimetableCells[i-1], attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 10)
        }
        view.addConstraints([HorizontalConstraint, SidesMarginConstraint, HeightConstraint, TopConstraint])
    }
    
    func AddNumbLess(i: Int){
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 100)
        TimetableCells[i].addSubview(view)
        TimetableCells[i].clipsToBounds = true
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        var myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true,completion: nil)
    }
    
}
