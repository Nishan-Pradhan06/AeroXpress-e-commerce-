import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomNavBarDemo extends StatefulWidget {
  @override
  _CustomNavBarDemoState createState() => _CustomNavBarDemoState();
}

class _CustomNavBarDemoState extends State<CustomNavBarDemo> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    LucideIcons.hourglass,
    LucideIcons.messageCircle,
    LucideIcons.shoppingBag,
    LucideIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Selected Page: $_selectedIndex")),
      bottomNavigationBar: Container(
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 80),
              painter: NavBarPainter(),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_icons.length, (index) {
                  bool isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isSelected)
                          CustomPaint(
                            size: Size(40, 20),
                            painter: WavePainter(),
                          ),
                        Icon(
                          _icons[index],
                          color: isSelected ? Colors.blue : Colors.grey[400],
                          size: isSelected ? 28 : 24,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final Path path =
        Path()
          ..moveTo(0, 20)
          ..quadraticBezierTo(0, 0, 20, 0)
          ..lineTo(size.width - 20, 0)
          ..quadraticBezierTo(size.width, 0, size.width, 20)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawShadow(path, Colors.black26, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill;

    final Path path =
        Path()
          ..moveTo(0, size.height)
          ..quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, 0)
          ..quadraticBezierTo(size.width * 0.75, 0, size.width, size.height)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
