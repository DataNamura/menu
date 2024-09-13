import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Botavara',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.lightBlueAccent,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue[900],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lobster', // Usar Lobster en el título del AppBar
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Roboto', // Usar Roboto para el cuerpo del texto
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto', // Usar Roboto para el cuerpo del texto
          ),
        ),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _pizzasClasicasKey = GlobalKey();
  final GlobalKey _pizzasEspecialesKey = GlobalKey();
  final GlobalKey _focacciaKey = GlobalKey();
  final GlobalKey _calzonesKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpg', // Asegúrate de que la ruta sea correcta
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            const Text('La Botavara'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.jpg', // Asegúrate de que la ruta sea correcta
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'La Botavara',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.local_pizza),
              title: const Text('Pizzas Clásicas'),
              onTap: () => _scrollToSection(_pizzasClasicasKey),
            ),
            ListTile(
              leading: const Icon(Icons.local_pizza_outlined),
              title: const Text('Pizzas Especiales'),
              onTap: () => _scrollToSection(_pizzasEspecialesKey),
            ),
            ListTile(
              leading: const Icon(Icons.bakery_dining),
              title: const Text('Focaccia'),
              onTap: () => _scrollToSection(_focacciaKey),
            ),
            ListTile(
              leading: const Icon(Icons.dinner_dining),
              title: const Text('Calzones'),
              onTap: () => _scrollToSection(_calzonesKey),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Pizzas Clásicas Section
              SectionTitle(key: _pizzasClasicasKey, title: 'PIZZAS CLÁSICAS'),
              const Divider(thickness: 2, color: Colors.grey),
              const MenuItem(
                title: 'Marinara',
                description: 'Tomate, ajo y orégano.',
                price: '€5,50',
              ),
              const MenuItem(
                title: 'Margarita',
                description: 'Tomate y mozzarella.',
                price: '€7,50',
              ),
              const MenuItem(
                title: 'Jamon',
                description: 'Tomate, mozzarella y jamón cocido.',
                price: '€8,00',
              ),
              const MenuItem(
                title: 'Napolitana',
                description:
                    'Tomate, mozzarella, anchoa, alcaparras y orégano.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Diavola',
                description: 'Tomate, mozzarella y salame picante.',
                price: '€8,00',
              ),
              const MenuItem(
                title: 'Atún',
                description: 'Tomate, mozzarella y atún.',
                price: '€8,00',
              ),
              const MenuItem(
                title: 'Serrano',
                description: 'Tomate, mozzarella y jamón serrano.',
                price: '€8,50',
              ),
              const MenuItem(
                title: 'Hawaiana',
                description:
                    'Tomate, mozzarella, jamón cocido, piña y cerezas.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Regina',
                description: 'Tomate, mozzarella, jamón cocido y champiñones.',
                price: '€8,50',
              ),
              const MenuItem(
                title: 'Cuatro Quesos',
                description: 'Tomate, mozzarella y mix de quesos.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Atún y Cebolla',
                description: 'Tomate, mozzarella, atún y cebolla.',
                price: '€8,50',
              ),
              const MenuItem(
                title: 'Cuatro Estaciones',
                description:
                    'Tomate, mozzarella, jamón cocido, alcachofas y aceitunas negras.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Vegetariana',
                description:
                    'Tomate, mozzarella, cebolla, champiñones, calabacín, pimiento y berenjena.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Barbacoa',
                description: 'Tomate, mozzarella, pollo y salsa barbacoa.',
                price: '€9,50',
              ),

              // Pizzas Especiales Section
              SectionTitle(
                  key: _pizzasEspecialesKey, title: 'PIZZAS ESPECIALES'),
              const Divider(thickness: 2, color: Colors.grey),
              const MenuItem(
                title: 'Lamigna',
                description:
                    'Tomate, mozzarella, mix de quesos, bacon y rúcula.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Bahía',
                description: 'Tomate, mozzarella, atún y jamón.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Carbonara',
                description: 'Mozzarella, bechamel, bacon y cebolla.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Mediterránea',
                description:
                    'Tomate, mozzarella, serrano, rúcula, calabacín y berenjena.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Marinera',
                description: 'Tomate, mozzarella, atún y gambas.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Hermano Pedro',
                description:
                    'Tomate, mozzarella, mix de quesos, nueces, rúcula y miel.',
                price: '€10,00',
              ),
              const MenuItem(
                title: 'Tricolore',
                description:
                    'Tomate, mozzarella, tomate cherry, gotas de pesto, rúcula y parmesano.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Puttanesca',
                description:
                    'Tomate, mozzarella, alcaparras, anchoas, aceitunas negras y aceite picante.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Vulcano',
                description: 'Tomate, mozzarella, berenjena y parmesano.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Bufalina',
                description: 'Tomate y mozzarella de búfala.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Bismark',
                description:
                    'Tomate, mozzarella, jamón cocido, huevo, ajo y orégano.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Marsigliese',
                description:
                    'Tomate, mozzarella, chorizo picante, pimientos y aceitunas negras.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Veneciana',
                description:
                    'Tomate, mozzarella, salchicha fresca, champiñones y calabacín.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'Sofisticada',
                description:
                    'Tomate, mozzarella, huevo, crema de trufa y serrano.',
                price: '€10,00',
              ),
              const MenuItem(
                title: 'Drago',
                description:
                    'Tomate, mozzarella, chorizo picante, alcaparras, aceitunas negras, anchoas y queso de cabra.',
                price: '€11,00',
              ),
              const MenuItem(
                title: 'Teide',
                description:
                    'Tomate, mozzarella, queso de cabra, serrano y miel.',
                price: '€11,00',
              ),

              // Focaccia Section
              SectionTitle(key: _focacciaKey, title: 'FOCACCIA'),
              const Divider(thickness: 2, color: Colors.grey),
              const MenuItem(
                title: 'Focaccia al Ajo',
                description: 'Tomate y ajo.',
                price: '€4,50',
              ),
              const MenuItem(
                title: 'Focaccia Tomate Fresco',
                description: 'Tomate fresco, mozzarella y ajo.',
                price: '€5,50',
              ),
              const MenuItem(
                title: 'Focaccia Bomba',
                description: 'Mozzarella, bacon, requesón y pimienta negra.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Focaccia Vegetariana',
                description:
                    'Calabacín, berenjena, champiñones, pimientos, cebolla, tomate fresco, alcachofas y aceitunas negras.',
                price: '€11,00',
              ),
              const MenuItem(
                title: 'Focaccia Botavara',
                description: 'Tomate, rúcula, serrano y burrata.',
                price: '€12,00',
              ),

              // Calzones Section
              SectionTitle(key: _calzonesKey, title: 'CALZONES'),
              const Divider(thickness: 2, color: Colors.grey),
              const MenuItem(
                title: 'Clásico',
                description: 'Tomate, mozzarella, jamón cocido y champiñones.',
                price: '€9,00',
              ),
              const MenuItem(
                title: 'Napoli',
                description: 'Tomate, mozzarella, requesón y chorizo picante.',
                price: '€9,50',
              ),
              const MenuItem(
                title: 'El Diablo',
                description:
                    'Tomate, mozzarella, queso ahumado, jamón cocido, requesón y chorizo picante.',
                price: '€12,00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue[900],
          fontFamily: 'Lobster', // Usar Lobster para los títulos de secciones
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0, // Sombra para dar más profundidad a los ítems
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_pizza, color: Colors.lightBlue[900]),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isLargeScreen ? 20.0 : 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
