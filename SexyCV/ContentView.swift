//
//  ContentView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 19/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //welcome screen
        
        NavigationView {
            VStack {
                //MARK: - LOGO / APP NAME
                LogoView()
                
                Spacer()
                //MARK: - BUTTON TO FORM
               NavigationLink(
                destination: FormView(user: MockData.sampleUser),
                label: {
                    Text("tap here to move")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 260, height: 50)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                        .cornerRadius(10)
                })
            }//VSTACK END
            .padding(20)
        } //NAVIGATION VIEW END
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
