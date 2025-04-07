import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25),
            Text(
              'SUSHI',
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/sushi.png'),
            ),

            SizedBox(height: 25),

            Text(
              'THE TASTE OF JAPANESE CUISINE',
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 44,
              ),
            ),

            SizedBox(height: 10),
            Text(
              'Feel the taste of most popular Japanese food from anywhere, anytime',
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),

            SizedBox(height: 25),
            // go to menu page
            MyButton(
              text: 'Get Started',
              onTap: () => {Navigator.pushNamed(context, '/menupage')},
            ),
          ],
        ),
      ),
    );
  }
}
