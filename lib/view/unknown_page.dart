import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class UnknownPage extends StatelessWidget {
  final String error;

  const UnknownPage({super.key, this.error = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          error.isNotEmpty
              ? "error_parms".trParams({"error": error})
              : "unknown_error".tr,
        ),
      ),
    );
  }
}
