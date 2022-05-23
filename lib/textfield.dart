import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartgate/screenconfig.dart';

class TextFieldWidget extends StatelessWidget  implements PreferredSizeWidget {

  Size get preferredSize => const Size.fromHeight(50);

  final String text;
  final TextEditingController txtController;
  final Widget icon;
  final int maxLength;
  final TextInputType keyboardType;
  final bool autofocus;
  final Function onchange;
  final bool isCapitals;

  const TextFieldWidget({
    Key key,
    this.text,
    this.txtController,
    this.icon,
    this.maxLength,
    this.keyboardType,
    this.autofocus,
    this.onchange,
    this.isCapitals,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight(context) * 0.07,
        width: screenWidth(context) * 0.90,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: icon
            ),
            Flexible(
              child: TextField(
                textCapitalization: isCapitals != null ? TextCapitalization.characters : TextCapitalization.none,
                onChanged: onchange,
                autofocus: autofocus,
                maxLength: maxLength == null ? 25 : maxLength,
                keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
                controller: txtController,
                decoration: InputDecoration(
                  hintText: text,
                  border: InputBorder.none,
                  counterText: "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
