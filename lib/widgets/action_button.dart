import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isCircular; // New parameter to control shape
  final VoidCallback onTap; // Added onTap parameter

  const ActionButton({
    Key? key,
    required this.label,
    required this.icon,
    this.isCircular = false, // Default to false (normal button)
    required this.onTap, // Added onTap parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the theme
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Default to black if null
    final iconColor = theme.iconTheme.color ?? Colors.black; // Default to black if null

    return GestureDetector(
      onTap: onTap, // Trigger onTap when button is tapped
      child: Container(
        width: isCircular ? 50 : 125, // Adjust width for circular button
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle, // Change shape
          borderRadius: isCircular ? null : BorderRadius.circular(20), // Rounded edges if not circular
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center items inside container
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
            if (!isCircular) ...[
              SizedBox(width: 5), // Space between icon and text
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Apply text color from theme
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
