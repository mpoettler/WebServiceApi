import UIKit
import Darwin

func perfLongAction (msg:String)async ->
String{
    sleep(3)
    return "Done \(msg) ...Done"
}
print("Startup")
Task{
    let res  = await perfLongAction(msg: "Hello 1")
    print(res)
    let res2 = await perfLongAction(msg: "Hello 2")
    print(res2)

}
print("Programm done")

