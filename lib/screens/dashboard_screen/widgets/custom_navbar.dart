import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    super.key,
  }) : assert(
          navBarConfig.items.length.isOdd,
          "The number of items must be odd for this style",
        );

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;

  Widget _buildItem(BuildContext context, ItemConfig item, bool isSelected) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IconTheme(
              data: IconThemeData(
                size: IconSize.size35px,
              ),
              child: isSelected ? item.icon : item.inactiveIcon,
            ),
          ),
          if (item.title != null)
            FittedBox(
              child: Text(
                item.title!,
                style: isSelected
                    ? TobetoTextStyle.poppins(context).captionPurpleBold12
                    : TobetoTextStyle.poppins(context).captionGrayNormal12,
              ),
            ),
        ],
      );

  Widget _buildMiddleItem(
          BuildContext context, ItemConfig item, bool isSelected) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: IconSize.size65px,
            height: IconSize.size65px,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: SizeRadius.radius10px,
                ),
              ],
            ),
            child: Center(
              child: IconTheme(
                data: IconThemeData(
                  size: IconSize.size35px,
                ),
                child: isSelected ? item.icon : item.inactiveIcon,
              ),
            ),
          ),
          // if (item.title != null)
          //   Align(
          //     alignment: Alignment.bottomCenter,
          //   ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final midIndex = (navBarConfig.items.length / 2).floor();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: IconSize.size25px),
            DecoratedNavBar(
              decoration: NavBarDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer, //dasbord renk
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      blurRadius: SizeRadius.radius10px,
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(SizeRadius.radius20px))),
              // ignore: deprecated_member_use
              filter: navBarConfig.selectedItem.filter,
              height: IconSize.size60px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: navBarConfig.items.map((item) {
                  final int index = navBarConfig.items.indexOf(item);
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        navBarConfig.onItemSelected(index);
                      },
                      child: index == midIndex
                          ? Container()
                          : _buildItem(
                              context,
                              item,
                              navBarConfig.selectedIndex == index,
                            ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                navBarConfig.onItemSelected(midIndex);
              },
              child: _buildMiddleItem(
                context,
                navBarConfig.items[midIndex],
                navBarConfig.selectedIndex == midIndex,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
