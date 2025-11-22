import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../models/pet.dart';
import '../services/ai_service.dart';

class AiEducationScreen extends StatefulWidget {
  @override
  _AiEducationScreenState createState() => _AiEducationScreenState();
}

class _AiEducationScreenState extends State<AiEducationScreen> with SingleTickerProviderStateMixin {
  final _questionController = TextEditingController();
  final AiService _aiService = AiService();
  
  late TabController _tabController;
  bool _isLoading = false;
  String? _advice;
  List<String>? _videoRecommendations;
  String? _behaviorAnalysis;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _questionController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _getAdvice() async {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final pet = appState.activePet;
    
    if (pet == null) {
      _showError('No active pet selected');
      return;
    }

    if (_questionController.text.isEmpty) {
      _showError('Please enter a question');
      return;
    }

    setState(() {
      _isLoading = true;
      _advice = null;
    });

    try {
      if (!_aiService.isInitialized) {
        _showApiKeyDialog(() async {
          final advice = await _aiService.getEducationalAdvice(
            pet: pet,
            question: _questionController.text,
          );
          setState(() {
            _advice = advice;
            _isLoading = false;
          });
        });
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final advice = await _aiService.getEducationalAdvice(
        pet: pet,
        question: _questionController.text,
      );

      setState(() {
        _advice = advice;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError(e.toString());
    }
  }

  Future<void> _getVideoRecommendations() async {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final pet = appState.activePet;
    
    if (pet == null) {
      _showError('No active pet selected');
      return;
    }

    setState(() {
      _isLoading = true;
      _videoRecommendations = null;
    });

    try {
      if (!_aiService.isInitialized) {
        _showApiKeyDialog(() async {
          final videos = await _aiService.getTrainingVideoRecommendations(pet: pet);
          setState(() {
            _videoRecommendations = videos;
            _isLoading = false;
          });
        });
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final videos = await _aiService.getTrainingVideoRecommendations(pet: pet);

      setState(() {
        _videoRecommendations = videos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError(e.toString());
    }
  }

  Future<void> _analyzeBehavior() async {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final pet = appState.activePet;
    
    if (pet == null) {
      _showError('No active pet selected');
      return;
    }

    setState(() {
      _isLoading = true;
      _behaviorAnalysis = null;
    });

    try {
      if (!_aiService.isInitialized) {
        _showApiKeyDialog(() async {
          final analysis = await _aiService.analyzePetBehavior(pet);
          setState(() {
            _behaviorAnalysis = analysis;
            _isLoading = false;
          });
        });
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final analysis = await _aiService.analyzePetBehavior(pet);

      setState(() {
        _behaviorAnalysis = analysis;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showApiKeyDialog(Function() onSuccess) {
    final apiKeyController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter API Key'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To use AI features, please enter your Google Gemini API key:',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            TextField(
              controller: apiKeyController,
              decoration: InputDecoration(
                labelText: 'API Key',
                border: OutlineInputBorder(),
                hintText: 'Enter your Gemini API key',
              ),
              obscureText: true,
            ),
            SizedBox(height: 8),
            Text(
              'Get your free API key at: ai.google.dev',
              style: TextStyle(fontSize: 12, color: Colors.grey),
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
              if (apiKeyController.text.isNotEmpty) {
                _aiService.initialize(apiKeyController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('API Key set! Retrying...'),
                    backgroundColor: Colors.green,
                  ),
                );
                onSuccess();
              }
            },
            child: Text('Set API Key'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational AI'),
        backgroundColor: Color(0xFF4CAF50),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Ask Advice', icon: Icon(Icons.help_outline)),
            Tab(text: 'Training Videos', icon: Icon(Icons.video_library)),
            Tab(text: 'Behavior Analysis', icon: Icon(Icons.analytics)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAdviceTab(),
          _buildVideosTab(),
          _buildAnalysisTab(),
        ],
      ),
    );
  }

  Widget _buildAdviceTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.school, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      'Ask the Expert',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Get educational advice from an AI expert dog trainer.',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: _questionController,
            decoration: InputDecoration(
              labelText: 'Ask a Question',
              border: OutlineInputBorder(),
              hintText: 'e.g., How can I improve my pet\'s happiness?',
            ),
            maxLines: 3,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _getAdvice,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4CAF50),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: _isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Getting Advice...'),
                    ],
                  )
                : Text('Get Advice'),
          ),
          SizedBox(height: 24),
          if (_advice != null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Expert Advice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(_advice!, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildVideosTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.video_library, color: Colors.purple),
                    SizedBox(width: 8),
                    Text(
                      'Training Videos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Get personalized training video recommendations for your pet.',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _getVideoRecommendations,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: _isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Loading...'),
                    ],
                  )
                : Text('Get Recommendations'),
          ),
          SizedBox(height: 24),
          if (_videoRecommendations != null)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _videoRecommendations!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                    title: Text(_videoRecommendations![index]),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // In a real app, this would open the training video
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Video coming soon!')),
                      );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildAnalysisTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.analytics, color: Colors.orange),
                    SizedBox(width: 8),
                    Text(
                      'Behavior Analysis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Get AI-powered insights about your pet\'s current behavior and well-being.',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _analyzeBehavior,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: _isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Analyzing...'),
                    ],
                  )
                : Text('Analyze Behavior'),
          ),
          SizedBox(height: 24),
          if (_behaviorAnalysis != null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.insights, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Analysis Results',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[900],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(_behaviorAnalysis!, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
