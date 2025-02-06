import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:money_tracker/screens/add_expense/views/widgets/category_creation.dart';
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
  // DateTime selectedDate = DateTime.now();
  late Expense expense;

  @override
  void initState() {
    dateConteoller.text = DateFormat('yMMMMd').format(DateTime.now());
    expense = Expense.empty;
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
        body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 40.0,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Add Expenses',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF263A4D),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextFormField(
                              controller: expenseConteoller,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.dollarSign,
                                  color:
                                      const Color(0xFF263A4D).withOpacity(0.8),
                                  size: 16,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: categoryConteoller,
                          textAlignVertical: TextAlignVertical.center,
                          readOnly: true,
                          onTap: () {
                            //
                          },
                          decoration: InputDecoration(
                            prefixIcon: expense.category == Category.empty
                                ? Icon(
                                    FontAwesomeIcons.list,
                                    color: const Color(0xFF263A4D)
                                        .withOpacity(0.5),
                                    size: 16,
                                  )
                                : Image.asset(
                                    'assets/images/${expense.category.icon}.png',
                                    scale: 2,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                var newCategory =
                                    await getCategoryCreation(context);
                                setState(() {
                                  state.categories.insert(0, newCategory);
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: expense.category == Category.empty
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            hintText: 'Category',
                            hintStyle: TextStyle(
                              color: const Color(0xFF263A4D).withOpacity(0.5),
                            ),
                            fillColor: expense.category == Category.empty
                                ? Colors.white
                                : Color(expense.category.color),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: state.categories.length,
                              itemBuilder: (context, int i) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        expense.category = state.categories[i];
                                        categoryConteoller.text =
                                            expense.category.name;
                                      });
                                    },
                                    leading: Image.asset(
                                      'assets/images/${state.categories[i].icon}.png',
                                      scale: 2,
                                    ),
                                    title: Text(state.categories[i].name),
                                    tileColor: Color(state.categories[i].color),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: dateConteoller,
                          textAlignVertical: TextAlignVertical.center,
                          readOnly: true,
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: expense.date,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (newDate != null) {
                              setState(() {
                                dateConteoller.text =
                                    DateFormat('yMMMMd').format(newDate);
                                // selectedDate = newDate;
                                expense.date = newDate;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.clock,
                              color: const Color(0xFF263A4D).withOpacity(0.5),
                              size: 16,
                            ),
                            hintText: 'Date',
                            hintStyle: TextStyle(
                              color: const Color(0xFF263A4D).withOpacity(0.5),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: kToolbarHeight,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            color: Colors.grey.shade400,
                            offset: const Offset(0, 15),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            expense.amount = int.parse(expenseConteoller.text);
                          });
                        },
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is GetCategoriesFailure) {
              return const Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Oops! Check your internet\n& try again'),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
