//
//  ReverseCardView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 20/02/2021.
//

import SwiftUI

struct ReverseCardView: View {
    @Binding var isShowingReverse: Bool
    var imagesArray = ["mask1", "mask2", "mask3", "mask4", "mask5", "mask6"]
    @State var randomNumber = 0
    //2 variables that handles the safari view display for each link
    @State var isShowingLinkView = false
//    @State var isShowingLink2 = false
    @State var selectedLink : CreditLinks = CreditLinks.background
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack(spacing: 30) {
                //we have a central picture
                Image(imagesArray[randomNumber])
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Spacer()
                //then in another vstack:
                VStack(alignment: .leading) {
                    
                    Text("Credits")
                        .font(.title).bold()
                    // an hstack with credits + author name and button to link
                    HStack {
                        Text("Images: Daniel Pozuelo")
                            .font(.title2)
                        
                        Spacer()
                        Button {
                            //we change the value of the link1
                            isShowingLinkView.toggle()
                            selectedLink = CreditLinks.images
                        } label: {
                            Text("Profile")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }//hstack end
                    
                    // an hstack with credits + author name and button to link
                    HStack(spacing: 20) {
                        Text("Background: Rodion Kutsaev")
                            .font(.title2)
                        Spacer()
                        Button {
                            //we change the value of the link2
                            isShowingLinkView.toggle()
                            selectedLink = CreditLinks.background
                        } label: {
                            Text("Profile")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }//hstack end
                }//second vstack end
                .padding()
                
            } //vstack end
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 385)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "background2"))
                    .resizable()
                    .aspectRatio(contentMode: .fill
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black,
                    radius: 20,
                    x: 0,
                    y: 10)
            
            Spacer()
           
        } //global vstack end
        .onTapGesture {
            isShowingReverse = false
        }
        //when the view appears, triggers the random number
        .onAppear(perform: {
            randomNumberGenerator()
        })
        // we handle the appearance of the fist link
        .sheet(isPresented: $isShowingLinkView, content: {
            if selectedLink == CreditLinks.images {
                SafaryView(url: URL(string: "https://www.behance.net/choke") ?? URL(string: "https://google.com")!)
            } else {
                SafaryView(url: URL(string: "https://unsplash.com/@frostroomhead") ?? URL(string: "https://google.com")!)
            }
        })
       
        
        
    }
    
    //MARK: - Function to provide random numbers
    func randomNumberGenerator() {
        self.randomNumber = Int.random(in: 0..<imagesArray.count)
    }
}

struct ReverseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReverseCardView(isShowingReverse: .constant(true))
    }
}
