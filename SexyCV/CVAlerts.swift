//
//  CVAlerts.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 20/02/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    static let emptyField = AlertItem(title: Text("Invalid Form"), message: Text("Please make sure all fields have been filled out correctly"), dismissButton: .default(Text("Ok")))
    static let emptySkill = AlertItem(title: Text("Empty Skill"), message: Text("You must type a valid string"), dismissButton: .default(Text("Ok")))
}
