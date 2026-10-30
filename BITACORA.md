# Bitácora de desarrollo: Qash

Registro de cada sesión de trabajo en **Qash**, app de finanzas personales para iPhone hecha con SwiftUI y SwiftData.

Cada entrada incluye qué se hizo, qué problemas surgieron y qué queda pendiente.

---

## Sesión 1: planificación y repositorio
**Fecha:** 24/10/2026

### Qué se hizo
- Se definió el proyecto: app nativa de iOS con registro de ingresos y gastos, presupuesto mensual, gráficas y metas de ahorro.
- Se eligió el nombre **Qash**: la **Q** del quetzal + *cash*. Eslogan: *"Tu Q, bajo control."*
- Se instaló la GitHub CLI (`gh`) y se creó el repositorio `qash-ios` desde la terminal.
- Se clonó el repo en `~/Developer/qash-ios`.
- Se crearon `.gitignore` y `README.md` y se hizo el primer commit.

### Problemas
- **`warning: You appear to have cloned an empty repository`:** no era un error; el repo estaba vacío a propósito.
- **La terminal se quedó en `dquote>`:** faltó cerrar las comillas del mensaje de commit. Se canceló con `Control + C`.

---

## Sesión 2: proyecto en Xcode
**Fecha:** 28/10/2026

### Qué se hizo
- Se instaló Xcode 27.1.
- Se creó el proyecto **Qash** (iOS → App, SwiftUI, SwiftData) dentro de la carpeta del repo.
- Se subió el proyecto a GitHub.

### Problemas
- **`warning: adding embedded git repository`:** Xcode creó su propio repo Git dentro de `Qash/`. Se resolvió con `git rm --cached -f Qash` y `rm -rf Qash/.git`.
- **El repo interno seguía ahí:** se había escrito `Qash/.gt` en lugar de `Qash/.git`.
- **iOS 27.1 no se descargaba** (*general networking error*): la red bloqueaba los servidores de Apple. Se descargó desde otra red con `xcodebuild -downloadPlatform iOS`.

---

## Sesión 3: modelos, lista y formulario
**Fecha:** 29/10/2026

### Qué se hizo
- Se estudió el código de ejemplo que genera Xcode.
- Se creó el modelo **`Movimiento`** (monto, nota, fecha, categoría) y se registró en el `Schema`.
- Se creó el enum **`Categoria`** con 10 categorías e íconos de SF Symbols.
- Se reemplazó el modelo de ejemplo `Item` por `Movimiento` y se borró `Item.swift`.
- Se movió `esIngreso` de `Movimiento` a `Categoria` (fuente única de verdad), para que sea imposible guardar datos contradictorios como un "ingreso de comida".
- La lista muestra ícono, categoría y monto en quetzales, en verde (ingreso) o rojo (gasto).
- Se creó el formulario **`NuevoMovimientoView`**, que se abre con el botón **+**:
  - Selector Gasto / Ingreso que filtra las categorías.
  - Campos de monto, categoría, fecha y nota.
  - Botones Cancelar y Guardar; Guardar se desactiva si el monto es cero o negativo.

### Problemas
- **El monto se veía como `Q35.000000`:** se usó `Text(monto, format: .currency(code: "GTQ"))`.
- **Al cambiar a Ingreso, la categoría quedaba en blanco:** seguía valiendo `.comida`. Se resolvió con `.onChange` para reiniciarla.
- **`Button(action: mostrandoFormulario)` no compilaba:** `action:` espera una función, no un `Bool`.
- **`Cannot convert 'Binding<Double>' to 'Double'`:** se usó `$monto` para leer el valor; va sin `$`.
- **Errores que no desaparecían en Xcode:** eran de mientras se escribía; se limpiaron compilando con `⌘B`.

### Pendiente para la próxima sesión
- Ordenar la lista por fecha, con el más reciente primero.
- Mostrar la nota y la fecha en cada fila.
- Etapa 3: resumen del mes y gráficas.

---

<!--
Plantilla para nuevas sesiones:

## Sesión N: título
**Fecha:** DD/MM/AAAA

### Qué se hizo
-

### Problemas
-

### Pendiente para la próxima sesión
-
-->
