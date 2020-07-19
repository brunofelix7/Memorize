import Foundation
import SwiftUI

/*
 ViewModel
 */
class EmojiMemoryGame : ObservableObject {
    //  Apenas essa classe por modificar o model, mais qualquer um pode vela
    //  Sera publicado automaticamente sempre que o modelo for alterado
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //  MARK: Acesso ao model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //  MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        //  Pode chamar em qualquer lugar
        //  Isso vai informar a mudanca no model
        //objectWillChange.send()
        model.choose(card: card)
    }
}
