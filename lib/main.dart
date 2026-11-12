
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF100D20),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> features = const [
    {'icon': Icons.image, 'title': 'AI Photo Generator'},
    {'icon': Icons.edit, 'title': 'Photo Editor'},
    {'icon': Icons.video_camera_back, 'title': 'AI Video Generator'},
    {'icon': Icons.movie_creation, 'title': 'Photo to Video'},
    {'icon': Icons.face, 'title': 'Face Tools'},
    {'icon': Icons.music_note, 'title': 'Voice & Music'},
    {'icon': Icons.photo_library, 'title': 'My Gallery'},
    {'icon': Icons.admin_panel_settings, 'title': 'Owner Admin'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHANDAN AI STUDIO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF211638),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Welcome to Your AI Studio',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create photos, videos and more with AI.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final feature = features[index];
                return Card(
                  color: const Color(0xFF261D40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${feature['title']} coming soon!',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          feature['icon'] as IconData,
                          size: 38,
                          color: Colors.purpleAccent,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          feature['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
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
