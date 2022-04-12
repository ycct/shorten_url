import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shorten_url/views/home_view/components/card.dart';
import 'package:shorten_url/constants/image_paths.dart';
import 'package:shorten_url/controller/home_controller.dart';
import 'package:shorten_url/widgets/custom_button.dart';
import 'package:shorten_url/utils/extension.dart';
import '../../constants/app_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController homeController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: context.dynamicWidth(1),
            height: context.dynamicHeight(1),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: homeController.shortenList.isEmpty
                      ? buildSvgPicture(context)
                      : const CustomCard(),
                ),
                Expanded(
                  child: buildBottomBar(context, homeController),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildSvgPicture(BuildContext context) {
    return Column(
      children: [
        context.sizedBoxHeightExtraLarge,
        context.sizedBoxHeightExtraSmall,
        SvgPicture.asset(
          ImagePaths.backgroundImage,
        ),
        Text(
          "started".tr,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        context.sizedBoxHeightUltraSmall,
        Text(
          "pasteLink".tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  Container buildBottomBar(
      BuildContext context, HomeController homeController) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.paddingExtraLargeWidth),
        child: Column(
          children: [
            context.sizedBoxHeightSmall,
            buildFormField(context, homeController),
            context.sizedBoxHeightUltraSmall,
            buildCustomButton(context, homeController),
          ],
        ),
      ),
    );
  }

  SizedBox buildFormField(BuildContext context, HomeController homeController) {
    return SizedBox(
      height: context.dynamicHeight(0.07),
      width: context.dynamicWidth(1),
      child: TextFormField(
        autofocus: false,
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

  CustomButton buildCustomButton(
      BuildContext context, HomeController homeController) {
    return CustomButton(
      title: "shorten".tr,
      height: context.dynamicHeight(0.07),
      onTap: () {
        simpleValidator(context, homeController);
      },
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }

  void simpleValidator(BuildContext context, HomeController homeController) {
    if (homeController.urlController.text.toString() == "") {
      homeController.formValidatorChanger();
    } else {
      buildShowDialog(context);
      homeController.shortenUrl().then((value) => Navigator.pop(context));
      FocusScope.of(context).unfocus();
    }
  }
}
