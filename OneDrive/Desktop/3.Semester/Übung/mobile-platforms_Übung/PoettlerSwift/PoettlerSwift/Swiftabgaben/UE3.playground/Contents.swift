import UIKit

print("Hello world")

struct Slide:Decodable, CustomStringConvertible
{
    var description: String{
        "This is \(title)"
    }
    
    var id:Int
    var title:String
}



let jsonStr =
"""
{"slides":[{
    "id":19,
    "title": "Sunset"
},
{
    "id":24,
    "title": "Herack"
}
]}
"""

let jsonData:Data? = jsonStr.data(using: .utf8)

struct SlidesShow:Decodable{
    var slides: [Slide]
}

if let jsonData = jsonData
    {
    print (jsonData)
    
    let decoder = JSONDecoder()
    
    let slideshow:SlidesShow? = try? decoder.decode(SlidesShow.self, from: jsonData)
    
    if let slideshow = slideshow {
        
            
        print("We got slide with title: " , slideshow)
        
        for(idx,sl) in slideshow.slides.enumerated(){
            print("\(idx + 1): '\(sl)'")
        }
        
//        slideshow.slides?.forEach(s in print(s))
    }
    else
    {
        print ("ERR : check input data.")
    }
    
    
    
}
