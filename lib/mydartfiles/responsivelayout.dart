import 'package:flutter/material.dart';
import 'responsiveLayoutconstants.dart';

class LayoutResponse extends StatelessWidget {
  const LayoutResponse({
    required this.mobileBody,
    required this.desktopBody
  }) ;

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth < kTabletBreakpoint){
            return mobileBody;
          } else{
            return desktopBody ?? mobileBody;
          }
        }
    );
  }
}
