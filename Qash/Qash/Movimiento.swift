import Foundation
import SwiftData

@Model
final class Movimiento {
    var monto: Double
    var nota: String
    var fecha: Date
    
    var categoria: Categoria = Categoria.otros
    var esIngreso: Bool {categoria.esIngreso}
    
    init(monto: Double, nota: String, fecha: Date, categoria: Categoria) {
        self.monto = monto
        self.nota = nota
        self.fecha = fecha
        self.categoria = categoria
    }
}
