// import 'package:first_ass/model/student_model.dart';
// import 'package:flutter/material.dart';

// class DropdownView extends StatefulWidget {
//   const DropdownView({super.key});

//   @override
//   State<DropdownView> createState() => _DropdownViewState();
// }

// class _DropdownViewState extends State<DropdownView> {
//   String? city;

//   final List<Student>  lstStudents = [];

//   @override
//   void initState() {
//     super.initState();
//     city = 'Kathmandu';
//   }

//   final items = [
//     const DropdownMenuItem(value: 'Kathmandu', child: Text("Kathmandu")),
//     const DropdownMenuItem(value: 'Bhaktapur', child: Text("Bhaktapur")),
//     const DropdownMenuItem(value: 'Lalitpur', child: Text("Lalitpur")),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select city')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           child: DropdownButtonFormField(
//           icon: const Icon(Icons.arrow_downward),
//           items: items,
//           onChanged: (value) {
//             setState(() {
//               city = value;
//             });
//           },
//           validator: (value) {
//             if (value == null) {
//               return 'Please select a city';
//             }
//             return null;
//           },
//         ),
//             const SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(onPressed: {
//                 if (_fomKey.currentState!.validate() && city != null) {
//                   Student student = Student(
//                     fname: _fnameController.text,
//                     lname: _lnameController.text,
//                     city: city!,
//                   );

//                   setState(() {

//                   });
//                 }
//               }, child: const Text("Add Student")),
//             ),

//           ],
//         ),

//       ),
//     );
//   }
// }

import 'package:first_ass/model/student_model.dart';
import 'package:flutter/material.dart';

class DropdownView extends StatefulWidget {
  const DropdownView({super.key});

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  final lstCity = ["Kathmandu", "Bhaktapur", "Lalitpur", "Pokhara"];

  final List<Student> lstStudent = [];
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();

  String? selectedCity;

  final _formKey = GlobalKey<FormState>();

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
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter your last name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select City",
                  hintText: "Select your city",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                value: selectedCity,
                items:
                    lstCity.map((city) {
                      return DropdownMenuItem(value: city, child: Text(city));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select your city";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    lstStudent.add(
                      Student(
                        fname: fnameController.text,
                        lname: lnameController.text,
                        city: selectedCity!,
                      ),
                    );
                    // Refresh the form fields
                    setState(() {});
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 10),
              lstCity.isEmpty
                  ? const Text("No data found")
                  : Expanded(
                    child: ListView.builder(
                      itemCount: lstStudent.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "${lstStudent[index].fname} ${lstStudent[index].lname}",
                          ),
                          subtitle: Text(lstStudent[index].city),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                lstStudent.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  // Expanded(child: lstStudent.isNotEmpty? ListView.builder(

                  // )),
            ],
          ),
        ),
      ),
    );
  }
}
