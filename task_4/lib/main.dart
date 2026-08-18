


import 'package:flutter/material.dart';
void main() {
  runApp(const InteractiveFormApp());
}
class InteractiveFormApp extends StatelessWidget {
  const InteractiveFormApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactive Form',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F5FC),
      ),
      home: const RegistrationForm(),
    );
  }
}
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}
class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // Form values
  String? selectedCourse;
  String? selectedGender;
  bool flutterSkill = false;
  bool dartSkill = false;
  bool pythonSkill = false;
  bool agreeTerms = false;
  double experience = 0;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  // Submit form
  void submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }


    if (!agreeTerms) {
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the terms and conditions.'),
        ),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text('Registration Successful'),
            ],
          ),
          content: Text(
            'Welcome ${nameController.text}!\n\n'
            'Your form has been submitted successfully.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  InputDecoration inputDecoration(
    String label,
    IconData icon,
  ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Interactive Registration Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),


          child: Form(
            key: _formKey,


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.app_registration,
                        color: Colors.white,
                        size: 42,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Student Registration',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Fill in your details to register.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 25),


                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),


                // Name
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration(
                    'Full Name',
                    Icons.person,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.trim().length < 3) {
                      return 'Name must contain at least 3 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(
                    'Email Address',
                    Icons.email,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex =
                      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Phone
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: inputDecoration(
                    'Phone Number',
                    Icons.phone,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length != 10) {
                      return 'Phone number must contain 10 digits';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Course
              DropdownButtonFormField<String>(
                  decoration: inputDecoration(
                    'Select Course',
                    Icons.school,
                  ),
                  value: selectedCourse,
                  items: const [
                    DropdownMenuItem(
                      value: 'Information Technology',
                      child: Text('Information Technology'),
                    ),
                    DropdownMenuItem(
                      value: 'Computer Engineering',
                      child: Text('Computer Engineering'),
                    ),
                    DropdownMenuItem(
                      value: 'Artificial Intelligence',
                      child: Text('Artificial Intelligence'),
                    ),
                    DropdownMenuItem(
                      value: 'Data Science',
                      child: Text('Data Science'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCourse = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a course';
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 25),


                // Gender
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                RadioGroup<String>(
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  child: const Column(
                    children: [
                      RadioListTile<String>(
                        title: Text('Male'),
                        value: 'Male',
                      ),
                      RadioListTile<String>(
                        title: Text('Female'),
                        value: 'Female',
                      ),
                      RadioListTile<String>(
                        title: Text('Other'),
                        value: 'Other',
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 15),


                // Skills
                const Text(
                  'Technical Skills',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                const SizedBox(height: 8),


                CheckboxListTile(
                  title: const Text('Flutter'),
                  value: flutterSkill,
                  onChanged: (value) {
                    setState(() {
                      flutterSkill = value ?? false;
                    });
                  },
                ),


                CheckboxListTile(
                  title: const Text('Dart'),
                  value: dartSkill,
                  onChanged: (value) {
                    setState(() {
                      dartSkill = value ?? false;
                    });
                  },
                ),


                CheckboxListTile(
                  title: const Text('Python'),
                  value: pythonSkill,
                  onChanged: (value) {
                    setState(() {
                      pythonSkill = value ?? false;
                    });
                  },
                ),


                const SizedBox(height: 15),


                // Experience
                const Text(
                  'Programming Experience',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                Slider(
                  value: experience,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  label: '$experience years',
                  onChanged: (value) {
                    setState(() {
                      experience = value;
                    });
                  },
                ),


                Center(
                  child: Text(
                    '${experience.toInt()} years of experience',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),


                const SizedBox(height: 15),


                // Terms
                SwitchListTile(
                  title: const Text(
                    'Accept Terms & Conditions',
                  ),
                  subtitle: const Text(
                    'You must accept before submitting.',
                  ),
                  value: agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeTerms = value;
                    });
                  },
                ),


                const SizedBox(height: 20),


                // Submit
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: submitForm,
                    icon: const Icon(Icons.send),
                    label: const Text(
                      'SUBMIT REGISTRATION',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 15),


                // Reset
                Center(
                  child: TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();


                      setState(() {
                        selectedCourse = null;
                        selectedGender = null;
                        flutterSkill = false;
                        dartSkill = false;
                        pythonSkill = false;
                        agreeTerms = false;
                        experience = 0;
                      });


                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                    },
                    child: const Text('Clear Form'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
