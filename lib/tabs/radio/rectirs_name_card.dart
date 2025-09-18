import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/api/rectires_response/rectires_response.dart';
import 'package:islami_app/tabs/radio/rectirs_details.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class RectirsNameCard extends StatelessWidget {
  const RectirsNameCard({
    super.key,
    required this.text,
  });
  final Reciter text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RectirsDetails.routeName, arguments: text);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetManegment.hadethfooter,
            ),
          ),
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          textAlign: TextAlign.center,
          text.name ?? '',
          style: GoogleFonts.elMessiri(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
