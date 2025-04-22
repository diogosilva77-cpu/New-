
import SwiftUI

struct RentabilidadeBar: View {
    var titulo: String
    var valor: Double

    var cor: Color {
        switch valor {
        case ..<4: return .red
        case 4..<6: return .orange
        default: return .green
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(titulo): \(String(format: "%.2f", valor))%")
                .font(.headline)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    RoundedRectangle(cornerRadius: 5)
                        .fill(cor)
                        .frame(width: min(CGFloat(valor) / 100 * geometry.size.width, geometry.size.width), height: 20)
                        .animation(.easeOut(duration: 0.5), value: valor)
                }
            }
            .frame(height: 20)
        }
        .padding(.horizontal)
    }
}
