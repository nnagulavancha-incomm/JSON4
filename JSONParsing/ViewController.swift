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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: singleCourse) else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course)
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

