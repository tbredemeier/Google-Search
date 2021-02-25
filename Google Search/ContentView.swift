//
//  ContentView.swift
//  Google Search
//
//  Created by Tom Bredemeier on 2/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                queryAPI()
            })
    }
    
    func queryAPI() {
        let apiKey = "?rapidapi-key=d87dc96880msh138dad116ed364ep17b762jsnfa65120c7d18"
        let query = "https://google-search3.p.rapidapi.com/api/v1/search/q=corn+dog&num=100\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                let contents = json["results"].arrayValue
                for item in contents {
                    let title = item["title"].stringValue
                    let link = item["link"].stringValue
                    let entry = Entry(title: title, link: link)
                    print(entry)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Entry: Identifiable {
    let id = UUID()
    let title: String
    let link: String
}
