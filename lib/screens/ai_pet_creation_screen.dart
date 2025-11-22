import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../models/pet.dart';
import '../models/user.dart';
import '../services/ai_service.dart';

class AiPetCreationScreen extends StatefulWidget {
  @override
  _AiPetCreationScreenState createState() => _AiPetCreationScreenState();
}

class _AiPetCreationScreenState extends State<AiPetCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _appearanceController = TextEditingController();
  final _personalityController = TextEditingController();
  
  PetType _selectedType = PetType.dog;
  bool _isGenerating = false;
  String? _generatedDescription;
  String? _imagePrompt;
  final AiService _aiService = AiService();

  @override
  void dispose() {
    _nameController.dispose();
    _appearanceController.dispose();
    _personalityController.dispose();
    super.dispose();
  }

  Future<void> _generatePet() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final appState = Provider.of<AppStateProvider>(context, listen: false);
    
    // Check if user is a paid member
    if (appState.currentUser?.membershipTier == MembershipTier.free) {
      _showUpgradeDialog();
      return;
    }

    setState(() {
      _isGenerating = true;
      _generatedDescription = null;
      _imagePrompt = null;
    });

    try {
      // Note: In production, the API key should be stored securely
      // For demo purposes, we'll handle the case where it's not initialized
      if (!_aiService.isInitialized) {
        // Show dialog to enter API key or use mock data
        _showApiKeyDialog();
        setState(() {
          _isGenerating = false;
        });
        return;
      }

      // Generate pet description
      final description = await _aiService.generateAiPetDescription(
        petName: _nameController.text,
        petType: _selectedType,
        personalityTraits: _personalityController.text.isEmpty 
            ? null 
            : _personalityController.text,
        appearance: _appearanceController.text.isEmpty 
            ? null 
            : _appearanceController.text,
      );

      // Generate image prompt
      final imagePrompt = await _aiService.generatePetImagePrompt(
        petName: _nameController.text,
        petType: _selectedType,
        appearance: _appearanceController.text.isEmpty 
            ? null 
            : _appearanceController.text,
      );

      setState(() {
        _generatedDescription = description['description'];
        _imagePrompt = imagePrompt;
        _isGenerating = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('AI Pet generated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() {
        _isGenerating = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showUpgradeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Paid Members Only'),
        content: Text(
          'AI Pet Creation is a premium feature. Upgrade to a paid membership to create unique AI-generated pets!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/subscription');
            },
            child: Text('Upgrade'),
          ),
        ],
      ),
    );
  }

  void _showApiKeyDialog() {
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
                    content: Text('API Key set! You can now use AI features.'),
                    backgroundColor: Colors.green,
                  ),
                );
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
        title: Text('AI Pet Creation'),
        backgroundColor: Color(0xFFFFC107),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF9C4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFC107), size: 32),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AI Pet Creation',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Create a unique pet using AI (Paid members only)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Pet Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Pet Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.pets),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a pet name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Pet Type
              DropdownButtonFormField<PetType>(
                value: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Pet Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: PetType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
              ),
              SizedBox(height: 16),

              // Appearance
              TextFormField(
                controller: _appearanceController,
                decoration: InputDecoration(
                  labelText: 'Appearance (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.palette),
                  hintText: 'e.g., fluffy white fur, blue eyes',
                ),
                maxLines: 2,
              ),
              SizedBox(height: 16),

              // Personality
              TextFormField(
                controller: _personalityController,
                decoration: InputDecoration(
                  labelText: 'Personality (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.emoji_emotions),
                  hintText: 'e.g., friendly, playful, energetic',
                ),
                maxLines: 2,
              ),
              SizedBox(height: 24),

              // Generate Button
              ElevatedButton(
                onPressed: _isGenerating ? null : _generatePet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC107),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isGenerating
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
                          Text('Generating...'),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_awesome),
                          SizedBox(width: 8),
                          Text(
                            'Generate with AI',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 24),

              // Generated Description
              if (_generatedDescription != null) ...[
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
                          Icon(Icons.description, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Generated Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        _generatedDescription!,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],

              // Image Prompt
              if (_imagePrompt != null) ...[
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.image, color: Colors.purple),
                          SizedBox(width: 8),
                          Text(
                            'Image Generation Prompt',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        _imagePrompt!,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Use this prompt with DALL-E, Midjourney, or similar AI image generators',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
