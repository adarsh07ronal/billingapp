import 'package:billingmedical/main.dart';
import 'package:billingmedical/management/mymutations.dart';
import 'package:billingmedical/management/mystore.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:billingmedical/models/productmodel.dart';
import 'package:billingmedical/utils/customcheckbox.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';



class AddProduct extends StatelessWidget {
  // This widget is the home page of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Add Product"),
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
  List<CategoryModel> categories = [];
  var document;

  // var addproduct = Map<String, dynamic>();
  DateTime? selectedCreatedOnDate;
  DateTime? selectedUpdatedOnDate;
  bool _isActive = false;

  TextEditingController productnameController = new TextEditingController();
  TextEditingController productpriceController = new TextEditingController();
  TextEditingController productbatchnumberController =
      new TextEditingController();
  TextEditingController productdosageController = new TextEditingController();
  TextEditingController productquantityController = new TextEditingController();
  TextEditingController productstrikepriceController =
      new TextEditingController();
  TextEditingController productcategoryIdController =
      new TextEditingController();
  TextEditingController productcategoryNameController =
      new TextEditingController();
  TextEditingController productcreatedOnController =
      new TextEditingController();
  TextEditingController productupdatedOnController =
      new TextEditingController();
  TextEditingController productisActiveController = new TextEditingController();

  var ref2 = Firestore.instance.collection('productcategory');
  void getcategories() async {
    document = await ref2.get();
    categories = document
        .map<CategoryModel>((element) => CategoryModel.fromMap(element.map))
        .toList();
    try {
      setState(() {});
    } catch (e) {
      print(" Error:"+e.toString() );
    }
  }

  CategoryModel? dropdownvalue;
  // String? dropdownvalue = null; // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    super.initState();
    getcategories();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    print(" hii ${categories.length}");
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: productnameController,
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
              TextFormField(
                controller: productdosageController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'Dosage',
                  labelText: 'Dosage',
                ),
              ),
              const SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              TextFormField(
                controller: productpriceController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'Price',
                  labelText: 'Price',
                ),
              ),
              const SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              TextFormField(
                controller: productquantityController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                ),
              ),
              const SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              TextFormField(
                controller: productstrikepriceController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'strikeprice',
                  labelText: 'strikeprice',
                ),
              ),
              const SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              TextFormField(
                controller: productbatchnumberController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  // icon: const Icon(Icons.phone),
                  hintText: 'Batch Number',
                  labelText: 'Batch Number',
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
                  labelText: 'Manufacture date',
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialValue: DateTime.now(),
                initialDate: DateTime.now().add(const Duration(days: 20)),
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
                  labelText: 'Expiry date',
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialValue: DateTime.now(),
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
              // DropdownButton(
              //   // Initial Value
              //   value: dropdownvalue,

              //   // Down Arrow Icon
              //   icon: const Icon(Icons.keyboard_arrow_down),

              //   // Array list of items
              //   items: items.map((String items) {
              //     return DropdownMenuItem(
              //       value: items,
              //       child: Text(items),
              //     );
              //   }).toList(),
              //   // After selecting the desired option,it will
              //   // change button value to selected value
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownvalue = newValue!;
              //     });
              //   },
              // ),
              // categories.isEmpty
              //     ? Container()
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Select Category",
                    style: TextStyle(color: Colors.grey),
                  ),
                ), // Array list of items
                items: categories.map((CategoryModel items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.name ?? ""),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (CategoryModel? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),

              Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          // addproduct["name"] = productnameController.text;
                          final product = ProductModel(
                            name: productnameController.text,
                            price: num.tryParse(
                                    productpriceController.text.toString()) ??
                                0,
                            dosage: num.tryParse(
                                    productdosageController.text.toString()) ??
                                0,
                            batchnumber: num.tryParse(
                                    productbatchnumberController.text
                                        .toString()) ??
                                0,
                            quantity: num.tryParse(productquantityController
                                    .text
                                    .toString()) ??
                                0,
                            strikeprice: num.tryParse(
                                    productstrikepriceController.text
                                        .toString()) ??
                                0,
                            categoryName: dropdownvalue?.name ?? "",
                            createdOn: selectedCreatedOnDate,
                            updatedOn: selectedUpdatedOnDate,
                            isActive: _isActive,
                          );

                          addProduct(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
