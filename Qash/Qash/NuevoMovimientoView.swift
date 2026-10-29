import SwiftUI

struct NuevoMovimientoView: View {
    @State private var monto = 0.00
    @State private var nota = ""
    @State private var fecha = Date()
    @State private var categoria = Categoria.comida
    
    var body: some View {
        Form {
            // Sección 1: el monto
            Section("Monto") {
                TextField("0.00", value: $monto, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            // Sección 2: la categoría
            Section("Categoría") {
                Picker("Categoría", selection: $categoria) {
                    ForEach(Categoria.allCases, id: \.self) {
                        cat in Label(cat.rawValue, systemImage: cat.icono)
                            .tag(cat)
                    }
                }
            }
            
            // Sección 3: fecha y nota
            Section("Detalles") {
                DatePicker("Fecha", selection: $fecha, displayedComponents:  .date)
                TextField("Nota", text: $nota)
            }
        }
    }
}

#Preview {
    NuevoMovimientoView()
}
