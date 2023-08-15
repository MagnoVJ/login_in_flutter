import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint() ..color = Color(0xFF56B2F4) ..style = PaintingStyle.fill;
    final rect = RRect.fromRectAndRadius(Rect.fromLTRB(-30, 30, 330, 350), Radius.circular(65));
    canvas.drawRRect(rect, paint);
  }
   @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint() ..color = Color.fromARGB(255, 68, 68, 68) ..strokeWidth = 2;
    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: TextBoxWidget(0, 0));
  }
}
 
class TextBoxWidget extends StatelessWidget {

  TextBoxWidget(this.topValue, this.leftValue);

  final int topValue;
  final int leftValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: buildCustomWidget()));
  }

  @override
  Widget buildCustomWidget() {
    //return MaterialApp(home: Scaffold(body: Center(child: Text('Login', style:GoogleFonts.poppins( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 36))))));
    return Stack(children: [
      Positioned(
        top: 3 + topValue.toDouble(),
        left: 245 + leftValue.toDouble(),
        child: Container(
          width: 30,
          height: 30,
          //color: Colors.red,
          child: Image.asset('assets/login-logo-removebg-preview.png')
          //child: Text('Login', style:GoogleFonts.poppins( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)))
        )
      ),
      Positioned(
        top: 30 + topValue.toDouble(),
        left: 0 + leftValue.toDouble(),
        child: Container(
          width: 276,
          height: 10,
          //color: Colors.red,
          child: CustomPaint(painter: LinePainter())
          //child: Text('Login', style:GoogleFonts.poppins( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)))
        )
      ),
      Positioned(
        top: 0 + topValue.toDouble(),
        left: 0 + leftValue.toDouble(),
        child: Container(
          width: 276,
          height: 50,
          //color: Colors.red,
          child: TextField(maxLength: 25, style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 22)), decoration: InputDecoration(counterText: '', focusedBorder: InputBorder.none,border: InputBorder.none,hintText: "Nome"))
          //child: Text('Login', style:GoogleFonts.poppins( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)))
        )
      )
      //Text('Login', style:GoogleFonts.poppins( textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
      //CustomPaint(painter: LinePainter(), child: Container(width: 134, height:15)), //Line underneath Login
      //CustomPaint(painter: RectanglePainter(), child: Column(children: [TextBoxWidget()])), //Blue Square
      //CustomPaint(painter: RectanglePainter()), //Blue Square
      ]);
  }
}