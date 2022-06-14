import UIKit
import Darwin

print("Fetiching Data")
enum FetchErrors : Error{
    case cannotCreateURL
    case noSucess200
}

struct Slide{}

func fetchAllSlides() async throws -> [Slide]{
    guard let slideURL = URL (string: "http://localhost:8080/...")
    else{
        throw FetchErrors.cannotCreateURL
    }
    
    let slideReq = URLRequest(url: slideURL)
    let(data,respo) = try await URLSession.shared.data(for: slideReq)
    
    guard (respo as? HTTPURLResponse)?.statusCode == 200 else {
        throw FetchErrors.noSucess200
    }
    
    return []
}
Task{
    if let slides = try? await fetchAllSlides(){
        print("All slides loaded" , slides)
    }
    
    let slides = try? await fetchAllSlides()
    print("All slides loaded = Done")
}
print ("Everything startet ... ")
