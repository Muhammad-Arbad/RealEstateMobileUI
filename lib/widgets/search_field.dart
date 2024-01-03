import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search here ...',
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search),
        ],
      ),
    );
  }
}
