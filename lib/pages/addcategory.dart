import 'package:billingmedical/main.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:billingmedical/utils/customcheckbox.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';

class addCategory extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('productcategory');
  // final Map<String, dynamic> currentproduct;
  final CategoryModel currentcategory;

  addCategory(this.currentcategory);

  @override
  perform() async {
    await ref.add(currentcategory.toFirestore());
    print("Add category button pressed.");
  }
}

class AddCategory extends StatelessWidget {
  // This widget is the home page of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Add Category"),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  // var addproduct = Map<String, dynamic>();
  DateTime? selectedCreatedOnDate;
  DateTime? selectedUpdatedOnDate;
  bool _isActive = false;
  ValueNotifier<bool> _notifier = ValueNotifier(false);
  TextEditingController categorynameController = new TextEditingController();
  TextEditingController productcreatedOnController =
      new TextEditingController();
  TextEditingController productupdatedOnController =
      new TextEditingController();
  TextEditingController productisActiveController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: categorynameController,
              decoration: const InputDecoration(
                // icon: const Icon(Icons.person),
                hintText: 'Enter product name',
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              width: 10.0,
              height: 20.0,
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                // icon: const Icon(Icons.calendar_today),
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Created date',
              ),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              initialDate: DateTime.now().add(const Duration(days: 10)),
              autovalidateMode: AutovalidateMode.always,
              validator: (DateTime? e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                selectedCreatedOnDate = value;
              },
            ),
            const SizedBox(
              width: 10.0,
              height: 20.0,
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                // icon: const Icon(Icons.calendar_today),
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Updated date',
              ),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              initialDate: DateTime.now().add(const Duration(days: 20)),
              autovalidateMode: AutovalidateMode.always,
              validator: (DateTime? e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                selectedUpdatedOnDate = value;
              },
            ),
            const SizedBox(
              width: 10.0,
              height: 20.0,
            ),
            LabeledCheckbox(
              label: 'isActive',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _isActive,
              onChanged: (bool newValue) {
                setState(() {
                  _isActive = newValue;
                });
              },
            ),
            const SizedBox(
              width: 10.0,
              height: 20.0,
            ),
            Container(
                padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // addproduct["name"] = productnameController.text;
                      final product = CategoryModel(
                        name: categorynameController.text,
                        createdOn: selectedCreatedOnDate,
                        updatedOn: selectedUpdatedOnDate,
                        isActive: _isActive,
                      );

                      addCategory(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
