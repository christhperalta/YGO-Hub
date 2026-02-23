import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ygo_hub/core/utils/number_formatter.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_bloc.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_event.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YGO HUB', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0e121a),
        scrolledUnderElevation: 0.0,
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          // Usamos switch de expresión o validamos bien los casos
          if (state is CardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CardError) {
            return const Center(
              child: Text('Error', style: TextStyle(color: Colors.white)),
            );
          }

          if (state is CardLoaded) {
            return Column(
              children: [
                Container(
                  color: const Color(0xFF0e121a),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      // CORREGIDO: EdgeInsets en lugar de EdgeInsetsGeometry
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        const CustomSearchBar(),
                        const SizedBox(height: 10),
                        // FilledButton.icon(
                        //   onPressed: () {},
                        //   label: const Text('Attribute'),
                        //   icon: const Icon(Icons.stars),
                        //   onLongPress: () {},
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'FOUND:  ${NumberFormatter.formatNumber(state.cards.length)}  CARDS', // Dinámico: usa los datos del estado
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ), // CORREGIDO: EdgeInsets
                    child: state.filteredList.isEmpty
                        ? Center(
                            child: Text(
                              'Not Found',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : GridView.builder(
                            itemCount: state
                                .filteredList
                                .length, // Usa el largo real de la lista
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing:
                                      8, // Añadido para que no se peguen
                                  childAspectRatio: 0.7,
                                ),
                            itemBuilder: (context, index) {
                              final currentCard = state.filteredList[index];
                              return CardItem(
                                id: currentCard.id,
                                name: currentCard.name,
                                imageUrl: currentCard.imageUrl,
                              ); // Pasa la carta real
                            },
                          ),
                  ),
                ),
              ],
            );
          }

          // Caso inicial (CardInitial)
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

class CardItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  const CardItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details', extra: id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Container(color: Colors.grey[900]),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    name,
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
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        context.read<CardBloc>().add(SearchCardEvent(name: value));
      },
      decoration: InputDecoration(
        hintText: 'Search card',
        hintStyle: TextStyle(color: Colors.white),

        prefixIcon: Icon(Icons.search, color: Colors.white),
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
