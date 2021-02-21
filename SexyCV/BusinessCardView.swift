//
//  BusinessCardView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 20/02/2021.
//

import SwiftUI

struct BusinessCardView: View {
//    var skillgrid:[GridItem] = [GridItem(.flexible())]
    var name: User
    @Binding var viewIsPresented: Bool
    @State var isShowingReverse = false
    
//    var mockData = ["skill1", "skill2", "skill3", "skill4"]
    
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack(alignment: .leading,spacing:20) {
                //MARK: - document title
                HStack {
                    Spacer()
                    Text(name.jobTitle)
                        .font(.largeTitle).bold()
                        .minimumScaleFactor(0.7)
                }
                
                //MARK: - credit card chip and skills
                VStack(alignment: .leading) {
                    //it contains 2 hstacks
                    HStack {
                        Image(uiImage: #imageLiteral(resourceName: "creditChip"))
                            .resizable()
                            .frame(width: 70, height: 70)
                        
                        Spacer()
                    }
                    //
                    HStack {
                        ForEach(name.skills, id: \.self) {data in
                            Text(data)
                                .font(.title2)
                                .scaledToFill()
                                .minimumScaleFactor(0.7)
                        }
                    }
                }
                
                //MARK: - Age
                HStack(spacing: 20) {
                    Text("Valid Since:".uppercased())
                        .font(.title3)
                        .italic()
                    
                    VStack {
                        Text("Years".uppercased())
                            .font(.title3)
                            .italic()
                        Text(name.age)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                //
                Text(name.firstName + "" + name.lastName.uppercased())
                    .font(.title).bold()
                    
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 335)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "background2"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.3),
                    radius: 20,
                    x: 0,
                    y: 10)
            
            Spacer()
        }
        .padding(.top, 20)
        .overlay(
            Button {
                
                //we dismiss the view by tapping the button
                viewIsPresented = false
                print("dismiss button works")
            } label: {
                DismissButtonView()
            },
            alignment: .topTrailing
        )
        .onTapGesture {
            //we toggle isShowingReverse
            isShowingReverse = true
        }
        .sheet(isPresented: $isShowingReverse, content: {
            ReverseCardView(isShowingReverse: $isShowingReverse)
        })
        //MARK: - Screen name
        

        
        
        
    }
}

struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(name: MockData.sampleUser, viewIsPresented: .constant(true))
    }
}
