import SwiftUI

struct ContentView: View {
     var body: some View {
          ZStack(alignment: .top) {
               Color.clear
                    .ignoresSafeArea()
               VStack {
                    MaxLengthTextField()
                         .padding(.bottom)
                    CustomLengthTextField(label: "Email", placeholder: "e.g. test@email.com", text: "")
                         .padding(.bottom)
                    CustomTextEditor(label: "Write a Review", text: "", maxLength: 250)
               }
               .padding(.horizontal)
          }
     }
}

#Preview {
     ContentView()
}
