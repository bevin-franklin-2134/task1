import 'package:flutter/material.dart';
import 'package:task1/helpers/utils.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildNavItem(0, Icons.home, "Home"),
          buildNavItem(1, Icons.incomplete_circle_outlined, "Portfolio"),
      GestureDetector(
        onTap: () => onItemTapped(2),
        child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: getColorFromHex("3C6CF2"),
              ),
              child: const Icon(Icons.menu_rounded,color: Colors.white,),
            ),
          ),
          buildNavItem(3, Icons.currency_exchange, "Prices"),
          buildNavItem(4, Icons.settings, "Settings"),
        ],
      ),
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: selectedIndex == index ? getColorFromHex("3C6CF2") : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index ? getColorFromHex("3C6CF2") : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
