import SwiftUI
import SwiftData

@main
struct QashApp: App {
    var sharedModelContainer: ModelContainer = {
        
        // Lista de tablas de la base de datos
        let schema = Schema([
            Movimiento.self
        ])
        // Guarda los datos en el disco del iPhone
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false) // 'true' borraría al cerrar la app
        
        // Crea la base de datos con manejo de errores
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("No se pudo crear 'ModelContainer': \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer) // Comparte la base de datos con todas las pantallas
    }
}
