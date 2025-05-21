import 'package:first_ass/model/student_model.dart';
import 'package:first_ass/view/output_view.dart';
import 'package:flutter/material.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final List<String> lstCity = [
    "Kathmandu",
    "Bhaktapur",
    "Lalitpur",
    "Pokhara",
  ];
  final List<Student> lstStudent = [];

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();

  String? selectedCity;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showDeleteConfirmation(Student student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete?"),
          content: Text("Are you sure you want to delete ${student.fname}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  lstStudent.remove(student);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _addStudent() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        lstStudent.add(
          Student(
            fname: fnameController.text,
            lname: lnameController.text,
            city: selectedCity!,
          ),
        );
        fnameController.clear();
        lnameController.clear();
        selectedCity = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student View"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First Name Field
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter your first name"
                            : null,
              ),
              const SizedBox(height: 10),

              // Last Name Field
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter your last name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter your last name"
                            : null,
              ),
              const SizedBox(height: 10),

              // Dropdown for City
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select City",
                  hintText: "Select your city",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                value: selectedCity,
                items:
                    lstCity
                        .map(
                          (city) =>
                              DropdownMenuItem(value: city, child: Text(city)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                validator:
                    (value) => value == null ? "Please select your city" : null,
              ),
              const SizedBox(height: 10),

              // Add Student Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: _addStudent,
                child: const Text("Add Student"),
              ),
              const SizedBox(height: 20),

              // Placeholder View Students Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.deepPurple.shade50,
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("View Students"),
              ),
              const SizedBox(height: 20),

              // Student List
              lstStudent.isEmpty
                  ? const Text("No data found")
                  : Expanded(
                    child: ListView.builder(
                      itemCount: lstStudent.length,
                      itemBuilder: (context, index) {
                        final student = lstStudent[index];
                        return ListTile(
                          title: Text("${student.fname} ${student.lname}"),
                          subtitle: Text(student.city),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _showDeleteConfirmation(student),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => OutputView(student: student),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
