import 'package:departure_bhagavad_geeta/provider/geeta_provider/data_provider.dart';
import 'package:departure_bhagavad_geeta/provider/lang_provider/lang_provider.dart';
import 'package:departure_bhagavad_geeta/provider/theme_provider/theme_provider.dart';
import 'package:departure_bhagavad_geeta/view/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);
    dataProvider.getGeetaData();
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor:
          isLightTheme ? const Color(0xFFFEE39E) : Colors.grey[900],
      appBar: AppBar(
        backgroundColor:
            isLightTheme ? const Color(0xFFFEE39E) : Colors.grey[900],
        title: Text(
          'Bhagavad Geeta App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isLightTheme ? Colors.black : Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Icon(
                  themeProvider.themeModel.isLight
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: isLightTheme ? Colors.black : Colors.white,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<LangProvider>(context, listen: false).changeLang();
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final e = dataProvider.newData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(geeta: e);
                  },
                ),
              );
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color:
                      isLightTheme ? Colors.orange.shade200 : Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: Text(
                      e.chapterNumber.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    title: Text(
                      langProvider.isLangModel.isLang == false
                          ? e.nameMeaning
                          : e.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      e.nameTranslation,
                      style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 8),
        itemCount: dataProvider.newData.length,
      ),
    );
  }
}
