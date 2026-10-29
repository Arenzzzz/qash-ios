import SwiftUI  // Dibuja la interfaz
import SwiftData    // Conexión de datos

// --- PANTALLA ---
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext // Conexión a la base de datos
    @Query private var movimientos: [Movimiento] // Trae automáticamente todos los movimientos

    // --- DIBUJO EN PANTALLA ---
    var body: some View {
        NavigationSplitView {
            // 
            List {
                ForEach(movimientos) { movimiento in
                    HStack {
                        Image(systemName: movimiento.categoria.icono)
                        Text(movimiento.categoria.rawValue)
                        Spacer()
                        Text(movimiento.monto, format: .currency(code: "GTQ"))
                            .foregroundStyle(movimiento.esIngreso ? .green : .red)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newMovimiento = Movimiento(monto: 3000.00, nota: "Sueldo", fecha: Date(), esIngreso: true, categoria: .salario)
            modelContext.insert(newMovimiento)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movimientos[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movimiento.self, inMemory: true)
}
