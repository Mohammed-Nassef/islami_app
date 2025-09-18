import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth_model.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_details.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class HadeethCard extends StatefulWidget {
  final int index;

  const HadeethCard({super.key, required this.index});

  @override
  State<HadeethCard> createState() => _HadeethCardState();
}

class _HadeethCardState extends State<HadeethCard> {
  HadeethModel? _hadeethModel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    if (_hadeethModel == null) {
      loadHadeeth();
    }
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadeethDetails.routeName, arguments: _hadeethModel);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetManegment.hadethcardbackground,
            ),
          ),
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          height: screenHeight * 0.12,
                          fit: BoxFit.fill,
                          AssetManegment.hadethleftcorner,
                        ),
                      ),
                      _hadeethModel == null
                          ? const Text(" ")
                          : Expanded(
                              flex: 3,
                              child: Text(
                                textAlign: TextAlign.center,
                                _hadeethModel!.title,
                                style: AppStyle.boldBlack24,
                              ),
                            ),
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            AssetManegment.hadethrightcorner,
                            height: screenHeight * 0.12,
                            fit: BoxFit.fill,
                          ))
                    ],
                  ),
                ),
                _hadeethModel == null
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                            AppColor.black, BlendMode.srcIn),
                        child: Image.asset("assets/icon/Loading.gif"),
                      )
                    : Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * 0.025),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Text(
                              textAlign: TextAlign.center,
                              _hadeethModel!.body[index],
                              style: AppStyle.boldBlack16,
                            ),
                            itemCount: _hadeethModel!.body.length,
                          ),
                        ),
                      ),
              ],
            ),
            Image.asset(
              AssetManegment.hadethfooter,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeeth() async {
    String hadeeth = await rootBundle
        .loadString("assets/text/Hadeeth/h${widget.index + 1}.txt");
    List<String> hadeethList = hadeeth.split("\n");
    String title = hadeethList[0];
    hadeethList.removeAt(0);

    _hadeethModel =
        HadeethModel(title: title, body: hadeethList, num: widget.index + 1);
    setState(() {});
  }
}
