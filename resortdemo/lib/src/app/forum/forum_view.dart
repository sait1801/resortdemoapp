// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:resortdemo/src/app/forum/forum_controller.dart';
import 'package:resortdemo/src/data/data_reservation_repository.dart';
import 'package:resortdemo/src/app/home/widgets/bottom_nav_bar.dart';

import '../../data/data_message_repository.dart';
import '../home/widgets/primary_button.dart';

class ForumView extends View {
  static const routeName = '/forum';
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ForumViewState(
        ForumController(
          DataMessageRepository(),
        ),
      );
}

class _ForumViewState extends ViewState<ForumView, ForumController>
    with TickerProviderStateMixin {
  _ForumViewState(
    ForumController forumController,
  ) : super(forumController);

  late TabController _tabController;

  @override
  // ignore: invalid_override_of_non_virtual_member
  void initState() {
    super.initState();

    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 300),
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: ControlledWidgetBuilder<ForumController>(
          builder: (context, controller) {
        return bottomNavBar(_tabController, context, 0);
      }),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width - 120, 40, 20, 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 64, 118, 235),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.local_phone,
                        size: 30,
                      ))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ControlledWidgetBuilder<ForumController>(
                  builder: (context, controller) {
                return TextField(
                  onChanged: (text) {
                    controller.name = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    hintText: 'Enter your name',
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: ControlledWidgetBuilder<ForumController>(
                  builder: (context, controller) {
                return TextField(
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    controller.contactNumber = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact Number',
                    hintText: 'Enter your number ex: +905395873678',
                  ),
                );
              }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3 * 2,
              padding: EdgeInsets.all(20),
              child: ControlledWidgetBuilder<ForumController>(
                  builder: (context, controller) {
                return TextField(
                  onChanged: (text) {
                    controller.forumMessage = text;
                  },
                  textAlignVertical: TextAlignVertical.top,
                  maxLength: 400,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    hintText: 'Type your Message',
                    alignLabelWithHint: true,
                  ),
                );
              }),
            ),
            ControlledWidgetBuilder<ForumController>(
                builder: (context, controller) {
              return primaryButton(
                Color(0xff2ECC71),
                Colors.white,
                () {
                  controller.createMessage();
                },
                "Send your message",
                null,
                MediaQuery.of(context).size,
              );
            }),
          ],
        ),
      ),
    );
  }
}
