import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shorten_url/constants/app_constants.dart';
import 'package:shorten_url/constants/image_paths.dart';
import 'package:shorten_url/controller/home_controller.dart';
import 'package:shorten_url/utils/extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController homeController) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: buildSvgPicture(),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.paddingExtraLargeWidth),
                  child: Column(
                    children: [
                      context.sizedBoxHeightSmall,
                      buildFormField(context, homeController),
                      context.sizedBoxHeightUltraSmall,
                      buildButton(context, homeController),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  SizedBox buildFormField(BuildContext context, HomeController homeController) {
    return SizedBox(
      height: context.dynamicHeight(0.07),
      width: context.dynamicWidth(1),
      child: TextFormField(
        controller: homeController.urlController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          hintText:
              homeController.isFormEmpty ? "addLink".tr : "shortenLink".tr,
          hintStyle: TextStyle(
            color: homeController.isFormEmpty
                ? Theme.of(context).errorColor
                : Theme.of(context).primaryColor.withOpacity(0.6),
          ),
          contentPadding: const EdgeInsets.all(AppConstants.defaultPadding),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          fillColor: Theme.of(context).disabledColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.extraSmallRadius),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, HomeController homeController) {
    return InkWell(
      onTap: () {
        if (homeController.urlController.text.toString() == "") {
          homeController.boolChanger();
        } else {
          homeController.shortenUrl();
        }
      },
      child: Container(
        height: context.dynamicHeight(0.07),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppConstants.extraSmallRadius),
          ),
        ),
        child: Center(
          child: Text(
            "shorten".tr.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
      ),
    );
  }

  Center buildSvgPicture() {
    return Center(
      child: SvgPicture.asset(
        ImagePaths.backgroundImage,
      ),
    );
  }
}
