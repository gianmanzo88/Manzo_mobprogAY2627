import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';
 
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Gian Lawrence Manzo',
          postContent: 'LF single mom daw .',
          numOfLikes: 100,
          date: 'October 11',
          avatarPath: 'assets/images/manzo.jpg',
        ),
 
        NewsFeedCard(
          userName: 'Cardo Dalisay',
          postContent: 'Lola Flora X Cardo',
          numOfLikes: 200,
          hasImage: true,
          imagePath: 'assets/images/cardo.jpg',
          avatarPath: 'assets/images/cardodap.jpg',
          date: 'December 2',
        ),
      ],
    );
  }
}