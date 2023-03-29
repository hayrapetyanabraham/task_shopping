import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/presentation/view_models/shopping_view_model.dart';

@RoutePage()
class AddShoppingItemPage extends StatefulWidget {
  final ShoppingViewModel viewModel;

  const AddShoppingItemPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  State<AddShoppingItemPage> createState() => _AddShoppingItemPageState();
}

class _AddShoppingItemPageState extends State<AddShoppingItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _selectedDateController = TextEditingController();
  final _warrantyPeriodDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _selectedDateController.dispose();
    _warrantyPeriodDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Shopping Item',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value!) == null) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _warrantyPeriodDateController,
                onTap: () async {
                  final DateTime? picked = await showRoundedDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 5),
                    lastDate: DateTime(DateTime.now().year + 5),
                    borderRadius: 16,
                  );
                  if (picked != null) {
                    _warrantyPeriodDateController.text =
                        DateFormat('yyyy-MM-dd').format(picked);
                  }
                },
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Warranty Period',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a warranty Period';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _selectedDateController,
                onTap: () async {
                  final DateTime? picked = await showRoundedDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 5),
                    lastDate: DateTime(DateTime.now().year + 5),
                    borderRadius: 16,
                  );
                  if (picked != null) {
                    _selectedDateController.text =
                        DateFormat('yyyy-MM-dd').format(picked);
                  }
                },
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Purchase Date Range:',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a warranty Period';
                  }
                  return null;
                },
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final shoppingItem = ShoppingItem(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: _nameController.text,
                        purchaseTime:
                            DateTime.parse(_selectedDateController.text),
                        price: double.parse(_priceController.text),
                        quantity: int.parse(_quantityController.text),
                        warrantyPeriod:
                            DateTime.parse(_warrantyPeriodDateController.text),
                      );
                      widget.viewModel.addShoppingItem(shoppingItem);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
