import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationGestureApp());
}

class NavigationGestureApp extends StatelessWidget {
  const NavigationGestureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation and Gestures',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      // ============================================
      // NAMED ROUTES
      // ============================================

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
        '/gesture': (context) => const GestureScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}

// ==================================================
// HOME SCREEN
// ==================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation & Gestures',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Header
            const Icon(
              Icons.navigation,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 15),

            const Text(
              'Flutter Navigation Demo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'This app demonstrates basic navigation, '
              'named routes and gesture detection.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 1. BASIC NAVIGATION
            // ==========================================

            const Text(
              '1. Basic Navigation',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 3,

              child: ListTile(
                leading: const Icon(
                  Icons.arrow_forward,
                  color: Colors.deepPurple,
                ),

                title: const Text(
                  'Open Details Screen',
                ),

                subtitle: const Text(
                  'Uses Navigator.push()',
                ),

                trailing: const Icon(
                  Icons.chevron_right,
                ),

                onTap: () {

                  // ====================================
                  // BASIC NAVIGATION
                  // ====================================

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          const DetailsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // 2. NAMED ROUTES
            // ==========================================

            const Text(
              '2. Named Routes',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 3,

              child: ListTile(
                leading: const Icon(
                  Icons.route,
                  color: Colors.blue,
                ),

                title: const Text(
                  'Open Gesture Screen',
                ),

                subtitle: const Text(
                  "Uses Navigator.pushNamed('/gesture')",
                ),

                trailing: const Icon(
                  Icons.chevron_right,
                ),

                onTap: () {

                  // ====================================
                  // NAMED ROUTE NAVIGATION
                  // ====================================

                  Navigator.pushNamed(
                    context,
                    '/gesture',
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // 3. GESTURE DEMO
            // ==========================================

            const Text(
              '3. Gesture Detection',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'You tapped the gesture card!',
                    ),
                  ),
                );
              },

              onDoubleTap: () {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Double tap detected!',
                    ),
                  ),
                );
              },

              child: Card(
                elevation: 4,

                child: Padding(
                  padding:
                      const EdgeInsets.all(25),

                  child: Column(
                    children: const [

                      Icon(
                        Icons.touch_app,
                        size: 65,
                        color: Colors.orange,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'Tap or Double Tap Me',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'GestureDetector detects '
                        'your touch actions.',
                        textAlign:
                            TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // 4. ABOUT
            // ==========================================

            ElevatedButton.icon(
              onPressed: () {

                Navigator.pushNamed(
                  context,
                  '/about',
                );
              },

              icon: const Icon(
                Icons.info_outline,
              ),

              label: const Text(
                'About This App',
              ),
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'Flutter Navigation & Gesture Demo',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================================================
// DETAILS SCREEN
// ==================================================

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.description,
                size: 90,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 20),

              const Text(
                'Details Screen',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'This screen was opened using '
                'basic Navigator.push() navigation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {

                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.arrow_back,
                ),

                label: const Text(
                  'Go Back',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================================================
// GESTURE SCREEN
// ==================================================

class GestureScreen extends StatefulWidget {
  const GestureScreen({super.key});

  @override
  State<GestureScreen> createState() =>
      _GestureScreenState();
}

class _GestureScreenState
    extends State<GestureScreen> {

  String message = 'Perform a gesture';

  int tapCount = 0;

  // ================================================
  // GESTURE METHODS
  // ================================================

  void handleTap() {
    setState(() {
      tapCount++;
      message = 'Tap detected!';
    });
  }

  void handleDoubleTap() {
    setState(() {
      message = 'Double tap detected!';
    });
  }

  void handleLongPress() {
    setState(() {
      message = 'Long press detected!';
    });
  }

  void reset() {
    setState(() {
      tapCount = 0;
      message = 'Perform a gesture';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gesture Detection',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 30),

            const Text(
              'GestureDetector Demo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Try different gestures on the box below.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 35),

            // ========================================
            // GESTURE DETECTOR
            // ========================================

            GestureDetector(

              onTap: handleTap,

              onDoubleTap: handleDoubleTap,

              onLongPress: handleLongPress,

              child: Container(
                width: double.infinity,
                height: 250,

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,

                  borderRadius:
                      BorderRadius.circular(20),

                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                ),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Icon(
                      Icons.touch_app,
                      size: 80,
                      color: Colors.deepPurple,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Tap count: $tapCount',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Tap → Tap detected\n'
              'Double Tap → Double tap detected\n'
              'Long Press → Long press detected',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            OutlinedButton.icon(
              onPressed: reset,

              icon: const Icon(
                Icons.refresh,
              ),

              label: const Text(
                'Reset',
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {

                Navigator.pop(context);
              },

              icon: const Icon(
                Icons.arrow_back,
              ),

              label: const Text(
                'Back to Home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================================================
// ABOUT SCREEN
// ==================================================

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.flutter_dash,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Flutter Navigation App',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'This mini application demonstrates '
                'basic navigation, named routes, '
                'and gesture detection using Flutter.',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);
                },

                child: const Text(
                  'Go Back',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}