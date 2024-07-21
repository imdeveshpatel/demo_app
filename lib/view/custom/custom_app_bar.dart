import 'package:demo_app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar getAppBar(
      {required String title,
      final VoidCallback? onPressed,
      final VoidCallback? onSearchPressed,
      bool hasBackPress = true,
      bool hasSearchPress = false}) {
    return AppBar(
      automaticallyImplyLeading: hasBackPress,
      toolbarHeight: 60,
      leading: Visibility(
        visible: hasBackPress,
        child: BackButton(
          color: AppColors().white,
          onPressed: onPressed,
        ),
      ),
      actions: <Widget>[
        Visibility(
          visible: hasSearchPress,
          child: IconButton(
            color: AppColors().white,
            onPressed: onSearchPressed,
            icon: const Icon(Icons.search),
            tooltip: 'Open search ',
          ),
        ),
      ],
      backgroundColor: AppColors().darkBlue,
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: AppColors().white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
