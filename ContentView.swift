
import SwiftUI

struct ContentView: View {
    @State private var precoImovel: String = ""
    @State private var rendaMensal: String = ""
    @State private var despesasAnuais: String = ""

    var rentabilidadeBruta: Double {
        guard let preco = Double(precoImovel),
              let renda = Double(rendaMensal), preco > 0 else { return 0 }
        return (renda * 12) / preco * 100
    }

    var rentabilidadeLiquida: Double {
        guard let preco = Double(precoImovel),
              let renda = Double(rendaMensal),
              let despesas = Double(despesasAnuais), preco > 0 else { return 0 }
        return ((renda * 12) - despesas) / preco * 100
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Rentável")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)

                    Group {
                        TextField("Preço do imóvel (€)", text: $precoImovel)
                        TextField("Renda mensal (€)", text: $rendaMensal)
                        TextField("Despesas anuais (€)", text: $despesasAnuais)
                    }
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                    RentabilidadeBar(titulo: "Rentabilidade Bruta", valor: rentabilidadeBruta)

                    if !despesasAnuais.isEmpty {
                        RentabilidadeBar(titulo: "Rentabilidade Líquida", valor: rentabilidadeLiquida)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Calculadora")
        }
    }
}
