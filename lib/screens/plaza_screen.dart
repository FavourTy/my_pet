import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../models/social.dart';

class PlazaScreen extends StatefulWidget {
  @override
  _PlazaScreenState createState() => _PlazaScreenState();
}

class _PlazaScreenState extends State<PlazaScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _postController = TextEditingController();
  bool _isPetLossSupport = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communication Plaza'),
        backgroundColor: Colors.teal[700],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Feed', icon: Icon(Icons.public)),
            Tab(text: 'Pet Loss Support', icon: Icon(Icons.favorite)),
            Tab(text: 'My Posts', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFeedTab(),
          _buildPetLossSupportTab(),
          _buildMyPostsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreatePostDialog,
        icon: Icon(Icons.create),
        label: Text('Create Post'),
        backgroundColor: Colors.teal[600],
      ),
    );
  }

  Widget _buildFeedTab() {
    // Mock posts - in real app, fetch from backend
    final posts = _getMockPosts(isPetLossOnly: false);
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: posts.length,
      itemBuilder: (context, index) => _buildPostCard(posts[index]),
    );
  }

  Widget _buildPetLossSupportTab() {
    final posts = _getMockPosts(isPetLossOnly: true);
    
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          color: Colors.pink[50],
          child: Row(
            children: [
              Icon(Icons.favorite, color: Colors.pink[300]),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'This is a safe space for pet loss support and remembrance. Share your stories and support others.',
                  style: TextStyle(color: Colors.pink[900], fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: posts.length,
            itemBuilder: (context, index) => _buildPostCard(posts[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildMyPostsTab() {
    return Center(
      child: Text('Your posts will appear here'),
    );
  }

  Widget _buildPostCard(PlazaPost post) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author info
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal[200],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ${post.authorId.substring(0, 8)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _formatTime(post.postedAt),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                if (post.isPetLossSupport)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Pet Loss Support',
                      style: TextStyle(color: Colors.pink[900], fontSize: 11),
                    ),
                  ),
              ],
            ),
            
            SizedBox(height: 12),
            
            // Content
            Text(post.content, style: TextStyle(fontSize: 15)),
            
            SizedBox(height: 12),
            
            // Actions
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, size: 20),
                  label: Text('${post.likedByUserIds.length}'),
                  style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.comment_outlined, size: 20),
                  label: Text('${post.commentIds.length}'),
                  style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCreatePostDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: 'Share your thoughts...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 12),
            CheckboxListTile(
              title: Text('Pet Loss Support'),
              subtitle: Text('Mark as support post'),
              value: _isPetLossSupport,
              onChanged: (value) {
                setState(() {
                  _isPetLossSupport = value ?? false;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Create post logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Post created!')),
              );
            },
            child: Text('Post'),
          ),
        ],
      ),
    );
  }

  List<PlazaPost> _getMockPosts({bool isPetLossOnly = false}) {
    return List.generate(
      10,
      (i) => PlazaPost(
        id: 'post_$i',
        authorId: 'user_$i',
        content: isPetLossOnly
            ? 'Missing my beloved pet. Thank you for this community.'
            : 'Just reached 1000 happiness points with my pet!',
        isPetLossSupport: isPetLossOnly,
      ),
    );
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    return '${diff.inMinutes}m ago';
  }

  @override
  void dispose() {
    _tabController.dispose();
    _postController.dispose();
    super.dispose();
  }
}
