//
//  DismissButtonView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 19/02/2021.
//

import SwiftUI

struct DismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            //
            Image(systemName: "xmark")
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
        }
    }
}

struct DismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DismissButtonView()
    }
}
