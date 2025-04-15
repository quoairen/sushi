import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/components/button.dart';
import 'package:proj/models/shop.dart';
import 'package:proj/theme/colors.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity cart
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only add to cart if cart is not empty
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let user know its successful
      showDialog(
        barrierDismissible: false,
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: primaryColor,
              content: Text(
                'Successfully added to cart!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    //remove dialog box
                    Navigator.pop(context);
                    //go to previous screen
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done, color: Colors.white),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //listview  of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(widget.food.imagePath, height: 200),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 5),

                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales ex vel dolor varius, eu hendrerit sem malesuada. Cras rhoncus porta bibendum. Maecenas ipsum augue, egestas nec luctus id, interdum tristique libero. Duis venenatis commodo lectus, sollicitudin convallis dolor porttitor sit amet. Pellentesque venenatis diam urna, id pharetra enim viverra sed. Vestibulum consequat fermentum nulla nec dictum. Integer a lorem nec ipsum sodales vehicula sit amet ac mauris.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.food.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: decrementQuantity,
                              icon: Icon(Icons.remove),
                            ),
                          ),

                          //item count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          //increment cart
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: incrementQuantity,
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 25),
                  //add to cart btn
                  MyButton(text: 'Add To Cart', onTap: addToCart),
                ],
              ),
            ),
          ),
          //price quantity + add to cart btn
        ],
      ),
    );
  }
}
