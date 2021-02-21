//
//  LogoView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 19/02/2021.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "background2"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .cornerRadius(8)
            
            //
            Text("Sexy CV")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
