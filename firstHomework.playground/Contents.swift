import UIKit

enum Gender: Int {
    case male    //男性
    case female  //女性
    case unknow  //未知
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
enum Department {
    case one, two, three
}
protocol SchoolProtocol {
    var department: Department { get set }
    func lendBook()
}
class Person: CustomStringConvertible  {
    var firstName: String  //姓
    var lastName: String  //名
    var age: Int  //年龄
    var gender: Gender  //性别
    
    var fullName: String {  //全名
        get {
            return firstName + lastName
        }
    }
    
    //构造方法
    init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, age: 0, gender: Gender.unknow)
    }
    
    required convenience init() {
        self.init(firstName: "")
    }
    
    //重载==
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    
    //重载!=
    static func !=(lhs: Person, rhs: Person) -> Bool {
        return !(lhs == rhs)
    }
    
    //实现CustomStringConvertible协议中的计算属性，可以使用print直接输出对象内容
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    
    //输出Person XXX is running
    func run() {
        print("Person \(self.fullName) is running")
    }
}

var p1 = Person(firstName: "张")
var p2 = Person(firstName: "张", age: 20, gender: .male)
print(p1)  //输出fullName: 张, age: 0, gender: male
print(p1 == p2)  //输出false
print(p1 != p2)  //输出true



class Teacher: Person, SchoolProtocol {
    var title: String  //标题
    var department: Department  //公寓
    
    //构造方法
    init(title: String, firstName: String, lastName: String, age: Int, gender: Gender, department: Department) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    init(title: String, department: Department) {
        self.title = title
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: .unknow)
    }
    
    convenience required init() {
        self.init(title: "", department: Department.one)
    }
    
    //重写父类的计算属性
    override var description: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    //重载父类run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

var t1 = Teacher(title: "hello", department: .one)
print(t1)  //输出title: hello, fullName: , age: 0, gender: unknow, department: one

class Student: Person, SchoolProtocol {
    var stuNo: Int  //学号
    var department: Department  //公寓
    
    //构造方法
    init(stuNo: Int, firstName: String, lastName: String, age: Int, gender: Gender, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    init(stuNo: Int, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: Gender.unknow)
    }
    
    required convenience init() {
        self.init(stuNo: 0, department: .one)
    }
    
    //重写父类的计算属性
    override var description: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    
    //重载父类run方法
    override func run() {
        print("Student \(self.fullName) is running")
    }
    
    //遵循协议的方法
    func lendBook() {
        print("Teacher \(self.fullName) lend a book")
    }
}

var s1 = Student(stuNo: 2015110101, department: .two)
print(s1)  //输出stuNo: 2015110101, fullName: , age: 0, gender: unknow, department: two



var array = [Person]()

for i in 1...5 {
    let temp = Person(firstName: "张", lastName: "\(i)", age: 20, gender: .male)
    array.append(temp)
}

for i in 1...5 {
    let temp = Teacher(title: "hello", firstName: "李", lastName: "\(i)", age: 21, gender: .female, department: .one)
    array.append(temp)
}

for i in 1..<5 {
    let temp = Student(stuNo: 20161104 + i, firstName: "王", lastName: "\(i)", age: 19, gender: .male, department: .two)
    array.append(temp)
}

var dict = ["Person": 0, "Teacher": 0, "Student": 0]

for item in array {
    if item is Teacher {
        dict["Teacher"]! += 1
    } else if item is Student {
        dict["Student"]! += 1
    } else {
        dict["Person"]! += 1
    }
}

for (key, value) in dict {
    print("\(key) has \(value) items")
}

//原始数组
print("------------------------------")
for item in array {
    print(item)
}

//根据age从大到小排序
print("------------------------------")
array.sort { return $0.age > $1.age}
for item in array {
    print(item)
}

//根据全名从前往后排序
print("------------------------------")
array.sort { return $0.fullName < $1.fullName}
for item in array {
    print(item)
}

//根据gender和age从大往小排序
print("------------------------------")
array.sort { return ($0.gender > $1.gender) && ($0.age > $1.age) }
for item in array {
    print(item)
}

func findPrimNumber() -> [Int] {
    var num = [2, 3]
    var flag = true
    var sqr = 0
    for x in 4...10000 {
        sqr = Int(sqrt(Double(x)))
        for y in 2...sqr {
            if x % y == 0 {
                flag = false
                break
            }
        }
        if flag {
            num.append(x)
        }
        flag = true
    }
    return num
}
var numbers = findPrimNumber()


//降序排序
/// 1
func descending(x: Int, y: Int) -> Bool {
    return x > y
}
numbers.sort(by: descending)

///2
numbers.sort { (x: Int, y: Int) -> Bool in
    return x > y
}

/// 3
numbers.sort { (x, y) -> Bool in
    return x > y
}

/// 4
numbers.sort { (x, y) in
    return x > y
}

/// 5
numbers.sort(by: { return $0 > $1 })

/// 6
numbers.sort { $0 > $1 }


