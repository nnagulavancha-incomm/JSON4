//
//  ViewController.swift
//  JSONParsing
//
//  Created by Naresh kumar Nagulavancha on 10/25/17.
//  Copyright © 2017 Naresh kumar Nagulavancha. All rights reserved.
//

import UIKit

//urls

fileprivate let singleCourse = "https://api.letsbuildthatapp.com/jsondecodable/course"
fileprivate let courses = "https://api.letsbuildthatapp.com/jsondecodable/courses"
fileprivate let fullJson = "https://api.letsbuildthatapp.com/jsondecodable/website_description"

struct Course: Decodable{
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
}

struct WebSite: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fJson = URL(string: fullJson) else {return}
        
        URLSession.shared.dataTask(with: fJson){
            (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let fullJson = try JSONDecoder().decode(WebSite.self, from: data)
                print(fullJson.description)
            }
            catch let error {
                print(error)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

