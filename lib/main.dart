
import 'package:flutter/material.dart';

void main() {
  runApp(const ChandanAIStudio());
}

class ChandanAIStudio extends StatelessWidget {
  const ChandanAIStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHANDAN AI STUDIO',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF100D20),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Feature {
  final String title;
  final String subtitle;
  final IconData icon;

  const Feature(this.title, this.subtitle, this.icon);
}

const List<Feature> features = [
  Feature('AI Photo Generator', 'Create images with AI', Icons.auto_awesome),
  Feature('Photo Editor', 'Edit your photos', Icons.photo),
  Feature('AI Video Generator', 'Create videos with AI', Icons.movie_creation),
  Feature('Photo to Video', 'Turn photos into videos', Icons.animation),
  Feature('Face Tools', 'AI face tools', Icons.face_retouching_natural),
  Feature('Voice & Music', 'Voice and music tools', Icons.music_note),
  Feature('My Gallery', 'Your creations', Icons.photo_library),
  Feature('Owner Admin', 'App management', Icons.admin_panel_settings),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openFeature(BuildContext context, Feature feature) {
    if (feature.title == 'AI Photo Generator') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PhotoGeneratorScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${feature.title} is coming soon!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHANDAN AI STUDIO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1B1533),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Welcome to CHANDAN AI STUDIO',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create amazing photos, videos and more with AI.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                final feature = features[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => openFeature(context, feature),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF211A3B),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          feature.icon,
                          size: 38,
                          color: Colors.deepPurpleAccent.shade100,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          feature.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          feature.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'Powered by CHANDAN AI STUDIO',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoGeneratorScreen extends StatefulWidget {
  const PhotoGeneratorScreen({super.key});

  @override
  State<PhotoGeneratorScreen> createState() =>
      _PhotoGeneratorScreenState();
}

class _PhotoGeneratorScreenState extends State<PhotoGeneratorScreen> {
  final TextEditingController promptController = TextEditingController();

  bool isGenerating = false;

  void generatePhoto() {
    if (promptController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter an image prompt first.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'AI image generation service will be connected next.',
        ),
      ),
    );
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Photo Generator'),
        backgroundColor: const Color(0xFF1B1533),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.auto_awesome,
              size: 65,
              color: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 18),
            const Text(
              'Create Your AI Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Describe the image you want to create.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: promptController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    'Example: A beautiful sunset over Dubai skyline...',
                filled: true,
                fillColor: const Color(0xFF211A3B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: isGenerating ? null : generatePhoto,
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Generate Image'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Note: AI image generation will work after connecting the secure AI service.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
