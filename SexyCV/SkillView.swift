//
//  SkillView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 20/02/2021.
//

import SwiftUI

struct SkillView: View {
    
    var skill: String = ""
    
    var body: some View {
        Text(skill)
            .font(.caption)
            .lineLimit(1)
            
        
    }
}

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView(skill: "Xcode")
    }
}
