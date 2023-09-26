import 'package:corridasegura/constants/colors.dart';
import 'package:corridasegura/features/home/screens/filter_page.dart';
import 'package:corridasegura/features/home/screens/map_page.dart';
import 'package:corridasegura/features/home/screens/profile_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pc,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: setPaginaAtual,
          children: const [
            MapPage(),
            FilterPage(),
            ProfilePage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: paginaAtual,
        selectedItemColor: Colors.white,
        unselectedItemColor: tDisabledColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt_outlined),
            activeIcon: Icon(Icons.filter_alt),
            label: 'Filtro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina, duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
