import SwiftUI
internal import Combine

struct ContentView: View {
    @State private var score = 0
    @State private var timeLeft = 20
    @State private var gameStarted = false
    @State private var gameOver = false
    
    @State private var targetX: CGFloat = 150
    @State private var targetY: CGFloat = 300
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Clique no Alvo")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                HStack {
                    Text("Pontos: \(score)")
                    Spacer()
                    Text("Tempo: \(timeLeft)")
                }
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
                
                Spacer()
                
                if !gameStarted {
                    Button("Começar") {
                        startGame()
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                }
                
                if gameOver {
                    VStack(spacing: 20) {
                        Text("Fim de jogo!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text("Sua pontuação: \(score)")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        Button("Jogar de novo") {
                            startGame()
                        }
                        .font(.title2)
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Spacer()
            }
            
            if gameStarted && !gameOver {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    .position(x: targetX, y: targetY)
                    .onTapGesture {
                        score += 1
                        moveTarget()
                    }
            }
        }
        .onReceive(timer) { _ in
            if gameStarted && !gameOver {
                if timeLeft > 0 {
                    timeLeft -= 1
                } else {
                    gameOver = true
                    gameStarted = false
                }
            }
        }
    }
    
    func startGame() {
        score = 0
        timeLeft = 20
        gameStarted = true
        gameOver = false
        moveTarget()
    }
    
    func moveTarget() {
        targetX = CGFloat.random(in: 60...330)
        targetY = CGFloat.random(in: 180...700)
    }
}

#Preview {
    ContentView()
}
