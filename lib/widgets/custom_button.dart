import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final double? height;
  final Color? color;

  const CustomButton(
      {Key? key, this.onTap, this.title, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppConstants.extraSmallRadius),
          ),
        ),
        child: Center(
          child: Text(
            title!.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
      ),
    );
  }
}
