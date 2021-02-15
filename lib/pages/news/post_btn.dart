import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';

class PostBtn extends StatelessWidget {
  final Function onClick;
  final IconData icon;
  final bool isFavBtn;

  const PostBtn({
    Key key,
    this.onClick,
    this.icon,
    this.isFavBtn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlurFilter(
        sigma: 5.0,
        borderRadius: (!isFavBtn)
            ? BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            : BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.pink[700], width: 2),
            borderRadius: (!isFavBtn)
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))
                : BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
          ),
          color: Colors.white.withOpacity(0.2),
          child: Icon(icon),
          onPressed: onClick,
        ),
      ),
    );
  }
}
