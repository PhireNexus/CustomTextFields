//
//  MaxLengthTextField.swift
//  CustomTextField
//
//  Created by Phire Nexus on 20/11/2026.
//

import SwiftUI

struct MaxLengthTextField: View {
     @State private var text: String = ""
     private var maxLength: Int = 5
     var body: some View {
          Text("On Change")
          TextField("", text: $text)
               .multilineTextAlignment(.leading)
               .frame(width: 240)
               .padding(.all, 8)
               .background(RoundedRectangle(cornerRadius: 4).stroke(.gray, lineWidth: 2))
               .onChange(of: text, {
                    text = String(text.prefix(maxLength))
               })
     }
}

#Preview {
     MaxLengthTextField()
}

