import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/model/sura_model.dart';

import 'package:islami_app/tabs/quran/custome_text_form_field.dart';
import 'package:islami_app/tabs/quran/quran_details.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SuraModel> filtertSura = SuraModel.suraModelList;
  @override
  void initState() {
    super.initState();
    load();
  }

  Map<String, String?> listSuraShared = {};
  String? searchText;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomeTextFormField(
              hintText: "Sura Name",
              onChanged: (value) {
                searchText = value;
                return search(searchText);
              },
            ),
            searchText == null || searchText!.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth * 0.025,
                            bottom: screenWidth * 0.025),
                        child: Text(
                          "Most Recently",
                          style: AppStyle.boldwhite16,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(17, 12, 0, 20),
                              child: listSuraShared["suraArabicName"] == null &&
                                      listSuraShared["suraEnglishcName"] ==
                                          null &&
                                      listSuraShared["ayaNum"] == null
                                  ? Text(
                                      "No Iteme \nSaved\nRecently",
                                      style: AppStyle.boldBlack24,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "Al-Anbiya"
                                          "${listSuraShared["suraEnglishcName"]}",
                                          style: AppStyle.boldBlack24,
                                        ),
                                        Text(
                                          // "الأنبياء"
                                          "${listSuraShared["suraArabicName"]}",
                                          style: AppStyle.boldBlack24,
                                        ),
                                        Text(
                                          "${listSuraShared["ayaNum"]} Verses",
                                          style: AppStyle.boldBlack14,
                                        ),
                                      ],
                                    ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 9, 7),
                                child: Image.asset(
                                  AssetManegment.mostrecently,
                                  width: screenWidth * 0.35,
                                  height: screenHeight * 0.1459,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenWidth * 0.025,
                  ),
                  child: Text(
                    "Suras List",
                    style: AppStyle.boldwhite16,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            savedSura(filtertSura[index]);
                            Navigator.of(context).pushNamed(
                                QuranDetails.routeName,
                                arguments: filtertSura[index]);
                          },
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetManegment.numquran,
                                height: screenHeight * 0.066,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "${index + 1}",
                                style: AppStyle.boldwhite16,
                              ),
                            ],
                          ),
                          title: Text(
                            filtertSura[index].suraEnglishcName,
                            style: AppStyle.boldwhite20,
                          ),
                          subtitle: Text(
                            "${filtertSura[index].ayaNum} Verses",
                            style: AppStyle.boldwhite14,
                          ),
                          trailing: Text(
                            filtertSura[index].suraArabicName,
                            style: AppStyle.boldwhite20,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            endIndent: screenWidth * 0.155,
                            indent: screenWidth * 0.155,
                            color: AppColor.white,
                            thickness: 1,
                          ),
                      itemCount: filtertSura.length),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void search(String? value) {
    if (value != null) {
      filtertSura = SuraModel.suraModelList.where(
        (element) {
          return element.suraEnglishcName.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              element.suraArabicName.contains(
                value,
              );
        },
      ).toList();
    }
    setState(() {});
    return;
  }

  savedSura(SuraModel suraModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraArabicName', suraModel.suraArabicName);
    await prefs.setString('suraEnglishcName', suraModel.suraEnglishcName);
    await prefs.setString('ayaNum', suraModel.ayaNum);
    load();
  }

  getSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? suraArabicName = prefs.getString('suraArabicName');
    String? suraEnglishcName = prefs.getString('suraEnglishcName');
    String? ayaNum = prefs.getString('ayaNum');

    return {
      'suraArabicName': suraArabicName,
      'suraEnglishcName': suraEnglishcName,
      'ayaNum': ayaNum
    };
  }

  load() async {
    listSuraShared = await getSura();
    setState(() {});
  }
}
