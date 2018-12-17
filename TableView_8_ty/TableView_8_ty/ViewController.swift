//
//  ViewController.swift
//  TableView_8_ty
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 ty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var showChoice: UILabel!
    var stuArray = [Student]()
    var teaArray = [Teacher]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var StudentTableView: UITableView!
    @IBOutlet weak var TeacherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArray.append(Student(firstName: "Li", lastName: "Howon", age: 28, gender: .male, grade: 99))
        stuArray.append(Student(firstName: "Li", lastName: "Chenglie", age: 28, gender: .male, grade: 80))
        stuArray.append(Student(firstName: "Jin", lastName: "Sungkyu", age: 28, gender: .male, grade: 90))
        stuArray.append(Student(firstName: "Nam", lastName: "Woohyun", age: 28, gender: .male, grade: 92))
        stuArray.append(Student(firstName: "Li", lastName: "Chengzhong", age: 28, gender: .male, grade: 80))
        stuArray.append(Student(firstName: "Zhang", lastName: "Dongwu", age: 28, gender: .male, grade: 92))
        for i in 1...5{
            let temp = Teacher(firstName: "Li", lastName: "tc"+"\(i)", age: 34, gender: .female, title: "jsfh")
            teaArray.append(temp)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == StudentTableView) {
            return stuArray.count
        }else{
            return teaArray.count
        }
    }
    @IBAction func addClicked(_ sender: Any) {
        if let stuName = nameTextField.text {
            stuArray.append(Student(name: stuName ?? "输入无效"))
            StudentTableView.reloadData()
        }
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = StudentTableView.indexPathForSelectedRow?.row {
            if let name = nameTextField.text{
                stuArray[row] = Student(name:name)
                StudentTableView.reloadData()
            }
        }
        if let row = TeacherTableView.indexPathForSelectedRow?.row {
            if let name = nameTextField.text{
                teaArray[row] = Teacher(name: name)
                TeacherTableView.reloadData()
            }
        }
    }
    @IBAction func deleteClicked(_ sender: Any) {
        StudentTableView.isEditing = !StudentTableView.isEditing
        TeacherTableView.isEditing = !TeacherTableView.isEditing
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == StudentTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            let stu = stuArray[indexPath.row]
            cell.name.text = stu.fullName
            
            if stu.gender.rawValue == 0{
                cell.gender.text="male"
            }else{
                cell.gender.text="female"
            }
            cell.age.text = String(stu.age)
            cell.grade.text = String(stu.grade)
            cell.name.sizeToFit()
            return cell
        }else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            let tea = teaArray[indexPath.row]
            cell.name.text = tea.fullName
            cell.gender.text = String(tea.gender.rawValue)
            cell.age.text = String(tea.age)
            cell.titile.text = tea.title
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == StudentTableView) {
            showChoice.text = "You choose:\(stuArray[indexPath.row])"
        }else{
            showChoice.text = "You choose:\(teaArray[indexPath.row])"
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if tableView == StudentTableView{
            if editingStyle == .delete{
                stuArray.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }else if tableView == TeacherTableView{
            if editingStyle == .delete{
                teaArray.remove(at: indexPath.row)
                tableView.reloadData()
            
        }
    }
}
}
