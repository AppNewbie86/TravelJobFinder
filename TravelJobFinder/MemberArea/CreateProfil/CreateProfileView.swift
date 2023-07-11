
import SwiftUI

struct CreateProfileView: View {
    
    // Observable-Object-Klasse zur Verwaltung des App-Status
    @StateObject var memberDataViewModel = MemberDataViewModel()
    
    // Variablen wo wir halten wollen den Wert
    
    @State private var firstNameText: String = ""
    @State private var lastNameText: String = ""
    @State private var emailText: String = ""
    @State private var ageText: String = ""
    @State private var phoneNumberText: String = ""
    
    @State private var addressText: String = ""
    @State private var cityText: String = ""
    @State private var zipCodeText: String = ""
    @State private var countryText: String = ""
    @State private var passportNumberText: String = ""
    @State private var passportExpirationDateText: String = ""
    
    @State private var CreatedMemberViewIsShowing = false
    
    var body: some View {
        ZStack {
            
            Image("memberimage")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white.opacity(0.75))
                .contrast(0.1)
                .offset(x: -0)
                .opacity(01.05)
            
            // ScrollView mit Texteingabefeldern
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 16) {
                    Text("Profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading, spacing: 16) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.75))
                                .frame(width: 370, height: 370) // hier die Breite reduzieren
                                .shadow(radius: 10)
                                .overlay(
                                    VStack(alignment: .center, spacing: 16) {
                                        Text("Personendaten")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Divider()
                                        HStack {
                                            Text("Vorname:")
                                                .foregroundColor(.black)
                                            TextField("Vorname", text: $firstNameText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                        }
                                        HStack {
                                            Text("Nachname:")
                                                .foregroundColor(.black)
                                            TextField("Nachname", text: $lastNameText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                        }
                                        HStack {
                                            Text("E-Mail:")
                                                .foregroundColor(.black)
                                            TextField("E-Mail", text: $emailText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                        }
                                        HStack {
                                            Text("Alter:")
                                                .foregroundColor(.black)
                                            TextField("Alter", text: $ageText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                        }
                                        HStack {
                                            Text("Telefonnummer:")
                                                .foregroundColor(.black)
                                            TextField("Telefonnummer", text: $phoneNumberText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)

                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    .multilineTextAlignment(.center)
                                )
                        
                            RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.75))
                                .frame(width: 370, height: 370) // hier die Breite reduzieren
                                .shadow(radius: 14)
                                .overlay(
                                    VStack(alignment: .center, spacing: 10) {
                                        Text("Reiseinformationsdaten")
                                            .padding()
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        VStack(alignment: .center, spacing: 10) {
                                            HStack {
                                                Text("Adresse:")
                                                    .foregroundColor(.black)
                                                TextField("Adresse", text: $addressText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                            }
                                            HStack {
                                                Text("Stadt:")
                                                    .foregroundColor(.black)
                                                TextField("Stadt", text: $cityText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                            }
                                            HStack {
                                                Text("Postleitzahl:")
                                                    .foregroundColor(.black)
                                                TextField("Postleitzahl", text: $zipCodeText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                            }
                                            HStack {
                                                Text("Land:")
                                                    .foregroundColor(.black)
                                                TextField("Land", text: $countryText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)

                                            }
                                            HStack {
                                                Text("Passnummer:")
                                                    .foregroundColor(.black)
                                                TextField("Passnummer", text: $passportNumberText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)


                                            }
                                            HStack {
                                                Text("Pass-Ablaufdatum:")
                                            .foregroundColor(.black)
                                                TextField("Pass-Ablaufdatum", text: $passportExpirationDateText)
                                            .background(Color.white.opacity(0.7))
                                            .cornerRadius(3)

                                            }
                                        }
                                        Spacer()
                                        Button {
                                            CreatedMemberViewIsShowing = true
                                            
                                            // Überprüfung, ob alle Felder ausgefüllt wurden
                                            guard !firstNameText.isEmpty, !lastNameText.isEmpty, !emailText.isEmpty, !ageText.isEmpty, !phoneNumberText.isEmpty, !addressText.isEmpty, !cityText.isEmpty, !zipCodeText.isEmpty, !countryText.isEmpty else { return }
                                            // Aufruf der addNewMember-Funktion des ViewModel, um ein neues Profil hinzuzufügen
                                            memberDataViewModel.addNewMember("\(firstNameText) \(lastNameText), \(ageText), \(emailText), \(phoneNumberText), \(addressText), \(cityText), \(zipCodeText), \(countryText)")
                                            // Zurücksetzen der Eingabefelder
                                            firstNameText = ""
                                            lastNameText = ""
                                            emailText = ""
                                            ageText = ""
                                            phoneNumberText = ""
                                            addressText = ""
                                            cityText = ""
                                            zipCodeText = ""
                                            countryText = ""
                                            passportNumberText = ""
                                            passportExpirationDateText = ""
                                        } label: {
                                            Text("Complete User Profil ")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                //.frame(height: 60)
                                                .frame(width: 200, height: 45)
                                                .background(Color(
                                                    red: 75 / 255,
                                                    green: 115 / 255,
                                                    blue: 115 / 255
                                                ))
                                                .cornerRadius(10)
                                                .padding(.horizontal, 20)
                                        }
                                    }.sheet(isPresented: $CreatedMemberViewIsShowing) {
                                        // Anzeige des MemberData-Sheets
                                        CreatedMemberView(CreatedMemberViewIsShowing: $CreatedMemberViewIsShowing, memberDataViewModel: memberDataViewModel)
                                            .padding()
                                    }.padding()
                                    

                                    
                              )}.multilineTextAlignment(.center)

                        Spacer()

                        }
                    }
                    
                }
            }
        }
   
struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}



import SwiftUI

struct CreatedMemberView: View {
    @Binding var CreatedMemberViewIsShowing : Bool
    @ObservedObject var memberDataViewModel: MemberDataViewModel
    @State var isShowing: Bool = false

//    @State private var showingImagePicker = false
//        @State private var selectedImage: UIImage?
        

    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.white,.white,.white], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            // Hintergrundbildansicht
            Image("Strandbild")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                Image("surfen")
                    .resizable()
                    .frame(width: 400, height: 250)
                
                NavigationView {
                    List {
                        // Anzeige aller gespeicherten Benutzerdaten
                        ForEach(memberDataViewModel.savedUserDaten) { data in
                            HStack {
                                Image(systemName: data.done ? "checkmark.circle.fill" : "checkmark.circle")
                                Text(data.desc ?? "No description")
                                    .strikethrough(data.done)
                                    .foregroundColor(.black)
                                Spacer()
                                Button(action: {
                                    memberDataViewModel.updateMemberData(MemberData: data)
                                }) {
                                    Text(data.done ? "Undo" : "Done")
                                        .foregroundColor(.black)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                    .navigationTitle("Member Data")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                CreatedMemberViewIsShowing = false
                            }) {
                                Text("Close")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
            }.background(Color.white)
        }
    }
}


import SwiftUI
   import PhotosUI
   struct CircleImage: Identifiable {
       let id: UUID = UUID()
       let image: Image
       var circleView: some View {
           image
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(width: 100, height: 100)
               .clipShape(Circle())
               .overlay(Circle().stroke(.primary, lineWidth: 2))
               .padding(2)
               .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
               .shadow(radius: 3)
               .padding(4)
       }
   }
   struct MemberImageView: View {
       @State var items: [PhotosPickerItem] = []
       @State var images: [CircleImage] = []
       @State var loadingCount = 0
       var body: some View {
           ZStack {
               Color.black
                   .ignoresSafeArea(.all)
               VStack {
                   HStack {
                       if loadingCount == 0 {
                           PhotosPicker("Select Images",
                                        selection: $items,
                                        maxSelectionCount: 4,
                                        selectionBehavior: .ordered,
                                        matching: .images,
                                        preferredItemEncoding: .automatic)
                           .foregroundColor(.white)
                       } else {
                           Text("loading images...")
                       }
                   }
                   HStack {
                       ForEach(images) {
                           $0.circleView
                       }
                   }
                   .onChange(of: items) { pickerItems in
                       images = []
                       for item in pickerItems {
                           loadItem(item: item)
                       }
                   }
               }
           }
       }
       func loadItem(item: PhotosPickerItem) {
           loadingCount += 1
           item.loadTransferable(type: Data.self) { result in
               DispatchQueue.main.async {
                   switch result {
                       case .success(let imageData?):
                           #if os(macOS)
                           if let nsImage = NSImage(data: imageData) {
                               images.append(CircleImage(image: Image(nsImage: nsImage)))
                           }
                           #else
                           if let uiImage = UIImage(data: imageData) {
                               images.append(CircleImage(image: Image(uiImage: uiImage)))
                           }
                           #endif
                           loadingCount -= 1
                       case .success(nil):
                           print("image == nil")
                           loadingCount -= 1
                       case .failure(let error):
                           print("Error loading image: \(error)")
                           loadingCount -= 1
                   }
               }
           }
       }
   }

struct Previews_MemberImageView_Previews: PreviewProvider {
    static var previews: some View {
    MemberImageView()
    }
}
