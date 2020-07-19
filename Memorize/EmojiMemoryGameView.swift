import SwiftUI

//  ContentView funciona como uma View
struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    /*
     var body -> Em programacao funcional sao propriedades e nao variaveis
     some View -> Qualquer tipo de propriedade, desde que se comporte como uma View
     */
    var body: some View {
        //  Posiciona os componentes na horizontal
        HStack {
            //  Recebe um Array e multiplica das Views pelo size desse Array
            ForEach(viewModel.cards) { card in
                //  Voce precisa inicializar as variaveis declaradas
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)  //  Pode ser chamada em qualquer View
            .font(.largeTitle)
    }
}

//  Podemos criar sctructs separadamente para depois chama-los
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        //  Agrupo os componentes um dentro do outro
        ZStack {
            if card.isFaceUp {
                //  Cria um retangulo na tela
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                //  Exibe um texto na tela
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

//  Necessario para executar minha pre-visualizacao
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel:  EmojiMemoryGame())
    }
}
