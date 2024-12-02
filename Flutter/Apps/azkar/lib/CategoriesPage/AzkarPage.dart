import 'package:azkar/CategoriesPage/AdkahrSHowing.dart';
import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().loadCategories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الأذكار",
          style: GoogleFonts.amiri(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[700],  // Updated to teal
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () async {
                showSearch(
                  context: context,
                  delegate: CategorySearchDelegate(
                    categories: (cubit.state as CategoriesLoaded).categories,
                    onSearchQueryChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                    cubit: cubit,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return switch (state) {
            CategoriesLoading() => Center(child: CircularProgressIndicator()),
            CategoriesLoaded() => _buildCategoriesGrid(context, state, cubit),
            CategoriesError() => Center(child: Text("فشل تحميل الفئات")),
            _ => Center(child: Text("حالة غير متوقعة")),
          };
        },
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context, CategoriesLoaded state, CategoriesCubit cubit) {
    final filteredCategories = _getFilteredCategories(state.categories);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: GridView.builder(
        itemCount: filteredCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          String category = filteredCategories[index];
          return GestureDetector(
            onTap: () {
              cubit.LoadCategoriesContent(category);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: ShowAkhkarez(category),
                  ),
                ),
              ).then((_) {
                cubit.loadCategories();
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.teal[50],  // Updated to teal
              elevation: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],  // Updated text color to teal
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _getFilteredCategories(List<String> categories) {
    if (_searchQuery.isEmpty) {
      return categories;
    } else {
      return categories.where((category) {
        return category.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }
}

class CategorySearchDelegate extends SearchDelegate {
  final List<String> categories;
  final Function(String) onSearchQueryChanged;
  final CategoriesCubit cubit;

  CategorySearchDelegate({
    required this.categories,
    required this.onSearchQueryChanged,
    required this.cubit,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: Color.fromARGB(255, 255, 255, 255),
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearchQueryChanged(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredCategories = _getFilteredCategories(categories);
    return _buildCategoryList(filteredCategories);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredCategories = _getFilteredCategories(categories);
    return _buildCategoryList(filteredCategories);
  }

  List<String> _getFilteredCategories(List<String> categories) {
    if (query.isEmpty) {
      return categories;
    } else {
      return categories.where((category) {
        return category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  Widget _buildCategoryList(List<String> filteredCategories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          String category = filteredCategories[index];
          return GestureDetector(
            onTap: () {
              cubit.LoadCategoriesContent(category);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: ShowAkhkarez(category),
                  ),
                ),
              ).then((_) {
                cubit.loadCategories();
              });
            },
            child: Card(
              elevation: 3,
              color: Colors.teal[50],  // Updated to teal
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],  // Updated text color to teal
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
