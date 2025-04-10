import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/components/button.dart';
import 'package:proj/components/food_tile.dart';
import 'package:proj/models/food.dart';
import 'package:proj/pages/food_details_page.dart';
import 'package:proj/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu

  List foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: '21.0',
      imagePath: 'assets/images/sushi_caviar.png',
      rating: '4.9',
    ),
    Food(
      name: 'Tuna',
      price: '23.00',
      imagePath: 'assets/images/sushi_belt.png',
      rating: '4.3',
    ),
    Food(
      name: 'Temaki',
      price: '26.00',
      imagePath: 'assets/images/temaki.png',
      rating: '5.0',
    ),
  ];

  //navigate to food item details
  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailsPage(
        food: foodMenu[index],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text('Tokyo', style: TextStyle(color: Colors.grey[900])),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 32% promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    MyButton(text: 'Redeem', onTap: () {}),
                  ],
                ),

                Image.asset('assets/images/sushi.png', height: 100),
              ],
            ),
          ),

          SizedBox(height: 25),
          //searc bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search here..',
              ),
            ),
          ),

          SizedBox(height: 25),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 10),

          //popualr food
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder:
                    (context, index) =>
                        FoodTile(food: foodMenu[index], onTap:() => navigateToFoodDetails(index)),
              ),
            ),
          ),

          SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/uramaki.png', height: 60),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salmon Roll',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),

                Icon(Icons.favorite_outline, color: Colors.grey, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
