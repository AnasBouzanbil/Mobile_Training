import 'package:flutter/material.dart';
import 'package:listen/common/helpers/is_dark_mode.dart';



class MiniAppbar extends StatelessWidget  implements PreferredSizeWidget {
  final Widget ? title;
  const MiniAppbar({
this.title,
    super.key

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: title ?? title,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },

        icon: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 25,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );

  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
