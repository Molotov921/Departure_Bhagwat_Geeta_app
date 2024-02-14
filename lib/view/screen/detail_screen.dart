import 'package:departure_bhagavad_geeta/model/geeta_model.dart';
import 'package:departure_bhagavad_geeta/provider/lang_provider/lang_provider.dart';
import 'package:departure_bhagavad_geeta/provider/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@immutable
class DetailScreen extends StatelessWidget {
  final GeetaModel geeta;

  const DetailScreen({Key? key, required this.geeta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LangProvider langProvider = Provider.of<LangProvider>(context);
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor:
          isLightTheme ? const Color(0xFFFEE39E) : Colors.grey[900],
      appBar: AppBar(
        backgroundColor:
            isLightTheme ? const Color(0xFFFEE39E) : Colors.grey[900],
        elevation: 15,
        centerTitle: true,
        title: Text(
          langProvider.isLangModel.isLang == false
              ? geeta.nameMeaning
              : geeta.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isLightTheme ? Colors.black : Colors.white,
          ),
        ),
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
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isLightTheme ? Colors.orange.shade200 : Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    langProvider.isLangModel.isLang == false
                        ? 'Chapter No. : ${geeta.chapterNumber}'
                        : 'अध्याय संख्या. : ${geeta.chapterNumber}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    langProvider.isLangModel.isLang == false
                        ? 'Chapter Name : ${geeta.nameMeaning}'
                        : 'अध्याय का नाम : ${geeta.name}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/bhagwat_geeta.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isLightTheme ? Colors.orange.shade200 : Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                langProvider.isLangModel.isLang == false
                    ? geeta.chapterSummary
                    : geeta.chapterSummaryHindi,
                style: TextStyle(
                  fontSize: 18,
                  color: isLightTheme ? Colors.black : Colors.white,
                  fontStyle: langProvider.isLangModel.isLang == false
                      ? FontStyle.normal
                      : FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
