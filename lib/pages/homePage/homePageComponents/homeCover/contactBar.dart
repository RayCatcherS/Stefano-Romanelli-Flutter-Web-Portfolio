import 'package:GameDevPortfolio/appFunctions.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'homeCoverProviderState.dart';

class ContactsBar extends StatelessWidget {
  const ContactsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          // Email contact
          icon: Icon(Icons.email_outlined), 
          color: Colors.white,
          onPressed: () { AppFunctions.openPageInANewTab(context.read<HomeCoverProviderState>().personalEmail); },
          enableFeedback: true,
          hoverColor: Colors.black54,
          splashColor: Colors.black54,
        ),
        const SizedBox(width: kDefaultPadding * 1),
        IconButton(
          // Linkedin
          icon: FaIcon(FontAwesomeIcons.linkedinIn), 
          color: Colors.white,
          onPressed: () { AppFunctions.openPageInANewTab(context.read<HomeCoverProviderState>().linkedinUrl); },
          enableFeedback: true,
          hoverColor: Colors.black54,
          splashColor: Colors.black54,
        )
      ],
    );
  }
}