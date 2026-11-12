import 'package:flutter/material.dart';

void main() => runApp(const ChandanAiStudio());

const bg = Color(0xFF0B0B13);
const panel = Color(0xFF171725);
const purple = Color(0xFF9B6DFF);
const pink = Color(0xFFFF6EB4);

class ChandanAiStudio extends StatelessWidget {
  const ChandanAiStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHANDAN AI STUDIO',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final pages = const [
    StudioHome(),
    ToolPage(title: 'My Gallery', subtitle: 'Your generated creations will appear here.', icon: Icons.photo_library_outlined),
    ToolPage(title: 'Profile', subtitle: 'Account settings will be added here.', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panel,
        indicatorColor: purple.withOpacity(.22),
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.photo_library_outlined), label: 'Gallery'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class StudioHome extends StatelessWidget {
  const StudioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      children: [
        Row(
          children: [
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [purple, pink]),
              ),
              child: const Icon(Icons.auto_awesome, color: Colors.white, size: 27),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CHANDAN AI STUDIO', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: .4)),
                  SizedBox(height: 3),
                  Text('Create • Edit • Animate', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.notifications_none, color: Colors.white70),
          ],
        ),
        const SizedBox(height: 26),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              colors: [Color(0xFF39205F), Color(0xFF1A1835), Color(0xFF242044)],
            ),
            border: Border.all(color: purple.withOpacity(.35)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('YOUR AI CREATIVE SPACE', style: TextStyle(color: Color(0xFFD8C8FF), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.4)),
              SizedBox(height: 10),
              Text('Imagine it.\\nCreate it.', style: TextStyle(fontSize: 31, height: 1.05, fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              Text('Make photos and videos with AI tools.', style: TextStyle(color: Colors.white70, fontSize: 13)),
              SizedBox(height: 16),
              Row(children: [
                Icon(Icons.auto_awesome, color: Color(0xFFE1D2FF), size: 16),
                SizedBox(width: 7),
                Text('Your creativity starts here', style: TextStyle(color: Color(0xFFE1D2FF), fontSize: 12, fontWeight: FontWeight.w600)),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 26),
        const Text('AI TOOLS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.1)),
        const SizedBox(height: 13),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.17,
          children: const [
            ToolCard(title: 'AI Photo', detail: 'Create images from text', icon: Icons.image_outlined, color: purple),
            ToolCard(title: 'Photo Editor', detail: 'Edit your pictures', icon: Icons.tune, color: pink),
            ToolCard(title: 'AI Video', detail: 'Turn ideas into videos', icon: Icons.movie_creation_outlined, color: Color(0xFF55C7D9)),
            ToolCard(title: 'Photo to Video', detail: 'Animate a photo', icon: Icons.play_circle_outline, color: Color(0xFFFFB65C)),
            ToolCard(title: 'Face Tools', detail: 'Preserve or edit faces', icon: Icons.face_retouching_natural, color: Color(0xFF8DD49B)),
            ToolCard(title: 'Voice & Music', detail: 'Add speech and sound', icon: Icons.graphic_eq, color: Color(0xFFB5A2FF)),
          ],
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: panel,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white10),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shield_outlined, color: Color(0xFF9BCEFF)),
              SizedBox(width: 12),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Safe creation', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('Tools will include safeguards for consent, privacy, age-appropriate use, and prohibited content.', style: TextStyle(color: Colors.white60, fontSize: 12, height: 1.4)),
                ],
              )),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Center(child: Text('Starter design • AI services not connected yet', style: TextStyle(color: Colors.white38, fontSize: 10))),
      ],
    );
  }
}

class ToolCard extends StatelessWidget {
  final String title, detail;
  final IconData icon;
  final Color color;
  const ToolCard({super.key, required this.title, required this.detail, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ToolPage(title: title, subtitle: detail, icon: icon))),
      child: Ink(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: BorderRadius.circular(13)),
              child: Icon(icon, color: color),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
              const SizedBox(height: 4),
              Text(detail, style: const TextStyle(color: Colors.white54, fontSize: 10)),
            ]),
          ],
        ),
      ),
    );
  }
}

class ToolPage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const ToolPage({super.key, required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: bg),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 62, color: purple),
              const SizedBox(height: 18),
              Text(title, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 9),
              Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white60)),
              const SizedBox(height: 18),
              const Text('This is the starter interface. The AI engine and upload workflow will be connected in the next development step.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize: 12, height: 1.5)),
              const SizedBox(height: 20),
              OutlinedButton.icon(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back), label: const Text('Back to Studio')),
            ],
          ),
        ),
      ),
    );
  }
}
