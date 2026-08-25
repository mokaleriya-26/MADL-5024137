import 'package:flutter/material.dart';

void main() {
  runApp(const TaskPlannerApp());
}

class TaskPlannerApp extends StatelessWidget {
  const TaskPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Planner',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> tasks = const [
    {
      'title': 'Assignment',
      'description': 'Complete and submit the Flutter layout task.',
      'icon': Icons.assignment_outlined,
    },
    {
      'title': 'Study Session',
      'description': 'Revise important concepts for the upcoming lecture.',
      'icon': Icons.menu_book_outlined,
    },
    {
      'title': 'Project Work',
      'description': 'Continue development of the current project module.',
      'icon': Icons.code_outlined,
    },
    {
      'title': 'Quick Notes',
      'description': 'Save important points and ideas for later.',
      'icon': Icons.note_alt_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Student Planner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 650;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1100,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    isMobile ? 16 : 28,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      // HERO SECTION
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          isMobile ? 24 : 36,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius:
                              BorderRadius.circular(24),
                        ),
                        child: isMobile
                            ? const Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  HeroContent(),
                                  SizedBox(height: 24),
                                  Center(
                                    child: HeroIcon(),
                                  ),
                                ],
                              )
                            : const Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: HeroContent(),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: HeroIcon(),
                                    ),
                                  ),
                                ],
                              ),
                      ),

                      const SizedBox(height: 30),

                      // DAILY OVERVIEW
                      const Text(
                        'Today at a Glance',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: const [
                          OverviewCard(
                            title: 'Total Tasks',
                            value: '08',
                            icon: Icons.list_alt,
                          ),
                          OverviewCard(
                            title: 'Completed',
                            value: '05',
                            icon: Icons.check_circle_outline,
                          ),
                          OverviewCard(
                            title: 'Remaining',
                            value: '03',
                            icon: Icons.hourglass_empty,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // TASK SECTION
                      const Text(
                        'Your Activities',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        'Organize your academic work and keep track of your daily priorities.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 18),

                      GridView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              isMobile ? 1 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio:
                              isMobile ? 2.7 : 2.5,
                        ),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];

                          return TaskCard(
                            title: task['title'],
                            description:
                                task['description'],
                            icon: task['icon'],
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      // DAILY PROGRESS
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.bar_chart_outlined,
                                  color: Colors.indigo,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Daily Completion',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            LinearProgressIndicator(
                              value: 0.62,
                              minHeight: 10,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              '5 out of 8 tasks completed today',
                              style: TextStyle(
                                color:
                                    Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // FOOTER
                      Center(
                        child: Text(
                          'Plan smart • Stay focused • Get things done',
                          style: TextStyle(
                            color:
                                Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Plan Your Day Better',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Keep your assignments, study sessions and project work organized in one simple place.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 22),

        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_task),
          label: const Text(
            'View Tasks',
          ),
        ),
      ],
    );
  }
}

class HeroIcon extends StatelessWidget {
  const HeroIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.event_note,
        size: 65,
        color: Colors.white,
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(width: 14),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: Colors.indigo,
              size: 28,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }
}