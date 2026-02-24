import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_bloc.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_event.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_state.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DetailsBloc>().add(LoadDetailsEvent(id: widget.id));
  }

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
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DetailsError) {
            return Center(
              child: Text(
                'Error ${state.message}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is DetailsLoaded) {
            final currentState = state.cardDetails;

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
                      CardImage(
                        imageUrl:
                            currentState.imageUrl ??
                            "https://images.ygoprodeck.com/images/cards/1861629.jpg",
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            CardRarityLevelInfo(
                              type: currentState.type ?? '',
                              starQuantity: currentState.level ?? 0,
                            ),
                            CardTitle(
                              name: currentState.name ?? '',
                              level: currentState.level ?? 0,
                            ),
                            Divider(height: 20),
                            CardAttributeInfo(
                              attribute: currentState.attribute ?? '',
                              race: currentState.race ?? '',
                            ),
                            Divider(height: 20),
                            SizedBox(height: 10),
                            CardDesc(desc: currentState.desc ?? ''),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: StatCard(
                                    label: "Attack",
                                    value: currentState.atk ?? 0,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: StatCard(
                                    label: "Defense",
                                    value: currentState.def ?? 0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            MarketPriceSection(
                              price: currentState.cardmarketPrice ?? '',
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
            );
          }
          return const Center(
            child: Text(
              'Presiona para cargar',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String imageUrl;
  const CardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Image.network(imageUrl, fit: BoxFit.fill),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String name;
  final int level;
  const CardTitle({super.key, required this.name, required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,

          child: Text(
            name.toUpperCase(),
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
          child: Text('LEVEL $level', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}

class CardRarityLevelInfo extends StatelessWidget {
  final String type;
  final int starQuantity;
  const CardRarityLevelInfo({
    super.key,
    required this.starQuantity,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.toUpperCase(),
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
              for (int i = 0; i < starQuantity; i++)
                Icon(Icons.star_rounded, color: Colors.amber),
            ],
          ),
        ),
      ],
    );
  }
}

class CardDesc extends StatelessWidget {
  final String desc;
  const CardDesc({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
    );
  }
}

class CardAttributeInfo extends StatelessWidget {
  final String attribute;
  final String race;
  const CardAttributeInfo({
    super.key,
    required this.attribute,
    required this.race,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Icono
          if (attribute.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: attribute == 'LIGHT'
                    ? const Color(0xFFFFC107)
                    : const Color.fromARGB(255, 33, 33, 33),
              ),
              child: attribute == 'LIGHT'
                  ? const Icon(Icons.wb_sunny, size: 16, color: Colors.black)
                  : const Icon(Icons.nightlight, size: 16, color: Colors.white),
            ),

          const SizedBox(width: 10),

          // Texto atributo
          Text(
            attribute,
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
          Expanded(
            child: Text(
              '[ $race ]',
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
  final int value;

  const StatCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
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
            value.toString(),
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
