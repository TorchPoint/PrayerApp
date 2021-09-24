import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/audio_screen.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/video_screen.dart';
import 'package:prayer_hybrid_app/common_classes/image_gallery_class.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_chat_app_bar.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  final AppUser user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  IO.Socket socket;
  List<String> userMessage = [];
  TextEditingController _sendMessageController = TextEditingController();
  File profileFileImage;
  String profileImagePath;
  ImageGalleryClass imageGalleryClass = ImageGalleryClass();
  BaseService baseService = BaseService();

  void connect() {
    socket = IO.io('https://server.appsstaging.com:3099', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    print(socket.connected);
    print(socket.io.uri);
    print(socket.io.autoConnect);
    print(socket.io.options);
    socket.onError((data) {
      print("erroe");
    });
    socket.onConnectError((data) => print("error"));
    socket.onConnect((data) {
      print("connected");
    });
    socket.onConnectTimeout((data) {
      print(data);
      print("timeout");
    });
  }

  void sendMessage(text) {
    setState(() {
      if (_sendMessageController.text.isNotEmpty) {
        userMessage.add(text);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    connect();
    baseService.loadLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customChatAppBar(),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: userMessage.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return baseService.id != widget.user.id
                        ? sendUser(userMessage[index])
                        : receiveUser(userMessage[index]);
                  }),
            ),
            SizedBox(
              height: 7.0,
            ),
            _sendMessageContainerWidget(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  //Custom Chat App Bar Widget
  Widget _customChatAppBar() {
    return CustomChatAppBar(
      title: "${widget.user.firstName + " " + widget.user.lastName}" ??
          AppStrings.CHAT_USER_NAME,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: () {
        print("Leading tap");
        AppNavigation.navigatorPop(context);
      },
      // trailingVideoIconPath: AssetPaths.VIDEO_ICON,
      // trailingVideoTap: () {
      //   AppNavigation.navigateTo(context, VideoScreen());
      // },
      trailingAudioIconPath: AssetPaths.AUDIO_ICON,
      trailingAudioTap: () {
        AppNavigation.navigateTo(context, AudioScreen());
      },
    );
  }

  Widget sendUser(String sendMessage) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: 10.0,
          bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: AppColors.BUTTON_COLOR,
                borderRadius: BorderRadius.circular(5.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Text(
                sendMessage.toString(),
                style: TextStyle(
                    color: AppColors.WHITE_COLOR, fontWeight: FontWeight.w800),
                textScaleFactor: 1.05,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget receiveUser(String receiveMessage) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: 10.0,
          bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: widget.user.profileImage == null
                      ? AssetImage(AssetPaths.PROFILE_IMAGE)
                      : NetworkImage(widget.user.profileImage),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            width: 10.0,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width * 0.55),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(5.5),
              ),
              child: Text(
                receiveMessage,
                style: TextStyle(
                    color: AppColors.BLACK_COLOR, fontWeight: FontWeight.w700),
                textScaleFactor: 1.05,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendMessageContainerWidget() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 0.0, maxHeight: MediaQuery.of(context).size.height * 0.15),
      child: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            bottom: 10,
            right: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Expanded(child: _sendMessageTextField()),
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 2.0, bottom: 2.0),
              child: GestureDetector(
                onTap: () {
                  _imageGalleryOption();
                },
                child: Image.asset(
                  AssetPaths.ATTACHMENT_ICON,
                  width: 23.0,
                  height: 23.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0, top: 2.0, bottom: 2.0),
              child: GestureDetector(
                onTap: () {
                  sendMessage(_sendMessageController.text);
                  _sendMessageController.clear();
                },
                child: Image.asset(
                  AssetPaths.SEND_CHAT_IMAGE,
                  width: 30.0,
                  height: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sendMessageTextField() {
    return TextField(
      onTap: () {},
      controller: _sendMessageController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColors.WHITE_COLOR)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColors.WHITE_COLOR)),
        isCollapsed: true,
        hintText: AppStrings.CHAT_MESSAGE_HINT_TEXT,
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: AppColors.BLACK_COLOR.withOpacity(0.4),
          fontWeight: FontWeight.w500,
        ),
        contentPadding:
            EdgeInsets.only(top: 15.0, bottom: 15.0, left: 12.0, right: 12.0),
        fillColor: AppColors.WHITE_COLOR,
        filled: true,
      ),
      style: TextStyle(
        fontSize: 15.0,
        color: AppColors.BLACK_COLOR,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.BLACK_COLOR,
      maxLines: null,
    );
  }

  //Select Image Start
  void _imageGalleryOption() {
    imageGalleryClass.imageGalleryBottomSheet(
        context: context,
        onCameraTap: () {
          _getImage(imageText: AppStrings.CAMERA_TEXT);
        },
        onGalleryTap: () {
          _getImage(imageText: AppStrings.GALLERY_TEXT);
        });
  }

  void _getImage({String imageText}) async {
    if (imageText == AppStrings.CAMERA_TEXT) {
      profileImagePath = await imageGalleryClass.getCameraImage();
      _cropImage(imagePath: profileImagePath);
    } else if (imageText == AppStrings.GALLERY_TEXT) {
      profileImagePath = await imageGalleryClass.getGalleryImage();
      _cropImage(imagePath: profileImagePath);
    }
  }

  void _cropImage({String imagePath}) async {
    //Ya use hoa modal bottom sheet ko remove krna ka liya
    AppNavigation.navigatorPop(context);

    if (imagePath != null) {
      profileFileImage =
          await imageGalleryClass.cropImage(imageFilePath: imagePath);

      if (profileFileImage != null) {}

      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _sendMessageController.dispose();
  }
}
