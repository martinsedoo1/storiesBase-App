import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesbase/screens/profile/widgets/user.dart';

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileView();
  }
}

class ProfileView extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 6);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: userInfoView(context, _tabController),
      ),
    );
  }
}
