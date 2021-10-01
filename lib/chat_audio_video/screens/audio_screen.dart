import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/chat_audio_video/widgets/common_audio_video_icons_container.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/services/API_const.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class AudioScreen extends StatefulWidget {
  final AppUser appUser;

  AudioScreen({this.appUser});

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  RtcEngine rtcEngine;

  bool loudSpeaker = false, mute = false;

  Future<void> _initAgoraRtcEngine() async {
    await [Permission.microphone, Permission.camera].request();
    rtcEngine = await RtcEngine.create(ApiConst.AGORA_APP_ID);
    await rtcEngine.disableVideo();
    await rtcEngine.enableAudio();
    await rtcEngine.setEnableSpeakerphone(true);
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(error: (code) {
        print("error: ${code.toString()}");
      }, joinChannelSuccess: (String channel, int uid, int elapsed) {
        print("local user $uid joined");
      }, userJoined: (int uid, int elapsed) {
        print("remote user $uid joined");
      }, userOffline: (int uid, UserOfflineReason reason) {
        print("remote user $uid left channel");
      }, leaveChannel: (stats) {
        print("Channel Leaved ${stats.toString()}");
      }),
    );

    // await rtcEngine.joinChannel(null, "test", null,0);
    //
    await rtcEngine.joinChannel(
        "006d16d4a2e151647c18a8a2a99d57593a7IABvvOG+MlzD1sCnvvVdNGfT7tJ1IFVcGp2FZ3nYrRy/Jzrs1w9fsThcIgAYhQAAo2NYYQQAAQAzIFdhAwAzIFdhAgAzIFdhBAAzIFdh",
        "testc",
        null,
        0);
  }

  @override
  void initState() {
    // TODO: implement initState
    _initAgoraRtcEngine();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    rtcEngine.leaveChannel();
    rtcEngine.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            _userImageWidget(),
            Spacer(
              flex: 3,
            ),
            _audioIconsWidget(),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _userImageWidget() {
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
                      border:
                          Border.all(color: AppColors.WHITE_COLOR, width: 2.0),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.appUser.profileImage == null
                            ? AssetImage(AssetPaths.PARTNER_IMAGE)
                            : NetworkImage(widget.appUser.profileImage),
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

  Widget _audioIconsWidget() {
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

  Widget _microphoneContainerWidget() {
    return CommonAudioVideoIconsContainer(
        image: AssetPaths.MICROPHONE_ICON,
        imageWidth: 28.0,
        onTap: () {
          log("Microphone");
        });
  }

  Widget _chatEndCallContainerWidget() {
    return Column(
      children: [
        CommonAudioVideoIconsContainer(
            image: AssetPaths.CHAT_ICON,
            imageWidth: 29.0,
            onTap: () {
              log("chat");
              AppNavigation.navigatorPop(context);
            }),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        CommonAudioVideoIconsContainer(
            image: AssetPaths.END_CALL_ICON,
            containerColor: AppColors.RED_COLOR,
            imageWidth: 28.0,
            shadow: true,
            onTap: () {
              log("end call");
              AppNavigation.navigatorPop(context);
            }),
      ],
    );
  }

  Widget _loudSpeakerContainerWidget() {
    setState(() {});
    return CommonAudioVideoIconsContainer(
        containerColor: loudSpeaker == true
            ? AppColors.MOST_DARK_GREY_COLOR
            : AppColors.WHITE_COLOR,
        image: AssetPaths.LOUDSPEAKER_ICON,
        imageWidth: 30.0,
        onTap: () {
          log("loudspeaker");
          if (loudSpeaker == true) {
            loudSpeaker = false;
            print(loudSpeaker);

            setState(() {});
            rtcEngine.setEnableSpeakerphone(false);
          } else {
            loudSpeaker = true;
            print(loudSpeaker);
            setState(() {});
            rtcEngine.setEnableSpeakerphone(true);
          }
        });
  }
}
