// Lección práctica - Lenguaje de Programación 5
// Formulario de Registro en Flutter - Empresa XYZ

import 'package:flutter/material.dart'; // Librería de widgets Material

// Punto de entrada: Dart ejecuta main() primero
void main() {
  runApp(const MiApp()); // Arranca la aplicación
}

// Widget raíz. Es Stateless porque no cambia con el tiempo
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura la app y la pantalla inicial
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta "debug"
      home: const PantallaRegistro(),    // Pantalla principal
    );
  }
}

// Pantalla del formulario. Es Stateful porque cambia al presionar el botón
class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  // Un controlador por campo: permite leer lo que escribe el usuario
  final TextEditingController ctrlNombre = TextEditingController();
  final TextEditingController ctrlDireccion = TextEditingController();
  final TextEditingController ctrlFecha = TextEditingController();
  final TextEditingController ctrlCargo = TextEditingController();

  String datos = ''; // Aquí se guarda el texto a mostrar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        title: const Text('Empresa XYZ · Registro'),
      ),
      // Permite desplazar la pantalla si el teclado tapa los campos
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        // Column pone los elementos uno debajo del otro
        child: Column(
          children: [
            // Campo 1: nombre completo
            TextField(
              controller: ctrlNombre,
              decoration: const InputDecoration(
                labelText: 'Nombre completo',
                hintText: 'Ej.: Ana María Pérez López',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Espacio entre campos

            // Campo 2: dirección
            TextField(
              controller: ctrlDireccion,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                hintText: 'Ej.: Av. 25 de Julio y Pío Jaramillo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo 3: fecha de nacimiento
            TextField(
              controller: ctrlFecha,
              decoration: const InputDecoration(
                labelText: 'Fecha de nacimiento',
                hintText: 'dd/mm/aaaa',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16),

            // Campo 4: cargo
            TextField(
              controller: ctrlCargo,
              decoration: const InputDecoration(
                labelText: 'Cargo',
                hintText: 'Ej.: Asistente administrativo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Botón "Mostrar datos"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50), // Ancho completo
              ),
              // Al presionar el botón, leemos lo que escribió el usuario
              onPressed: () {
                setState(() { // refresca la pantalla
                  datos = 'Nombre: ${ctrlNombre.text}\n'
                      'Dirección: ${ctrlDireccion.text}\n'
                      'Nacimiento: ${ctrlFecha.text}\n'
                      'Cargo: ${ctrlCargo.text}';
                });
              },
              child: const Text('MOSTRAR DATOS'),
            ),
            const SizedBox(height: 16),

            // Resultado: solo aparece cuando ya hay datos
            if (datos.isNotEmpty)
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('DATOS REGISTRADOS',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(datos), // Muestra el texto armado arriba
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
