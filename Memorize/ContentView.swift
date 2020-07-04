import SwiftUI

//  ContentView funciona como uma View
struct ContentView: View {
    
    /*
     var body -> Em programacao funcional sao propriedades e nao variaveis
     some View -> Qualquer tipo de propriedade, desde que se comporte como uma View
     */
    var body: some View {
        //  Posiciona os componentes na horizontal
        HStack {
            //  Recebe um Array e multiplica das Views pelo size desse Array
            ForEach(0..<4) { index in
                //  Voce precisa inicializar as variaveis declaradas
                CardView(isFaceUp: false)
            }
        }
            .padding()
            .foregroundColor(Color.orange)  //  Pode ser chamada em qualquer View
            .font(.largeTitle)
    }
}

//  Podemos criar sctructs separadamente para depois chama-los
struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        //  Agrupo os componentes um dentro do outro
        ZStack {
            if isFaceUp {
                //  Cria um retangulo na tela
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                //  Exibe um texto na tela
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

//  Necessario para executar minha pre-visualizacao
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
