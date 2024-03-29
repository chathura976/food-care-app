import 'package:flutter/material.dart';

import '../models/userModel.dart';
import '../services/api services/user_api_services.dart';
import '../utils/config.dart';
import '../utils/constraints.dart';

class GetUserImage extends StatelessWidget {
  final String id;
  const GetUserImage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: UserAPiServices.getUser(id),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return CircleAvatar(

              backgroundColor: kPrimaryColorlight,
              backgroundImage: user.imageUrl == ""
                  ? AssetImage(icon.toString())
                  : NetworkImage(
                          Config.imageUrl(imageUrl: user.imageUrl.toString()))
                      as ImageProvider<Object>,
            );
          } else {
            return Text('User not found');
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
