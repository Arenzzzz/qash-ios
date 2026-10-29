import Foundation
import SwiftData

@Model
final class Movimiento {
    var monto: Double
    var nota: String
    var fecha: Date
    var esIngreso: Bool
    
    init(monto: Double, nota: String, fecha: Date, esIngreso: Bool) {
        self.monto = monto
        self.nota = nota
        self.fecha = fecha
        self.esIngreso = esIngreso
    }
}
