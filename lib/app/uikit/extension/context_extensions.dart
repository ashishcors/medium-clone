import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/widgets/responsive.dart';

extension BuildContextPlus on BuildContext {
  T whenResponsive<T>(
    T Function() mobile,
    T Function() tablet,
    T Function() desktop,
  ) {
    if (Responsive.isMobile(this)) {
      return mobile();
    } else if (Responsive.isTablet(this)) {
      return tablet();
    } else {
      return desktop();
    }
  }

  bool get isMobile => Responsive.isMobile(this);

  bool get isTablet => Responsive.isTablet(this);

  bool get isDesktop => Responsive.isDesktop(this);
}
