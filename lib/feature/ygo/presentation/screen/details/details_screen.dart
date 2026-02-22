import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF070a10),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                CardImage(),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      CardRarityLevelInfo(),
                      CardTitle(),
                      Divider(height: 20),
                      CardAttributeInfo(),
                      Divider(height: 20),
                      SizedBox(height: 10),
                      CardDesc(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: StatCard(label: "Attack", value: "3000"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatCard(label: "Defense", value: "2500"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MarketPriceSection(
                        price: "1.49",
                        tcg: "UNLIMITED",
                        ocg: "UNLIMITED",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Image.network(
        'https://images.ygoprodeck.com/images/cards/1861629.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,

          child: Text(
            'BLUE-EYES WHITE DRAGON',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            softWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('LEVEL 8', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}

class CardRarityLevelInfo extends StatelessWidget {
  const CardRarityLevelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ULTRA RARE',
          style: TextStyle(
            fontSize: 18,
            color: Color(0XFF2054bd),
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              for (int i = 0; i < 8; i++)
                Icon(Icons.star_rounded, color: Colors.amber),
            ],
          ),
        ),
      ],
    );
  }
}

class CardDesc extends StatelessWidget {
  const CardDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '2+ Effect Monsters Gains 500 ATK for each monster it points to. When your opponent activates a card or effect that targets a card(s) you control (Quick Effect): You can Tribute 1 monster this card points to; negate the activation, and if you do, destroy that card.',
      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
    );
  }
}

class CardAttributeInfo extends StatelessWidget {
  const CardAttributeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Icono
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFC107), // amarillo
            ),
            child: const Icon(Icons.wb_sunny, size: 16, color: Colors.black),
          ),

          const SizedBox(width: 10),

          // Texto atributo
          const Text(
            'LIGHT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(width: 12),

          // Divider vertical
          Container(height: 18, width: 1, color: Colors.white24),

          const SizedBox(width: 12),

          // Tipo de carta
          const Expanded(
            child: Text(
              '[ Dragon / Normal ]',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MarketPriceSection extends StatelessWidget {
  final String price;
  final String tcg;
  final String ocg;

  const MarketPriceSection({
    super.key,
    required this.price,
    required this.tcg,
    required this.ocg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      // decoration: const BoxDecoration(color: Color(0xFF0D1423)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Precio
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "MARKET PRICE",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$$price",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD54F), // amarillo elegante
                ),
              ),
            ],
          ),

          // Chips
          Row(
            children: [
              _buildChip("TCG: $tcg"),
              const SizedBox(width: 8),
              _buildChip("OCG: $ocg"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF102A43),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.6),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF00E5FF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
