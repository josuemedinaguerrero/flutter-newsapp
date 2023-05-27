import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/services.dart';
import 'package:newsapp/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            Expanded(child: ListaNoticias(noticias: newsService.getArticulosCategoriaSeleccionada!)),
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cName = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = Provider.of<NewsService>(context).selectedCategory;
    final myTheme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(category.icon, color: category.name == selectedCategory ? myTheme.colorScheme.secondary : Colors.black54),
      ),
    );
  }
}
