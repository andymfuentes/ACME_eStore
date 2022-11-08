//
//  HomeScreenView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct HomeScreenView: View {
  var body: some View {
    ZStack{
      BackgroundView()
        .padding()
      VStack{
        Text("ACME ").bold()
        Text(" eStore").italic()
      }
      .font(.title)
      .foregroundColor(Color("WelcomeTextColor"))
    }
  }
}

struct HomeScreenView_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreenView()
  }
}
