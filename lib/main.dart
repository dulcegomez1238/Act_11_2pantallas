import 'package:flutter/material.dart';

void main() {
  runApp(const FloreriaApp());
}

class FloreriaApp extends StatelessWidget {
  const FloreriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Florería',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const FloreriaHome(),
    );
  }
}

class FloreriaHome extends StatelessWidget {
  const FloreriaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Florería"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // --- Círculo dentro de círculo con imagen ---
            Center(
              child: Container(
                padding: const EdgeInsets.all(10), // Espacio para el círculo exterior
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent, // Color del círculo exterior
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  // Imagen de Ramos de Flores
                  backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1526047932273-341f2a7631f9?q=80&w=500'),
                ),
              ),
            ),

            const SizedBox(height: 15),
            const Text(
              "Catálogo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(),

            // --- Lista de 6 Rectángulos (Menús desplegables) ---
            _buildExpansionMenu("Inicio"),
            _buildExpansionMenu("Ocasiones"),
            _buildExpansionMenu("Flores"),
            _buildExpansionMenu("Empleado"),
            _buildExpansionMenu("Tienda"),
            _buildExpansionMenu("Ofertas"),

            const SizedBox(height: 20),

            // --- Cuadrícula de 4 imágenes (Productos) ---
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true, // Importante para que funcione dentro de un Column
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildProductCard("Corazón de Chocolate", "https://images.unsplash.com/photo-1599599810769-bcde5a160d32?q=80&w=500"),
                  _buildProductCard("Flores Variadas", "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?q=80&w=500"),
                  _buildProductCard("Ramo de Rosas", "https://images.unsplash.com/photo-1561542320-9a18cd340469?q=80&w=500"),
                  _buildProductCard("Tulipanes", "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=500"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear los rectángulos con flechita y sub-opciones
  Widget _buildExpansionMenu(String titulo) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ExpansionTile(
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),
        children: [
          ListTile(title: Text("Opción 1 de $titulo"), onTap: () {}),
          ListTile(title: Text("Opción 2 de $titulo"), onTap: () {}),
        ],
      ),
    );
  }

  // Widget para las 4 imágenes cuadradas
  Widget _buildProductCard(String nombre, String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Text(
          nombre,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}