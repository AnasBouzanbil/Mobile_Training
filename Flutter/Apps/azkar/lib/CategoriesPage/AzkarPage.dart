import 'package:azkar/CategoriesPage/AdkahrSHowing.dart';
import 'package:azkar/CategoriesPage/Dua/DuaWidgets.dart';
import 'package:azkar/CategoriesPage/Dua/ShaowAzkar2.dart';
import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:azkar/HomePage/DailyDataPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final TextEditingController _searchController = TextEditingController();
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
        backgroundColor: Colors.teal[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => _showSearchDialog(cubit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return switch (state) {
              CategoriesLoading() => const Center(child: CircularProgressIndicator()),
              CategoriesLoaded() => _buildCategoriesGrid(state.categories, cubit),
              CategoriesError() => const Center(child: Text("فشل تحميل الفئات")),
              _ => const Center(child: Text("حالة غير متوقعة")),
            };
          },
        ),
      ),
    );
  }

  void _showSearchDialog(CategoriesCubit cubit) {
    showSearch(
      context: context,
      delegate: CategorySearchDelegate(
        categories: (cubit.state as CategoriesLoaded).categories,
        onSearchQueryChanged: (query) {
          setState(() => _searchQuery = query);
        },
        cubit: cubit,
      ),
    );
  }

  Widget _buildCategoriesGrid(List<String> categories, CategoriesCubit cubit) {
    final filteredCategories = _getFilteredCategories(categories);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        itemCount: filteredCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return _buildCategoryCard(filteredCategories[index], index, cubit);
        },
      ),
    );
  }

  Widget _buildCategoryCard(String category, int index, CategoriesCubit cubit) {
    return GestureDetector(
      onTap: () => _onCategoryTap(category, index, cubit),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.teal[50],
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
                color: Colors.teal[700],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCategoryTap(String category, int index, CategoriesCubit cubit) {
    if (index == 4) {
      cubit.loadDuaContent();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DuaWidgetee(
            cubit: cubit,
          ),
        ),
      );
    } else {
      cubit.LoadCategoriesContent(category);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubit,
            child: ShowAkhkarez(category),
          ),
        ),
      ).then((_) => cubit.loadCategories());
    }
  }

  List<String> _getFilteredCategories(List<String> categories) {
    return _searchQuery.isEmpty
        ? categories
        : categories
            .where((category) => category.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
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
        icon: const Icon(Icons.clear, color: Colors.white),
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
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildCategoryGrid(_filterCategories(), context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildCategoryGrid(_filterCategories(), context);
  }

  List<String> _filterCategories() {
    return query.isEmpty
        ? categories
        : categories
            .where((category) => category.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  Widget _buildCategoryGrid(List<String> filteredCategories, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: filteredCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return _buildCategoryCard(filteredCategories[index], index, context);
        },
      ),
    );
  }

  Widget _buildCategoryCard(String category, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => _onCategoryTap(category, index, context),
      child: Card(
        elevation: 3,
        color: Colors.teal[50],
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
                color: Colors.teal[700],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void _onCategoryTap(String category, int index, BuildContext context) {
    Fluttertoast.showToast(
        msg: index.toString()  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: const Color.fromARGB(255, 255, 0, 0),
        fontSize: 16.0
    );
    if (index == 4) {
      cubit.loadDuaContent();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DuaWidgetee(
            cubit: cubit,
          ),
        ),
      );
    } else {
      cubit.LoadCategoriesContent(category);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubit,
            child: ShowAkhkarez(category),
          ),
        ),
      ).then((_) => cubit.loadCategories());
    }
  }
}
