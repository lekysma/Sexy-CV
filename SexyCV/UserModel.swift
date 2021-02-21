//
//  UserModel.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 20/02/2021.
//

import SwiftUI

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var age: String = "0"
    var jobTitle: String = ""
    var skills: [String] = [String]()
   
    

}

struct MockData {
    static let sampleUser = User(firstName: "Jean Martin", lastName: "Kyssama", email: "lekysma@gmail.com", age: "33", jobTitle: "Recruiter", skills: ["Xcode", "Recruitment", "iOS"])
}
