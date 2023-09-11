import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_shop/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text("My Cart", style: GoogleFonts.notoSerif(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                // Cart Items
                value.cartItem.length != 0 ? Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItem.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {

                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,
                            ),
                            child: ListTile(
                              title: Text(value.cartItem[index][0]),
                              subtitle: Text("\$ ${value.cartItem[index][1]}"),
                              trailing: IconButton(
                                onPressed: () =>
                                    Provider.of<CartModel>(context, listen: false)
                                        .removeCartItem(index),
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ),
                        );
                    },
                  ),
                ) : Center(child: const Text("Empty Cart")),

                // Total and Pay Now
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TOTAL", style: GoogleFonts.robotoSlab( color: Colors.grey.shade100),),
                            Text("\$ ${value.calculateTotalAmount()}", style: GoogleFonts.robotoSlab( color: Colors.grey.shade100, fontSize: 18, fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Pay Now", style: GoogleFonts.notoSerif( fontSize: 16, color: Colors.white),),
                              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
