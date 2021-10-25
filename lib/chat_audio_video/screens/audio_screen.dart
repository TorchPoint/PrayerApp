import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/chat_audio_video/widgets/common_audio_video_icons_container.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/main.dart';
import 'package:prayer_hybrid_app/models/group_prayer_model.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/prayer_partner_list_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayers_list_screen.dart';
import 'package:prayer_hybrid_app/providers/provider.dart';
import 'package:prayer_hybrid_app/services/API_const.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:provider/provider.dart';

class AudioScreen extends StatefulWidget {
  static String id = "audio";
  final AppUser appUser;
  final GroupPrayerModel groupPrayerModel;
  final String channelName, channelToken;

  AudioScreen(
      {this.appUser,
      this.channelName,
      this.channelToken,
      this.groupPrayerModel});

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  RtcEngine rtcEngine;
  RtcStats rtcStats;
  bool connect = false;

  bool loudSpeaker = false, mute = false;
  BaseService baseService = BaseService();

  Future cancelCall() async {
    var chatProvider = Provider.of<ChatProvider>(context, listen: false);
    await baseService.postBaseMethod(
        "http://server.appsstaging.com:3060/leave-channel", {
      "channel": widget.channelName,
      "user_id": baseService.id
    }).then((value) {
      rtcEngine.leaveChannel();
      rtcEngine.destroy();
      log("end call");
      chatProvider.resetMessageList();
      // AppNavigation.navigatorPop(navigatorKey.currentContext);
      AppNavigation.navigateToRemovingAll(
          navigatorKey.currentContext, DrawerScreen());
    });
  }

  Future<void> _initAgoraRtcEngine() async {
    await [Permission.microphone, Permission.camera].request();
    rtcEngine = await RtcEngine.create(ApiConst.AGORA_APP_ID);
    // await rtcEngine.disableVideo();
    await rtcEngine.enableAudio();

    //rtcEngine.enableAudioVolumeIndication(2, 1, true);
    //await rtcEngine.setEnableSpeakerphone(true);
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(connectionLost: () {
        connect = true;
        log("gone");
        baseService.showToast("Connection Lost", AppColors.ERROR_COLOR);
        cancelCall();
      }, rtcStats: (stats) {
        if (stats.userCount <= 1) {
          // Timer(Duration(seconds: 20), () {
          //   baseService.showToast(
          //       "No Users Avaialabale", AppColors.ERROR_COLOR);
          //   rtcEngine.leaveChannel();
          //   rtcEngine.destroy();
          //   AppNavigation.navigatorPop(context);
          // });
        }
        print("-------" + stats.userCount.toString() + "------");
      }, tokenPrivilegeWillExpire: (event) {
        print("Expired");
        baseService.showToast("About to Expired", AppColors.ERROR_COLOR);
      }, connectionInterrupted: () {
        connect = true;
        setState(() {});
        baseService.showToast("Connection Interrupted", AppColors.ERROR_COLOR);
      }, error: (code) {
        baseService.showToast("${code.toString()}", AppColors.ERROR_COLOR);
        //AppNavigation.navigatorPop(context);
        print("error: ${code.toString()}");
      }, joinChannelSuccess: (String channel, int uid, int elapsed) {
        print("local user $uid joined");
        // print(rtcStats.userCount.toString());
      }, userJoined: (int uid, int elapsed) {
        print("remote user $uid joined");
      }, userOffline: (int uid, UserOfflineReason reason) {
        print("remote user $uid left channel");
        connect = true;
        baseService.showToast(
            "${widget.appUser.firstName} left Call", AppColors.ERROR_COLOR);
        cancelCall();
      }, leaveChannel: (stats) {
        print("-------" + stats.userCount.toString() + "------");
        connect = true;
        cancelCall();
        print("Channel Leaved ${stats.toString()}");
      }),
    );

    await rtcEngine.joinChannel(
        widget.channelToken, widget.channelName, null, baseService.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    baseService.loadLocalUser();
    _initAgoraRtcEngine();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        rtcEngine.leaveChannel();
        rtcEngine.destroy();

        AppNavigation.navigatorPop(context);
        return;
      },
      child: CustomBackgroundContainer(
        child: Scaffold(
          backgroundColor: AppColors.TRANSPARENT_COLOR,
          appBar: AppBar(
            title: Text(
              widget.appUser?.firstName == null
                  ? widget.groupPrayerModel?.name
                  : widget.appUser?.firstName,
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            centerTitle: true,
            backgroundColor: AppColors.TRANSPARENT_COLOR,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              _userImageWidget(),
              Spacer(
                flex: 1,
              ),
              connect == true
                  ? Text(
                      "Reconnecting....",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text(""),
              Spacer(
                flex: 2,
              ),
              _audioIconsWidget(),
              Spacer(
                flex: 1,
              ),
            ],
          ),
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
                        image: widget.appUser?.profileImage == null
                            ? AssetImage(AssetPaths.NO_IMAGE)
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
        containerColor: mute == true
            ? AppColors.MOST_DARK_GREY_COLOR
            : AppColors.WHITE_COLOR,
        onTap: () {
          if (mute == true) {
            mute = false;
            setState(() {});
            rtcEngine.muteLocalAudioStream(false);
          } else {
            mute = true;
            setState(() {});
            rtcEngine.muteLocalAudioStream(true);
          }
          log("Microphone");
        });
  }

  Widget _chatEndCallContainerWidget() {
    return Column(
      children: [
        // CommonAudioVideoIconsContainer(
        //     image: AssetPaths.CHAT_ICON,
        //     imageWidth: 29.0,
        //     onTap: () {
        //       log("chat");
        //       AppNavigation.navigatorPop(context);
        //     }),
        //SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        CommonAudioVideoIconsContainer(
            image: AssetPaths.END_CALL_ICON,
            containerColor: AppColors.RED_COLOR,
            imageWidth: 28.0,
            shadow: true,
            onTap: () {
              cancelCall();
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
