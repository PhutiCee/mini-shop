import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_shop/model/cart_model.dart';
import 'package:mini_shop/components/grid_item_tile.dart';
import 'package:mini_shop/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              ),
            );
          },
          backgroundColor: Colors.black,
          elevation: 6, // Adjust the elevation if needed
          child: const Icon(
            Icons.shopping_bag,
            size: 50,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            // Welcoming Message
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Welcome"),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "We have fresh Templates for you!",
                style: GoogleFonts.notoSerif(fontSize: 24),
              ),
            ),

            const SizedBox(height: 24),

            // Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                thickness: 2,
              ),
            ),

            // New Template Message
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Fresh Templates"),
            ),

            // Template to Sell
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  // Create a list to keep track of added items
                  List<bool> itemAdded =
                      List.generate(value.shopItem.length, (index) => false);

                  return GridView.builder(
                    itemCount: value.shopItem.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      bool itemInCart = value.isItemInCart(index);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (!itemInCart) {
                              Provider.of<CartModel>(context, listen: false)
                                  .addToCart(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item added to cart successfully.'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item is already in the cart.'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: GridItemTile(
                            itemName: value.shopItem[index][0],
                            itemPrice: value.shopItem[index][1],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 25.0),
              child: Text("~ CodeTechX", style: GoogleFonts.robotoSlab(color: Colors.grey),),
            ),
          ],
        ),
      ),
    );
  }
}
