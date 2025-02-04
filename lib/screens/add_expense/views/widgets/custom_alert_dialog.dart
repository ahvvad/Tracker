import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:uuid/uuid.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  List<String> categoryIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'tech',
    'shopping',
    'travel'
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            bool isExpanded = false;
            String iconSelected = '';
            Color categoryColor = Colors.white;
            TextEditingController categoryNameConteoller =
                TextEditingController();
            TextEditingController categoryIconConteoller =
                TextEditingController();
            TextEditingController categoryColorConteoller =
                TextEditingController();
            bool isLoading = false;
            return BlocProvider.value(
              value: context.read<CreateCategoryBloc>(),
              child: BlocListener<CreateCategoryBloc, CreateCategoryState>(
                listener: (context, state) {
                  if (state is CreateCategorySuccess) {
                    Navigator.pop(ctx);
                  } else if (state is CreateCategoryLoading) {
                    setState(() {
                      isLoading == true;
                    });
                  }
                },
                child: StatefulBuilder(
                  builder: (ctx, setState) {
                    return AlertDialog(
                      title: const Text(
                        'Create a Gategory',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.grey.shade500,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: categoryNameConteoller,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Name',
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
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: categoryIconConteoller,
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Icon',
                              suffixIcon: AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Icon(
                                  CupertinoIcons.chevron_down,
                                  color:
                                      const Color(0xFF263A4D).withOpacity(0.7),
                                  size: 20,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: const Color(0xFF263A4D).withOpacity(0.5),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: isExpanded
                                  ? const OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      borderSide: BorderSide.none,
                                    )
                                  : OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                              enabledBorder: isExpanded
                                  ? const OutlineInputBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      borderSide: BorderSide.none,
                                    )
                                  : OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: MediaQuery.of(context).size.width,
                            height: isExpanded ? 200 : 0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: isExpanded
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemCount: categoryIcons.length,
                                    itemBuilder: (context, int i) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            iconSelected = categoryIcons[i];
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 3,
                                                color: iconSelected ==
                                                        categoryIcons[i]
                                                    ? Colors.green
                                                    : Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/${categoryIcons[i]}.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox.shrink(),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: categoryColorConteoller,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx2) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ColorPicker(
                                          pickerColor: Colors.white,
                                          onColorChanged: (value) {
                                            setState(() {
                                              categoryColor = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(ctx2).pop();
                                            },
                                            child: const Text(
                                              'SAVE',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Color',
                              hintStyle: TextStyle(
                                color: const Color(0xFF263A4D).withOpacity(0.5),
                              ),
                              fillColor: categoryColor,
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
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // Create Category Objects
                                Category category = Category.empty;
                                category.categoryId = const Uuid().v1();
                                category.name = categoryNameConteoller.text;
                                category.icon = iconSelected;
                                category.color = categoryColor.toString();
                                context
                                    .read<CreateCategoryBloc>()
                                    .add(CreateCategory(category));
                                // Navigator.of(ctx).pop();
                              },
                              child: isLoading == true
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text(
                                      'SAVE',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(
        FontAwesomeIcons.plus,
        size: 16,
      ),
      color: const Color(0xFF263A4D).withOpacity(0.5),
    );
  }
}
