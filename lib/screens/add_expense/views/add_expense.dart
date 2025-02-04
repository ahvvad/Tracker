import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:money_tracker/screens/add_expense/views/widgets/custom_alert_dialog.dart';
import 'package:money_tracker/screens/add_expense/views/widgets/custom_expense_botton.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseConteoller = TextEditingController();
  TextEditingController categoryConteoller = TextEditingController();
  TextEditingController dateConteoller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateConteoller.text = DateFormat('yMMMMd').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const Text(
                  'Add Expenses',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF263A4D),
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField(expenseConteoller, FontAwesomeIcons.dollarSign),
                const SizedBox(height: 40),
                _buildCategoryField(),
                _buildCategoriesList(),
                const SizedBox(height: 16),
                _buildDateField(),
                const SizedBox(height: 16),
                const CustomExpenseBotton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, IconData icon) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(icon,
                color: const Color(0xFF263A4D).withOpacity(0.8), size: 16),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      controller: categoryConteoller,
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,
      onTap: () {},
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.list,
            color: const Color(0xFF263A4D).withOpacity(0.5), size: 16),
        suffixIcon: const CustomAlertDialog(),
        hintText: 'Category',
        hintStyle: TextStyle(color: const Color(0xFF263A4D).withOpacity(0.5)),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, int i) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/${state.categories[i].icon}.png',
                        scale: 2,
                      ),
                      title: Text(state.categories[i].name),
                      tileColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return TextFormField(
      controller: dateConteoller,
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (newDate != null) {
          setState(() {
            dateConteoller.text = DateFormat('yMMMMd').format(newDate);
            selectedDate = newDate;
          });
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.clock,
            color: const Color(0xFF263A4D).withOpacity(0.5), size: 16),
        hintText: 'Date',
        hintStyle: TextStyle(color: const Color(0xFF263A4D).withOpacity(0.5)),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
