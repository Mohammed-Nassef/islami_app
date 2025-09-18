import 'package:flutter/material.dart';

import 'package:islami_app/model/hadeeth_model.dart';

import 'package:islami_app/tabs/hadeeth/hadeeth_content_iteme.dart';

import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class HadeethDetails extends StatefulWidget {
  static String routeName = "/HadeethDetails";

  const HadeethDetails({
    super.key,
  });

  @override
  State<HadeethDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<HadeethDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var arg = ModalRoute.of(context)!.settings.arguments as HadeethModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hadith${arg.num}"),
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
                        textAlign: TextAlign.center,
                        arg.title,
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
          Padding(
            padding: EdgeInsets.only(
                top: screenHight * 0.135, bottom: screenHight * 0.022),
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemBuilder: (context, index) => HadeethContentIteme(
                    index: index, contentHadeethList: arg.body),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: arg.body.length),
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
}
