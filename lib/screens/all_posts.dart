import 'package:flutter/material.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({super.key});

  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  final List<Map<String, dynamic>> posts = [
    {
      "username": "John Doe",
      "date": "30 July 2024",
      "content": "This is the first post!",
      "imageUrl": "assets/post.png",
      "caption": "Caption will be here",
      "comments": [
        "Great post!",
        "I totally agree!",
        "Great post!",
        "I totally agree!",
        "Great post!",
        "I totally agree!"
      ],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "assets/post.png",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    {
      "username": "Jane Smith",
      "date": "24 July 2024",
      "content": "Loving the new update!",
      "imageUrl": "assets/post.png",
      "caption": "Had a wonderful day exploring new places.",
      "comments": ["So glad you enjoyed it!", "Where did you go?"],
    },
    // Additional posts...
  ];

  void _showCommentsSheet(int postIndex) {
    final post = posts[postIndex];
    final TextEditingController _commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff181636),
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 0.8,
                    indent: 5,
                    endIndent: 8,
                    color: Color(0xffE1ECFC),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: post['comments'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/avatar.png'),
                                        radius: 16,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'User Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff181636),
                                          letterSpacing: 0.15,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '1 day ago',
                                        style: TextStyle(
                                            color: Color(0xff55555A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.1),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.favorite_border),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  post['comments'][index],
                                  style: const TextStyle(
                                      color: Color(0xff55555A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.1),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.png'),
                          radius: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(48.0),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.send),
                                color: Colors.blue,
                                onPressed: () {
                                  final newComment =
                                      _commentController.text.trim();
                                  if (newComment.isNotEmpty) {
                                    setState(() {
                                      post['comments'].add(newComment);
                                    });
                                    _commentController.clear();
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showOptionsSheet(int postIndex) {
    showModalBottomSheet(
      backgroundColor: const Color(0xffEFF1F4),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffE1ECFC),
                    width: 1,
                  ),
                ),
                child: ListTile(
                  trailing: Image.asset(
                    'assets/arrow.png',
                    height: 16,
                    width: 16,
                  ),
                  title: const Text(
                    'Edit Post',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff181636),
                        letterSpacing: 0.15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Add your edit post logic here
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffE1ECFC),
                    width: 1,
                  ),
                ),
                child: ListTile(
                  trailing: Image.asset(
                    'assets/arrow.png',
                    height: 16,
                    width: 16,
                  ),
                  title: const Text(
                    'Delete Post',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff181636),
                        letterSpacing: 0.15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Add your delete post logic here
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffE1ECFC),
                    width: 1,
                  ),
                ),
                child: ListTile(
                  trailing: Image.asset(
                    'assets/arrow.png',
                    height: 16,
                    width: 16,
                  ),
                  title: const Text(
                    'Hide',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff181636),
                        letterSpacing: 0.15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Add your hide post logic here
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 13.0),
            child: Text(
              "Recent Posts",
              style: TextStyle(
                color: Color(0xff181636),
                letterSpacing: 0.15,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 2),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/avatar.png',
                                  ),
                                  radius: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post["username"] ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff181636),
                                            fontSize: 14,
                                            letterSpacing: 0.1),
                                      ),
                                      Text(
                                        post["date"] ?? '',
                                        style: const TextStyle(
                                            color: Color(0xff55555A),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.4),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.more_horiz),
                                  onPressed: () => _showOptionsSheet(index),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (post["imageUrl"] != null &&
                              post["imageUrl"]!.isNotEmpty)
                            Image.asset(
                              post["imageUrl"]!,
                              fit: BoxFit.cover,
                            ),
                          const SizedBox(height: 8),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Like
                                    IconButton(
                                      icon: const ImageIcon(
                                        AssetImage(
                                            'assets/like_icon_filled.png'),
                                        color: Colors.red,
                                      ),
                                      onPressed: () {},
                                    ),
                                    // Comment
                                    IconButton(
                                      icon: const ImageIcon(
                                        AssetImage('assets/comment_icon.png'),
                                        size: 22,
                                        color: Color(0xffA3A2AF),
                                      ),
                                      onPressed: () =>
                                          _showCommentsSheet(index),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const ImageIcon(
                                        AssetImage('assets/share_icon.png'),
                                        color: Color(0xffA3A2AF),
                                        // size: 22,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.bookmark_border),
                                      iconSize: 27,
                                      color: const Color(0xffA3A2AF),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Caption
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              post["caption"] ?? '',
                              style: const TextStyle(
                                  color: Color(0xff55555A),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
