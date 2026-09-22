import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const VisualDashboardApp());
}

class VisualDashboardApp extends StatelessWidget {
  const VisualDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Visual Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Visual Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------
            // 1. BUILT-IN ICONS
            // ------------------------------------------------

            const Text(
              '1. Flutter Built-in Icons',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,

                  children: const [

                    Icon(
                      Icons.home,
                      size: 45,
                      color: Colors.blue,
                    ),

                    Icon(
                      Icons.favorite,
                      size: 45,
                      color: Colors.red,
                    ),

                    Icon(
                      Icons.star,
                      size: 45,
                      color: Colors.orange,
                    ),

                    Icon(
                      Icons.settings,
                      size: 45,
                      color: Colors.grey,
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ------------------------------------------------
            // 2. LOCAL AND NETWORK IMAGES
            // ------------------------------------------------

            const Text(
              '2. Local and Network Images',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            LayoutBuilder(
              builder: (context, constraints) {

                final isSmallScreen =
                    constraints.maxWidth < 600;

                return isSmallScreen
                    ? Column(
                        children: [
                          buildLocalImage(),
                          const SizedBox(height: 20),
                          buildNetworkImage(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: buildLocalImage(),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: buildNetworkImage(),
                          ),
                        ],
                      );
              },
            ),

            const SizedBox(height: 35),

            // ------------------------------------------------
            // 3. CHART
            // ------------------------------------------------

            const Text(
              '3. Student Performance Chart',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 3,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: SizedBox(
                  height: 300,

                  child: BarChart(
                    BarChartData(

                      alignment:
                          BarChartAlignment.spaceAround,

                      maxY: 100,

                      titlesData: FlTitlesData(

                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,

                            getTitlesWidget:
                                (value, meta) {

                              const subjects = [
                                'MADL',
                                'AT',
                                'AI',
                                'IoT',
                                'DWM',
                              ];

                              int index =
                                  value.toInt();

                              if (index >= 0 &&
                                  index <
                                      subjects.length) {

                                return Padding(
                                  padding:
                                      const EdgeInsets.only(
                                    top: 8,
                                  ),

                                  child: Text(
                                    subjects[index],
                                    style:
                                        const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }

                              return const Text('');
                            },
                          ),
                        ),

                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                          ),
                        ),

                        topTitles: const AxisTitles(
                          sideTitles:
                              SideTitles(
                            showTitles: false,
                          ),
                        ),

                        rightTitles: const AxisTitles(
                          sideTitles:
                              SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),

                      borderData:
                          FlBorderData(
                        show: false,
                      ),

                      gridData:
                          const FlGridData(
                        show: true,
                      ),

                      barGroups: [

                        makeBar(0, 80),
                        makeBar(1, 92),
                        makeBar(2, 68),
                        makeBar(3, 50),
                        makeBar(4, 95),

                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ------------------------------------------------
            // 4. COMBINED LAYOUT
            // ------------------------------------------------

            const Text(
              '4. Combined Dashboard',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,

                  children: [

                    // Icon
                    const Icon(
                      Icons.analytics,
                      size: 60,
                      color: Colors.deepPurple,
                    ),

                    const SizedBox(width: 20),

                    // Text
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Student Analytics',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            'Performance dashboard '
                            'using icons, images '
                            'and charts.',
                          ),

                        ],
                      ),
                    ),

                    // Small network image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10),

                      child: Image.network(
                        'https://picsum.photos/100',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,

                        errorBuilder:
                            (context, error, stackTrace) {

                          return const Icon(
                            Icons.image_not_supported,
                            size: 60,
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Footer

            Center(
              child: Text(
                'Created using Flutter',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // ------------------------------------------------
  // LOCAL IMAGE
  // ------------------------------------------------

  Widget buildLocalImage() {

    return Card(
      elevation: 3,

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            const Text(
              'Local Image',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12),

              child: Image.asset(
                'assets/images/image.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.contain,

                errorBuilder:
                    (context, error, stackTrace) {

                  return const SizedBox(
                    height: 180,

                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  // ------------------------------------------------
  // NETWORK IMAGE
  // ------------------------------------------------

  Widget buildNetworkImage() {

    return Card(
      elevation: 3,

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            const Text(
              'Network Image',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12),

              child: Image.network(
                'https://picsum.photos/500/300',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stackTrace) {

                  return const SizedBox(
                    height: 180,

                    child: Center(
                      child: Icon(
                        Icons.cloud_off,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  // ------------------------------------------------
  // BAR CHART DATA
  // ------------------------------------------------

  static BarChartGroupData makeBar(
    int x,
    double value,
  ) {

    return BarChartGroupData(
      x: x,

      barRods: [

        BarChartRodData(
          toY: value,
          width: 30,
          borderRadius:
              BorderRadius.circular(5),
        ),

      ],
    );
  }
}