import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';
import 'package:islami_app/tabs/quran/aya_iteme.dart';

class QuranDetails extends StatefulWidget {
  static String routeName = "/QuranDetails";

  const QuranDetails({
    super.key,
  });

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var arg = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraList.isEmpty) {
      loadSura(arg.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.suraEnglishcName),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetManegment.maskleft,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Text(
                        arg.suraArabicName,
                        textAlign: TextAlign.center,
                        style: AppStyle.boldPrimarycolor24,
                      ),
                    ),
                    Image.asset(
                      AssetManegment.maskright,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
          suraList.isEmpty
              ? Center(
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        AppColor.primaryColor, BlendMode.srcIn),
                    child: Image.asset("assets/icon/Loading.gif"),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      top: screenHight * 0.135, bottom: screenHight * 0.03),
                  child: ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      itemBuilder: (context, index) =>
                          AyaIteme(index: index, suraList: suraList),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: suraList.length),
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AssetManegment.footer,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSura(String fileName) async {
    String sura =
        await rootBundle.loadString("assets/text/Suras/$fileName.txt");
    suraList = sura.split('\n');
    setState(() {});
  }
}
