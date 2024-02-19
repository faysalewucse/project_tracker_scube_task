import 'package:flutter/material.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Helper/image_source_url.dart';
import 'package:scube_project_tracker/Util/Util%20Widgets/CustomImage.dart';

class PrimaryAppbar extends StatelessWidget {
  const PrimaryAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Scube", style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w700, fontSize: 26),),
      leading: IconButton(
        icon: CustomImage(SvgAssets.DRAWER_SVG_ICON), onPressed: () {  },
      ),
    );
  }
}
