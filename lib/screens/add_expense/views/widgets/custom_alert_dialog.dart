import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customAlertDialog extends StatelessWidget {
  const customAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            textAlignVertical: TextAlignVertical.center,
            readOnly: true,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Icon',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: const Color(0xFF263A4D).withOpacity(0.7),
                ),
              ),
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
  }
}
