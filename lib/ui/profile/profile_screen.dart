import 'package:flutter/material.dart';
import 'package:sport_connection/domain/enums/rank_level_type.dart';
import 'package:sport_connection/domain/models/profile_model.dart';
import 'package:sport_connection/presentation/widgets/bottom_bar.dart';
import 'package:sport_connection/presentation/widgets/event_icon.dart';
import 'package:sport_connection/presentation/widgets/exit_icon.dart';
import 'package:sport_connection/presentation/widgets/home_icon.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = '/profile_screen';

  const ProfileScreen({
    super.key,
    required this.profile,
  });

  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    RankLevelType hankLevelType = RankLevelUtils.getHank(profile?.score ?? 0);
    //var shield = Image.asset(hankLevelType.shield,width: 644,height: 900,);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.asset(hankLevelType.shield,),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: MediaQuery.of(context).size.height * 0.15,
                //top: (MediaQuery.of(context).size.height - shield.height!) / 2,
                //left: (MediaQuery.of(context).size.width - shield.width!) / 2,
                child: Text(
                  profile?.name.toUpperCase() ?? "",
                  style: TextStyle(
                    color: hankLevelType.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  children: [
                    Text('SCR ${profile?.score.toString().padLeft(2, '0')}', style: TextStyle(
                        color: hankLevelType.color,
                        fontSize: 18,
                    ),),
                    const SizedBox(height: 8,),
                    Text('EVT ${0.toString().padLeft(2, '0')}', style: TextStyle(
                        color: hankLevelType.color,
                        fontSize: 18,
                    ),),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.height * 0.28,
                child: Column(
                  children: [
                    Text('ACM ${profile?.achievements.toString().padLeft(2, '0')}', style: TextStyle(
                        color: hankLevelType.color,
                        fontSize: 18,
                    ),),
                    const SizedBox(height: 8,),
                    Text('FRD ${ profile?.eventParticipated.toString().padLeft(2, '0')}', style: TextStyle(
                        color: hankLevelType.color,
                        fontSize: 18,
                    ),),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hankLevelType.status,
                        style: TextStyle(
                          color: hankLevelType.color,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${profile?.name.toUpperCase() ?? ''}, bora participar de eventos e melhorar seus scores!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.person),
      ),
      bottomNavigationBar: const BottomBar(
        items: [
          ExitIcon(),
          EventIcon(),
          SizedBox(
            width: 24,
          ),
          Icon(Icons.search, color: Colors.grey,),
          HomeIcon(),
        ],
      ),
    );
  }

}
