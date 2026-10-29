import Foundation

enum Categoria: String, Codable, CaseIterable {
    // Gastos
    case comida = "Comida"
    case despensa = "Despensa"
    case salidas = "Salidas"
    case transporte = "Transporte"
    case prestamos = "Préstamos"
    case gustos = "Gustos"
    case otros = "Otros"
    
    // Ingresos
    case salario = "Salario"
    case extras = "Extras"
    
    var icono: String {
        switch self {
        case .comida: return "fork.knife"
        case .despensa: return "cart.fill"
        case .salidas: return "party.popper.fill"
        case .transporte: return "car.fill"
        case .prestamos: return "banknote.fill"
        case .gustos: return "heart.circle"
        case .otros: return "ellipsis"
            
        case .salario: return "briefcase.fill"
        case .extras: return "star.fill"
        }
    }
}
