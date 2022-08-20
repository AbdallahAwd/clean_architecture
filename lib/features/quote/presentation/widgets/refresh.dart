import 'package:clean_arch/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final VoidCallback onPressed;
  const Refresh({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.DEFAULT_COLOR,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: onPressed),
    );
  }
}
