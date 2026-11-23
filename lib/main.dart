
import 'package:flutter/material.dart';

void main() {
  runApp(const NzassaMobility());
}

const Color noir = Color(0xFF101010);
const Color surface = Color(0xFF1C1C1C);
const Color or = Color(0xFFD6B46A);
const Color blanc = Color(0xFFF5F5F5);

class NzassaMobility extends StatelessWidget {
  const NzassaMobility({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NZASSA MOBILITY',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: noir,
        colorScheme: const ColorScheme.dark(
          primary: or,
          surface: surface,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    BookingPage(),
    TripsPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: surface,
        indicatorColor: or.withOpacity(0.18),
        selectedIndex: selectedIndex,
        onDestinationSelected: changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: or),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_car_outlined),
            selectedIcon: Icon(Icons.directions_car, color: or),
            label: 'Réserver',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: or),
            label: 'Mes courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: or),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const Icon(Icons.directions_car, color: or, size: 32),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'NZASSA MOBILITY',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SupportPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.support_agent, color: or),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'La mobilité qui nous rassemble.',
            style: TextStyle(color: or, fontSize: 15),
          ),
          const SizedBox(height: 10),
          const Text(
            'Où souhaitez-vous aller ?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF35302A), Color(0xFF191919)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: or.withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.route, color: or, size: 35),
                const SizedBox(height: 14),
                const Text(
                  'Votre prochain trajet commence ici.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choisissez votre moyen de transport et préparez votre déplacement.',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: or,
                      foregroundColor: noir,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookingPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'COMMANDER UNE COURSE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Nos services',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const ServiceCard(
            icon: Icons.directions_car,
            title: 'Voiture',
            subtitle: 'Voyagez confortablement',
          ),
          const ServiceCard(
            icon: Icons.two_wheeler,
            title: 'Moto',
            subtitle: 'Déplacez-vous rapidement',
          ),
          const ServiceCard(
            icon: Icons.airport_shuttle,
            title: 'Taxi collectif',
            subtitle: 'Partagez votre trajet',
          ),
          const SizedBox(height: 20),
          const Text(
            'NZASSA MOBILITY • CÔTE D’IVOIRE',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surface,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: or.withOpacity(0.15),
          child: Icon(icon, color: or),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, color: or, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BookingPage(initialService: title),
            ),
          );
        },
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  final String? initialService;

  const BookingPage({super.key, this.initialService});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String service = 'Voiture';

  final departureController = TextEditingController();
  final destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    service = widget.initialService ?? 'Voiture';
  }

  @override
  void dispose() {
    departureController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réserver une course'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Choisissez votre transport',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: ['Voiture', 'Moto', 'Taxi collectif'].map((item) {
              return ChoiceChip(
                label: Text(item),
                selected: service == item,
                selectedColor: or,
                onSelected: (_) => setState(() => service = item),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: departureController,
            decoration: const InputDecoration(
              labelText: 'Lieu de départ',
              prefixIcon: Icon(Icons.my_location, color: or),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: destinationController,
            decoration: const InputDecoration(
              labelText: 'Destination',
              prefixIcon: Icon(Icons.location_on, color: or),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: or,
              foregroundColor: noir,
              padding: const EdgeInsets.all(17),
            ),
            onPressed: () {
              if (departureController.text.trim().isEmpty ||
                  destinationController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Veuillez renseigner le départ et la destination.'),
                  ),
                );
                return;
              }

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: surface,
                  title: const Text('Demande préparée'),
                  content: Text(
                    'Transport : $service\n'
                    'Départ : ${departureController.text}\n'
                    'Destination : ${destinationController.text}\n\n'
                    'La réservation réelle sera activée dans une prochaine version.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Compris'),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'CONTINUER',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      icon: Icons.receipt_long,
      title: 'Mes courses',
      description: 'Retrouvez ici vos déplacements et vos réservations.',
      message: 'Vous n’avez pas encore de course enregistrée.',
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      icon: Icons.person,
      title: 'Mon profil',
      description: 'Votre espace personnel NZASSA MOBILITY.',
      message: 'La création de votre compte sera disponible prochainement.',
    );
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      icon: Icons.support_agent,
      title: 'Assistance',
      description: 'Nous sommes là pour vous accompagner.',
      message: 'Le service d’assistance sera activé prochainement.',
    );
  }
}

class SimplePage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String message;

  const SimplePage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: or, size: 65),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(description, textAlign: TextAlign.center),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(message, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
