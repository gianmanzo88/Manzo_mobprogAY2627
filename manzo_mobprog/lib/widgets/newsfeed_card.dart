import 'package:flutter/material.dart';
 
class NewsFeedCard extends StatefulWidget {
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    this.hasImage = false,
    this.imagePath,
    this.avatarPath,
  });
 
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String? imagePath;
  final String? avatarPath;
 
  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}
 
class _NewsFeedCardState extends State<NewsFeedCard> {
  bool isLiked = false;
  final TextEditingController commentController =
      TextEditingController();
 
  final List<String> comments = [];
 
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
 
  void addComment() {
    final comment = commentController.text.trim();
 
    if (comment.isNotEmpty) {
      setState(() {
        comments.add(comment);
        commentController.clear();
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 
            // USER PROFILE
            Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: widget.avatarPath != null
                      ? AssetImage(widget.avatarPath!)
                      : null,
                  child: widget.avatarPath == null
                      ? const Icon(Icons.person)
                      : null,
                ),
 
                const SizedBox(width: 10),
 
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
 
                const Icon(Icons.more_horiz),
              ],
            ),
 
            const SizedBox(height: 15),
 
            // POST CONTENT
            Text(
              widget.postContent,
              style: const TextStyle(fontSize: 14),
            ),
 
            const SizedBox(height: 10),
 
            // OPTIONAL POST IMAGE
            if (widget.hasImage)
              widget.imagePath != null
                  ? Image.asset(
                      widget.imagePath!,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.image,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
 
            const SizedBox(height: 12),
 
            // LIKE, COMMENT, SHARE
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_outlined,
                    color: isLiked
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  label: Text(
                    '${widget.numOfLikes + (isLiked ? 1 : 0)}',
                  ),
                ),
 
                TextButton.icon(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                  ),
                  label: const Text('Comment'),
                ),
 
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text('Share clicked'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.share_outlined),
                  label: const Text('Share'),
                ),
              ],
            ),
 
            const Divider(),
 
            // COMMENT INPUT
            Row(
              children: [
                const CircleAvatar(
  radius: 16,
  backgroundImage: AssetImage(
    'assets/images/manzo.jpg',
  ),
),
                const SizedBox(width: 8),
 
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => addComment(),
                  ),
                ),
 
                IconButton(
                  onPressed: addComment,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
 
            // DISPLAY COMMENTS
            for (final comment in comments)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(comment),
              ),
 
            const SizedBox(height: 8),
 
            Text(
              'View comments (${comments.length})',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}