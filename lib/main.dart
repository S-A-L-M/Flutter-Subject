import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final AutoScrollController _scrollController = AutoScrollController();

  // Datos de ejemplo para la lista dinámica en el fondo
  final List<String> dynamicData = [
    'Información adicional 1',
    'Información adicional 2',
    'Información adicional 3',
    'Información adicional 4',
    'Información adicional 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: false,
      backgroundColor: Colors.transparent, // Fondo transparente para mostrar el fondo personalizado
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBackground(), // Fondo personalizado con animación
          ),
          AutoScrollTag(
            controller: _scrollController,
            index: 0,
            key: ValueKey(0),
            child: ListView(
              controller: _scrollController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Exploraremos los gestos en Flutter',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ExplanationScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Text(
                            'Toca para continuar',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 60), // Espacio entre el texto y la lista dinámica
                    ],
                  ),
                ),
                // Lista dinámica en el fondo
                Container(
                  height: 200, // Altura de la lista dinámica
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dynamicData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Center(
                          child: Text(
                            dynamicData[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Aquí podrías manejar la navegación a la opción "Home"
                },
              ),
              IconButton(
                icon: Icon(Icons.fitness_center),
                onPressed: () {
                  // Aquí podrías manejar la navegación a la opción "Ejercicio"
                },
              ),
              IconButton(
                icon: Icon(Icons.code),
                onPressed: () {
                  // Aquí podrías manejar la navegación a la opción "Ejemplo"
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: null,
    );
  }
}

class ExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicación de Gestos'),
      ),
      body: Center(
        child: Text(
          'Aquí iría una explicación detallada de los gestos en Flutter.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.6), // Color del fondo con opacidad
                Colors.blue.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
