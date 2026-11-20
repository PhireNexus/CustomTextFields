//
//  CustomerTextEditor.swift
//  CustomTextField
//
//  Created by Phire Nexus on 20/11/2026.
//

import SwiftUI

struct CustomTextEditor: View {
     var label: String = ""
     @State var text: String = ""
     @State var maxLength: Int?
     var maxReached: Bool {
          if let maxL = maxLength {
               return text.count >= maxL
          }
          return false
     }

     var body: some View {
          VStack {
               HStack {
                    Text(label)
                    Spacer()
                    if let maxL = maxLength {
                         Text("\(text.count)/\(maxL)")
                              .foregroundStyle(maxReached ? .red : .primary)
                    }
               }
               .padding(.bottom, -5)
               TextEditor(text: $text)
                    .multilineTextAlignment(.leading)
                    .padding(.all, 5)
                    .frame(height: text.count >= 150 ? 250 : 100)
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
     CustomTextEditor(label: "Text Editor Label")
}
