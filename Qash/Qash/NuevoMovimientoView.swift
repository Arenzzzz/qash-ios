import SwiftUI
import SwiftData

struct NuevoMovimientoView: View {
    @State private var monto = 0.00
    @State private var nota = ""
    @State private var fecha = Date()
    @State private var categoria = Categoria.comida
    @State private var esIngreso = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            Form {
                // Sección 0: tipo de movimiento
                Section("Tipo") {
                    Picker("Tipo", selection: $esIngreso) {
                        Text("Gasto").tag(false)
                        Text("Ingreso").tag(true)
                    }
                    .pickerStyle(.segmented)
                }
                
                // Sección 1: el monto
                Section("Monto") {
                    TextField("0.00", value: $monto, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                // Sección 2: la categoría
                Section("Categoría") {
                    Picker("Categoría", selection: $categoria) {
                        ForEach(Categoria.allCases.filter {$0.esIngreso == esIngreso}, id: \.self) {
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
            .navigationTitle("Nuevo Movimiento") // Título
            .navigationBarTitleDisplayMode(.inline) // Título centrado y pequeño
            
            // Botón de cancelar
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        guardar()
                    }
                    .disabled(monto <= 0)
                }
            }
            
            // Salto de categoría en cambio de tipo de movimiento
            .onChange(of: esIngreso) { _, nuevoValor in
                categoria = nuevoValor ? .salario : .comida
            }
        }
    }
    
    private func guardar() {
        withAnimation {
            let newMovimiento = Movimiento(monto: monto, nota: nota, fecha: fecha, categoria: categoria)
            modelContext.insert(newMovimiento)
            dismiss()
        }
    }
}

#Preview {
    NuevoMovimientoView()
}
