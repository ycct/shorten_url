import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shorten_url/controller/home_controller.dart';
import 'package:shorten_url/utils/extension.dart';
import '../../../widgets/custom_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController homeController) {
        return SizedBox(
          width: context.dynamicWidth(0.8),
          child: ListView.builder(
            itemCount: homeController.shortenList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.paddingSmallHeight),
                child: Container(
                  height: context.dynamicHeight(0.22),
                  child: homeController.mainDataModel != null
                      ? buildCardsColumn(homeController, index, context)
                      : const SizedBox(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildCardsColumn(
      HomeController homeController, int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.paddingDefaultWidth,
          vertical: context.paddingExtraSmallHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow(homeController, index, context),
          Divider(color: Theme.of(context).dividerColor),
          buildText(homeController, index, context),
          context.sizedBoxHeightExtraSmall,
          buildCustomButton(homeController, index, context)
        ],
      ),
    );
  }

  Row buildRow(HomeController homeController, int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          homeController.shortenList[index].result!.originalLink,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        InkWell(
          onTap: () {
            homeController.deleteFromList(homeController.shortenList, index);
          },
          child: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
    );
  }

  Text buildText(
      HomeController homeController, int index, BuildContext context) {
    return Text(
      homeController.shortenList[index].result!.shortLink,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  CustomButton buildCustomButton(
      HomeController homeController, int index, BuildContext context) {
    return CustomButton(
      title: homeController.isCopiedList[index] ? "copied".tr : "copy".tr,
      height: context.dynamicHeight(0.06),
      color: homeController.isCopiedList[index]
          ? Theme.of(context).backgroundColor
          : Theme.of(context).primaryColor,
      onTap: () {
        copyAndAddList(homeController, index);
      },
    );
  }

  void copyAndAddList(HomeController homeController, int index) {
    Clipboard.setData(
      ClipboardData(text: homeController.shortenList[index].result!.shortLink),
    ).whenComplete(
        () => homeController.copiedMethod(homeController.isCopiedList, index));
    homeController.copiedMethod(homeController.isCopiedList, index);
  }
}
