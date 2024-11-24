import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  MyDialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(200),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ensures the dialog adjusts to content
          children: [
            const SizedBox(height: 10),
            // User Data Input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Add a New Task",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),

            const SizedBox(height: 10), // Add spacing between input and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: onCancel,
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the value for roundness
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: onSave,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the value for roundness
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
