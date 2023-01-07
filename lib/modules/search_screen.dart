import 'package:the_consultant/language/language.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/main.dart';
import 'package:the_consultant/modules/favorites_screen.dart';
import 'package:the_consultant/shared/components/category_card.dart';
import 'package:the_consultant/shared/components/expert_card.dart';
import 'package:the_consultant/shared/components/search_bar.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: DropdownButton<Language>(
                        underline: const SizedBox(),
                        icon: Icon(
                          Icons.language,
                          color: kTitleTextColor,
                        ),
                        onChanged: (Language? language) async {
                          if (language != null) {
                            Locale _locale = await setLocale(
                                language.languageCode);
                            MyApp.setLocale(context, _locale);
                          }
                        },
                        items: Language.languageList()
                            .map<DropdownMenuItem<Language>>(
                              (e) =>
                              DropdownMenuItem<Language>(
                                value: e,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: <Widget>[
                                    Text(
                                      e.flag,
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                    Text(e.name)
                                  ],
                                ),
                              ),
                        )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  translation(context).find,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

}