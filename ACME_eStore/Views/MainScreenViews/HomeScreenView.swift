//
//  HomeScreenView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct HomeScreenView: View {
  var body: some View {
    ZStack {
      BackgroundView()
        .padding()
      VStack {
        Text("ACME ").bold()
        Text(" eStore").italic()
      }
      .font(.title)
      .foregroundColor(Color("WelcomeTextColor"))
    }.frame(width: 200, height: 200, alignment: .center)
  }
}


struct BackgroundView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 12.0)
      .strokeBorder(lineWidth: 3)
      .foregroundColor(Color("WelcomeBorderColor"))
  }
}

struct HomeScreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreenView()
  }
}
