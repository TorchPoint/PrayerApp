import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/chat_audio_video/widgets/common_audio_video_icons_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            Spacer(flex: 1,),
            _userImageWidget(),
            Spacer(flex: 3,),
            _audioIconsWidget(),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }


  Widget _userImageWidget()
  {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 160.0,
        height: 160.0,
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.WHITE_COLOR,width: 2.0),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.PARTNER_IMAGE),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _audioIconsWidget()
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _microphoneContainerWidget(),
        _chatEndCallContainerWidget(),
        _loudSpeakerContainerWidget(),
      ],
    );
  }
  

  Widget _microphoneContainerWidget()
  {
    return CommonAudioVideoIconsContainer(
      image: AssetPaths.MICROPHONE_ICON,
      imageWidth: 28.0,
      onTap: (){
        log("Microphone");
      }
    );
  }


  Widget _chatEndCallContainerWidget()
  {
    return Column(
      children: [
        CommonAudioVideoIconsContainer(
        image: AssetPaths.CHAT_ICON,
        imageWidth: 29.0,
        onTap: (){
          log("chat");
          AppNavigation.navigateTo(context, ChatScreen());
         }
      ),
        SizedBox(height: MediaQuery.of(context).size.height*0.06),

        CommonAudioVideoIconsContainer(
            image: AssetPaths.END_CALL_ICON,
            containerColor: AppColors.RED_COLOR,
            imageWidth: 28.0,
            shadow: true,
            onTap: (){
              log("end call");
              AppNavigation.navigatorPop(context);
            }
        ),
      ],
    );
  }


  Widget _loudSpeakerContainerWidget()
  {
    return CommonAudioVideoIconsContainer(
        image: AssetPaths.LOUDSPEAKER_ICON,
        imageWidth: 30.0,
        onTap: (){
          log("loudspeaker");
        }
    );
  }



}
