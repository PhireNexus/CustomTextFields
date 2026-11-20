//
//  CustomLengthTextField.swift
//  CustomTextField
//
//  Created by Phire Nexus on 20/11/2026.
//

import SwiftUI

struct CustomLengthTextField: View {
     var label: String = ""
     var placeholder: String = ""
     @State var text: String = ""
     @State var maxLength: Int?
     var maxReached: Bool {
          if let maxL = maxLength {
              return text.count >= maxL
          }
          return false
     }
     var body: some View {
          VStack(alignment: .leading) {
               HStack {
                    Text(label)
                    Spacer()
                    if let maxL = maxLength {
                         Text("\(text.count)/\(maxL)")
                              .foregroundStyle(maxReached ? .red : .primary)
                    }
               }
               .padding(.bottom, -5)
               TextField(placeholder, text: $text)
                    .multilineTextAlignment(.leading)
                    .padding(.all, 5)
                    .background(
                         RoundedRectangle(cornerRadius: 5, style: .continuous)
                              .stroke(maxReached ? .red : .gray, lineWidth: 2)
                    )
                    .onChange(of: text, {
                         if let maxL = maxLength {
                              text = String(text.prefix(maxL))
                         }
                    })
          }
     }
}

#Preview {
     CustomLengthTextField(label: "Custom Label", placeholder: "e.g. Placeholder")
}
