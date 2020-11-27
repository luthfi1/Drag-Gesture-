//
//  ContentView.swift
//  DragGestureA
//
//  Created by Muhammad lUTHFI fARIZQI on 21/06/20.
//  Copyright © 2020 LUTHFI FARIZQI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        let drag = DragGesture()
            .onChanged{ gesture in
                self.offset = gesture.translation
        }
        .onEnded {
            value in
            self.offset = CGSize.zero
            self.showMenu = false
        }
        
        return ZStack(){
            Color.orange
                .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("dirgahayu").resizable().frame(width:300, height: 300)
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }){
                        
                        Text("Promo Merdeka")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                }
                
                if self.showMenu {
                    Kupon()
                        .transition(.move(edge: .bottom)).animation(.default)
                        .offset(y:self.offset.height)
                        .gesture(drag)
                }
            }
    }
}


struct Kupon : View {
    var body : some View {
        VStack{
            Text("SELAMAT ANDA MENDAPATKAN POINT 500 PADA PROMO AGUSTUS 2020").font(.largeTitle).bold().foregroundColor(Color.white).padding(50)
        }
            
        .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


