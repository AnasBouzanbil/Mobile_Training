
import 'package:azkar/CategoriesPage/Dua/ShaowAzkar2.dart';
import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:azkar/HomePage/DailyDataPage.dart';
import 'package:azkar/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class DuaWidgetee extends StatefulWidget {
  final CategoriesCubit cubit;

  const DuaWidgetee({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  _DuaWidgeteeState createState() => _DuaWidgeteeState();
}

class _DuaWidgeteeState extends State<DuaWidgetee> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: _showSearchDialog,
          ),
        ],
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal[700],
            // color: const Color.fromARGB(255, 1, 107, 95),

          ),
          child: IconButton(onPressed: () {
    Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Replace with your homepage widget
              (route) => false, // Remove all previous routes
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is DuaContentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DuaContentLoaded) {
            return _buildDuaContent(state.duaContent);
          } else if (state is DuaContentError) {
            return Center(child: Text("خطأ: ${state.message}"));
          } else {
            return const Center(child: Text("حالة غير متوقعة"));
          }
        },
      ),
    );
  }

  // Show the search dialog to filter the duas
  void _showSearchDialog() {
    showSearch(
      context: context,
      delegate: DuaSearchDelegate(
        duaContent: (context.read<CategoriesCubit>().state as DuaContentLoaded).duaContent,
        onSearchQueryChanged: (query) {
          setState(() => _searchQuery = query);
        },
      ),
    );
  }

  // Build the filtered dua content based on the search query
  Widget _buildDuaContent(List<Map<String, dynamic>> duaContent) {
    final filteredDuaContent = _getFilteredDuaContent(duaContent);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: filteredDuaContent.isEmpty
          ? const Center(
              child: Text(
                "لا توجد أذكار متاحة",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: filteredDuaContent.length,
              itemBuilder: (context, index) {
                final dua = filteredDuaContent[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAzkar2(category: dua),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.teal[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          dua["category"],
                          style: GoogleFonts.amiri(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.teal[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  // Filter the duas based on the search query
  List<Map<String, dynamic>> _getFilteredDuaContent(List<Map<String, dynamic>> duaContent) {
    return _searchQuery.isEmpty
        ? duaContent
        : duaContent
            .where((dua) => dua["category"].toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
  }
}
class DuaSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> duaContent;
  final Function(String) onSearchQueryChanged;

  DuaSearchDelegate({
    required this.duaContent,
    required this.onSearchQueryChanged,
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
    return _buildDuaGrid(_filterDuaContent(), context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildDuaGrid(_filterDuaContent(), context);
  }

  List<Map<String, dynamic>> _filterDuaContent() {
    return query.isEmpty
        ? duaContent
        : duaContent
            .where((dua) => dua["category"].toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  Widget _buildDuaGrid(List<Map<String, dynamic>> filteredDuaContent, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: filteredDuaContent.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final dua = filteredDuaContent[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowAzkar2(category: dua),
                ),
              );
            },
            child: Card(
              elevation: 3,
              color: Colors.teal[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    dua["category"],
                    style: GoogleFonts.amiri(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.teal[700],
                    ),
                    textAlign: TextAlign.center,
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
