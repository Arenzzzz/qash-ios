import Foundation
import SwiftData

@Model
final class Movimiento {
    var monto: Double
    var nota: String
    var fecha: Date
    var esIngreso: Bool
    
    var categoria: Categoria = Categoria.otros
    
    init(monto: Double, nota: String, fecha: Date, esIngreso: Bool, categoria: Categoria) {
        self.monto = monto
        self.nota = nota
        self.fecha = fecha
        self.esIngreso = esIngreso
        self.categoria = categoria
    }
}
