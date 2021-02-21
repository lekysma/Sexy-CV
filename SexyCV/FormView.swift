//
//  FormView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 19/02/2021.
//

import SwiftUI

struct FormView: View {
//    @State var firstName: String = ""
//    @State var lastName: String = ""
//    @State var email: String = ""
//    @State var currentJobTitle: String = ""

//    @State var age: String = "0"
    @State var skill: String = ""
    @State var user: User
//    @State var arrayOfSkills: [String] = [String]()
    var columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State var viewIsPresented = false
    @State var alertItem: AlertItem?
    
    
    var body: some View {
        VStack {
            
            Form {
                //MARK: - SECTION 1 : ID & contact
                //first name
                //last name
                //email
                //phone
                Section(header: Text("ID & Contact")) {
                    TextField("First Name", text: $user.firstName)
                    TextField("Last Name", text: $user.lastName)
                    TextField("Email Address", text: $user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                }
                //MARK: SECTION 2 : DATE OF BIRTH
                Section(header: Text("Age")) {
                    TextField("Your Age", text: $user.age)
                }
                //MARK: - SECTION 2 : current / desired job title
                //this should be a text field
                Section(header: Text("Current Job Title")) {
                    TextField("Your current Job", text: $user.jobTitle)
                }
                
                //MARK: - SECTION 3 relevant skills /
                //one should type the most important skills
                //it will be in a grid view
                Section(header: Text("Most Relevant Skills")) {
                    HStack {
                        TextField("Maximum 6", text: $skill)
                        Button {
                            //everytime we type, we add the skill to the array of skills
                            //addNewSkill()
                            //if we type an empty skill, we trigger an alert
                            if skill == "" {
                                alertItem = AlertContext.emptySkill
                            } else {
                                //everytime we type, we add the skill to the array of skills
                                addNewSkill()
                            }
                            
                        } label: {
                            Text("Add")
                                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                        }
                    }
                    
                    LazyVGrid(columns: columns) {
                        ForEach(user.skills, id: \.self) {newSkill in
                            SkillView(skill: newSkill)
                                
                        }
                        .padding()
                        
                    }
                    .padding()
                }
                
               
            }//form end
            //blur the view if detail view is active
            .blur(radius: viewIsPresented == true ? 20 : 0)
            .sheet(isPresented: $viewIsPresented) {
                BusinessCardView(name: user, viewIsPresented: $viewIsPresented)
            }
            
            
            //MARK: - Form validation
            Button {
                //if one field is empty
                if user.firstName.isEmpty || user.lastName.isEmpty || user.email.isEmpty || user.jobTitle.isEmpty {
                    // we trigger the alert
                    alertItem = AlertContext.emptyField
                } else {
                    //we toggle the view is presented
                    viewIsPresented.toggle()
                    
                }
                
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                    .cornerRadius(10)
            }
            //blur the view if detail view is active
            .blur(radius: viewIsPresented == true ? 20 : 0)
            

            
            
            
            
                
        } //vstack end
        .navigationTitle("📄 Build your CV")
        .alert(item: $alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                
        }
        //let's add a reset button
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //we call the reset function here
                    resetValues()
                } label: {
                    Text("Reset Form")
                }
            }
        }
        //when the view appears, the form has to be empty
        .onAppear(perform: {
            resetValues()
        })
        
//        if viewIsPresented {
//            BusinessCardView(name: user)
//        }
        

       
        
    }

    
    //MARK: FUNCTION TO ADD NEW SKILL
    func addNewSkill() {
        var newlyCreatedTask: String = ""
        newlyCreatedTask = skill
//        arrayOfSkills.append(newlyCreatedTask)
        user.skills.append(newlyCreatedTask)
        //then in order to erase what we just typed
        skill = ""
        print("\(newlyCreatedTask) added successfully")
        
        
    }
    
    //MARK: - A function that resets every value once the save button is tapped
    func resetValues() {
        user.firstName = ""
        user.lastName = ""
        user.email = ""
        user.age = ""
        user.jobTitle = ""
//        arrayOfSkills = [String]()
        user.skills = [String]()
    }
    
    //a function that handles the alert
    func alertHandling() {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.jobTitle.isEmpty else {
            alertItem = AlertContext.emptyField
            return
        }
        
    }
    


}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(user: MockData.sampleUser)
    }
}

//MARK: Possible way to build a more elegant form
//struct ContentView: View {
//@State var entries = [
//    "First name": "",
//    "Last name": "",
//    "Email": "",
//    "Phone": ""
//] //dictionary of the entires by title and their value
//
//var body: some View {
//    Form {
//        TextInput(key: "First name", entries: $entries) //create a TextInput view with a given key and pass all the entries so it can track the value
//
//        TextInput(key: "Last name", entries: $entries)
//
//        TextInput(key: "Email", entries: $entries)
//    }
//}
//}
//
//struct TextInput: View {
//
//let key: String //key for the dictionary
//@State var value = "" //value to set the contents to
//@Binding var entries: [String : String] //all the entries
//
//var body: some View {
//    TextField(key, text: $value)
//        .onAppear(perform: {value = entries[key] ?? "" }) //when the view appears, set its value to the value inside the dictionary
//    Text("(value)") //display the value of the text input
//}
//}

