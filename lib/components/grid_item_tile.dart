import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridItemTile extends StatelessWidget {
  final String itemName, itemPrice;

  const GridItemTile(
      {super.key, required this.itemName, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color and opacity
              spreadRadius: 3, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Icon or Image
            const Icon(
              Icons.phone_iphone,
              size: 80,
            ),

            // Item Name
            Text(itemName),

            // Item Price
            Text("\$ $itemPrice", style: GoogleFonts.notoSerif(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
