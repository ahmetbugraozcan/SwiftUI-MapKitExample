//
//  ContentView.swift
//  MapKitExample
//
//  Created by Ahmet Buğra Özcan on 18.11.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Group{
                    HStack{
                        TextField("Enter City", text: $viewModel.cityText)
                        Image(systemName: "xmark.circle.fill").onTapGesture{
                            viewModel.clearCityText()
                        }
                    }.padding(.bottom)
                    Button(action: {
                        viewModel.searchForCity()
                    }){
                        Text("Search").frame(maxWidth: .infinity).padding(.all, 8).background(Color(red: 0, green: 0, blue: 0.8)).clipShape(Capsule()).foregroundColor(.white)
                    }
                    HStack{
                        VStack{
                            Divider()
                        }
                        Text("OR").font(.caption)
                        VStack{
                            Divider()
                        }
                    }.padding(.vertical)
                    
                    HStack{
                        TextField("Enter Point of interest name", text: $viewModel.poiText)
                        Image(systemName: "xmark.circle.fill").onTapGesture{
                            viewModel.clearPOIText()
                        }
                    }.padding(.bottom)
                    Button(action: {
                        viewModel.searchForPOI()
                    }){
                        Text("Search").frame(maxWidth: .infinity).padding(.all, 8).background(Color(red: 0, green: 0, blue: 0.8)).clipShape(Capsule()).foregroundColor(.white)
                        
                    }
                    Divider()
                    Text("Results").font(.title)
                }.padding(.horizontal)
                List(viewModel.viewData){item in
                    NavigationLink(destination: MapKitView(place: item)){
                        VStack(alignment: .leading){
                            Text(item.title)
                            Text(item.subtitle).foregroundColor(.secondary)
                            
                        }
                    }
                }
            }.padding(.top).ignoresSafeArea(edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
