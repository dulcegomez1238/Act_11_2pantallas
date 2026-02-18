import 'package:flutter/material.dart';

void main() {
  runApp(const FloreriaFirebase());
}

class FloreriaFirebase extends StatelessWidget {
  const FloreriaFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Florería App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Florería", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.pink[50],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // --- Diseño de Círculo dentro de Círculo ---
            Center(
              child: Container(
                padding: const EdgeInsets.all(8), // Borde exterior
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4), // Espacio blanco interno
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1526047932273-341f2a7631f9?q=80&w=500'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),
            const Text(
              "Catálogo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // --- Lista de 6 Rectángulos Expandibles ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  _crearMenuExpandible("Inicio", ["Bienvenida", "Novedades", "Tendencias"]),
                  _crearMenuExpandible("Ocasiones", ["Cumpleaños", "Aniversarios", "Bodas"]),
                  _crearMenuExpandible("Flores", ["Rosas", "Girasoles", "Lirios"]),
                  _crearMenuExpandible("Empleado", ["Vendedores", "Repartidores", "Diseñadores"]),
                  _crearMenuExpandible("Tienda", ["Ubicaciones", "Horarios", "Contacto"]),
                  _crearMenuExpandible("Ofertas", ["2x1 en Ramos", "Descuento Envío", "Cupones"]),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- Cuadrados con Imágenes ---
            const Text("Destacados", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _cuadradoProducto("https://images.unsplash.com/photo-1548296330-0038065c7078?w=400", "Corazón Chocolate"),
                _cuadradoProducto("https://images.unsplash.com/photo-1519378018457-4c29a0a2efec?w=400", "Flores Varias"),
                _cuadradoProducto("https://images.unsplash.com/photo-1496062031456-07b8f162a322?w=400", "Ramo de Rosas"),
                _cuadradoProducto("https://images.unsplash.com/photo-1588622332275-585bb6910606?w=400", "Tulipanes"),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para crear los rectángulos que se abren (Menú tipo Lista)
  Widget _crearMenuExpandible(String titulo, List<String> subItems) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.pinkAccent),
        children: subItems.map((item) => ListTile(
          title: Text(item),
          onTap: () {
            // Aquí puedes agregar lógica para Firebase
          },
        )).toList(),
      ),
    );
  }

  // Widget para los cuadrados de imágenes
  Widget _cuadradoProducto(String url, String etiqueta) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 3))
        ],
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black87],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(etiqueta, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}