import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070a10),
      appBar: AppBar(
        title: Text('YGO HUB', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0e121a),
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF0e121a),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  CustomSearchBar(),
                  SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () {},
                    onLongPress: () {},
                    label: Text('Attribute'),
                    icon: Icon(Icons.stars),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'FOUND: 1,420 CARDS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),

              child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return CardItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            child: Image.network(
              'https://images.ygoprodeck.com/images/cards_cropped/1861630.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Decode Talker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search card',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Color(0xFF070a10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
