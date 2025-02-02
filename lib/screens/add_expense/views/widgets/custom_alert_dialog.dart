import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

            return StatefulBuilder(
              builder: (context, setState) {
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
                              color: const Color(0xFF263A4D).withOpacity(0.7),
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
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/${categoryIcons[i]}.png',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Color',
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
                );
              },
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
