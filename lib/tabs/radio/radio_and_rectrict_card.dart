import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/provider/radio_manager_provider.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/asset_manegment.dart';
import 'package:provider/provider.dart';

class RadioAndRectrictCard extends StatefulWidget {
  const RadioAndRectrictCard({super.key, required this.text, this.audio});
  final String text;
  final String? audio;

  @override
  State<RadioAndRectrictCard> createState() => _RadioAndRectrictCardState();
}

class _RadioAndRectrictCardState extends State<RadioAndRectrictCard> {
  bool isSound = true;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, RadioManagerProvider provider, child) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              provider.isPlay && provider.currentUrl == widget.audio
                  ? AssetManegment.sound
                  : AssetManegment.hadethfooter,
            ),
          ),
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.elMessiri(
                color: AppColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    provider.currentUrl == widget.audio
                        ? provider.setStop()
                        : null;
                  },
                  icon: const Icon(
                    Icons.stop_rounded,
                    size: 52,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    provider.setPlaying(widget.audio!);
                  },
                  icon: SvgPicture.asset(
                      provider.isPlay && provider.currentUrl == widget.audio
                          ? AssetManegment.stop
                          : AssetManegment.play),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    isSound = !isSound;

                    provider.currentUrl == widget.audio
                        ? provider.setVolum(isSound ? 1 : 0)
                        : null;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(isSound
                      ? AssetManegment.volumehight
                      : AssetManegment.volumemute),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      );
    });
  }
}
