

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartgate/colors.dart';

class AlertBox extends StatefulWidget {
  final String title;
  final Widget subtitle;
  final bool yes;
  final bool no;
  final String yesText;
  final String noText;
  final Function yesFunc;
  final Function noFunc;

  const AlertBox({Key key,this.title,this.subtitle,this.yes,this.no,this.yesText,this.noText,this.yesFunc,this.noFunc}) : super(key: key);

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(widget.title,
              style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left),
          content: widget.subtitle,
          actions: [

            widget.no ? FlatButton(
              child: Text(widget.noText,
                  style: GoogleFonts.poppins(
                      color: AppColors.primaryColor, fontSize: 16.5),
                  textAlign: TextAlign.right),
              onPressed: widget.noFunc,
            ) : SizedBox(height: 0,),


            widget.yes?  FlatButton(
                child: Text(widget.yesText,
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 16.5),
                    textAlign: TextAlign.right),
                onPressed: widget.yesFunc
            ) : SizedBox(height: 0,),

          ],
        )
    );
  }
}
