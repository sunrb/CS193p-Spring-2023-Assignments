//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Rubing on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    var theme1 = ["👻", "😈", "💀", "🎃", "🤡", "😺", "💀", "🕷️", "🐙", "🦋", "🧙‍♀️", "🧚‍♀️"]
    var theme2 = ["🌵", "🎄", "🪴", "🍄", "🌻", "🌾", "💐", "🌷", "🌹", "🥀", "🌺", "🌸"]
    var theme3 = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐨", "🐷", "🐯", "🐸", "🐵", "🐔"]

    @State var emojis = ["👻", "😈", "💀", "🎃", "🤡", "😺", "💀", "🕷️", "🐙", "🦋", "🧙‍♀️", "🧚‍♀️"]
    @State var themeColor = Color.orange
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeSetter
        }
        .padding()
    }
        
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 200))]) {
            ForEach(0 ..< emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(themeColor)
    }
    
    var themeSetter: some View {
        HStack(alignment:.lastTextBaseline, spacing: 50) {
            themeSet(of: "Halloween", symbol: "party.popper.fill")
            themeSet(of: "Plant", symbol: "leaf")
            themeSet(of: "Animal", symbol: "tortoise")
        }
        .imageScale(.large)
    }
    
    func themeSet(of theme: String, symbol: String) -> some View {
        Button(action: {
            switch theme {
            case "Halloween":
                emojis = (theme1 + theme1).shuffled()
                themeColor = Color.orange
            case "Plant":
                emojis = (theme2 + theme2).shuffled()
                themeColor = Color.green
            case "Animal":
                emojis = (theme3 + theme3).shuffled()
                themeColor = Color.yellow
            default:
                emojis = (theme1 + theme1).shuffled()
            }
        }, label: {
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: symbol).font(.title)
                Text(theme).font(.caption)
                }
            })
        }
    }
    
struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
}

#Preview {
    ContentView()
}


//    var halloweenButton: some View {
//        Button {
//            cardCount = theme1.count
//            emojis = theme1.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "lizard").font(.largeTitle)
//                Text("Halloween")
//            }
//        }
//    }
//
//
//    var plantButton: some View {
//        Button {
//            cardCount = theme2.count
//            emojis = theme2.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "leaf").font(.largeTitle)
//                Text("Plant")
//            }
//        }
//    }
//
//
//    var animalButton: some View {
//        Button {
//            cardCount = theme3.count
//            emojis = theme3.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "tortoise").font(.largeTitle)
//                Text("Animal")
//            }
//        }
//    }
