//
//  student.swift
//  TableView_8_ty
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 ty. All rights reserved.
//

import Foundation

enum Gender: Int{
    case male
    case female
    static func >(l:Gender,r:Gender) -> Bool {
        return l.rawValue > r.rawValue
    }
}
enum Department:String{
    case teacher
    case student
}

protocol SchoolProtocol{
    func lendbook()
    var department:Department{get set}
}

class Person: CustomStringConvertible {
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+" "+lastName
        }
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female)
    }
    
    static func ==(l:Person,r:Person) -> Bool {
        return l.fullName == r.fullName && l.age == r.age && l.gender == r.gender
    }
    static func !=(l:Person,r:Person) -> Bool {
        return !(l==r)
    }
    
    var description:String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    func run(){
        print("Person \(self.fullName) is running")
    }
    
}



class Teacher:Person,SchoolProtocol{
    var title:String
    var department:Department
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        self.department = Department.teacher
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:36,gender:Gender.male,title:"Hello,i am a Teacher!")
    }
    override func run(){
        print("Teacher \(self.fullName) is running")
    }
    func lendbook(){
        print("Teacher \(self.fullName) lend one book")
    }
}

class Student:Person,SchoolProtocol{
    func lendbook() {
        
    }
    convenience init(name:String){
        
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female,grade:60)
    }
    
    var grade:Int
    var department:Department
    init(firstName:String,lastName:String,age:Int,gender:Gender,grade:Int){
        self.grade = grade
        self.department = Department.student
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
}
}
