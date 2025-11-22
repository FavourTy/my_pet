import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/pet.dart';

class AiService {
  GenerativeModel? _model;
  String? _apiKey;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  void initialize(String apiKey) {
    _apiKey = apiKey;
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
    _isInitialized = true;
  }

  /// Generate a unique AI pet based on user preferences
  Future<Map<String, dynamic>> generateAiPetDescription({
    required String petName,
    required PetType petType,
    String? personalityTraits,
    String? appearance,
  }) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    // Create prompt for AI pet generation
    final prompt = '''
Generate a unique virtual pet with the following characteristics:
- Name: $petName
- Type: ${petType.name}
- Personality: ${personalityTraits ?? 'friendly and playful'}
- Appearance: ${appearance ?? 'cute and fluffy'}

Provide a detailed description of this pet's unique traits, behaviors, and special characteristics that make it unique.
Keep the response concise (2-3 paragraphs) and engaging.
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      
      return {
        'description': response.text ?? 'A wonderful virtual pet!',
        'name': petName,
        'type': petType.name,
      };
    } catch (e) {
      throw Exception('Failed to generate AI pet: $e');
    }
  }

  /// Create an AI-generated pet image description (to be used with DALL-E or similar)
  Future<String> generatePetImagePrompt({
    required String petName,
    required PetType petType,
    String? appearance,
  }) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    final prompt = '''
Create a detailed image generation prompt for a virtual pet character with these details:
- Name: $petName
- Type: ${petType.name}
- Appearance: ${appearance ?? 'cute and friendly-looking'}

Generate a single, detailed prompt (max 100 words) suitable for AI image generation.
Focus on visual details like colors, features, expression, and style.
Make it cute and suitable for a mobile game.
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      return response.text ?? 'A cute ${petType.name} named $petName';
    } catch (e) {
      throw Exception('Failed to generate image prompt: $e');
    }
  }

  /// Get AI-powered educational advice for pet care
  Future<String> getEducationalAdvice({
    required Pet pet,
    required String question,
  }) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    final prompt = '''
You are an expert dog trainer and educational AI assistant for virtual pet care.

Pet Information:
- Name: ${pet.name}
- Type: ${pet.type.name}
- Age: ${pet.age} days (${pet.yearsOld} years old in game)
- Current HP: ${pet.hp}/${pet.maxHp}
- Mood: ${pet.currentMood.name}

User Question: $question

Provide helpful, educational advice about pet care based on this information.
Be kind, supportive, and educational. Keep the response concise (2-3 paragraphs).
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      return response.text ?? 'No advice available at the moment.';
    } catch (e) {
      throw Exception('Failed to get AI advice: $e');
    }
  }

  /// Generate training video recommendations
  Future<List<String>> getTrainingVideoRecommendations({
    required Pet pet,
  }) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    final prompt = '''
Recommend 5 training video topics for a virtual ${pet.type.name} named ${pet.name}.
The pet is ${pet.yearsOld} years old and is currently ${pet.currentMood.name}.
Focus on educational content that would help improve the pet's behavior and happiness.

Return only the video titles, one per line, without numbering.
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      final text = response.text ?? '';
      return text.split('\n')
          .where((line) => line.trim().isNotEmpty)
          .map((line) => line.replaceAll(RegExp(r'^\d+\.\s*'), '').trim())
          .toList();
    } catch (e) {
      throw Exception('Failed to get video recommendations: $e');
    }
  }

  /// Analyze pet behavior and provide insights
  Future<String> analyzePetBehavior(Pet pet) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    final hoursSinceFed = DateTime.now().difference(pet.lastFedAt).inHours;
    final hoursSincePlayed = DateTime.now().difference(pet.lastPlayedAt).inHours;

    final prompt = '''
Analyze this virtual pet's behavior and provide insights:
- Name: ${pet.name}
- Type: ${pet.type.name}
- Age: ${pet.age} days
- HP: ${pet.hp}/${pet.maxHp} (${(pet.hpPercentage * 100).toStringAsFixed(1)}%)
- Happiness Points: ${pet.happinessPoints}
- Current Mood: ${pet.currentMood.name}
- Hours since last fed: $hoursSinceFed
- Hours since last played: $hoursSincePlayed

Provide insights about the pet's current state and suggestions for improvement.
Keep the response concise (2-3 paragraphs).
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      return response.text ?? 'Unable to analyze pet behavior at this time.';
    } catch (e) {
      throw Exception('Failed to analyze pet behavior: $e');
    }
  }

  /// Get a fun fact about the pet type
  Future<String> getPetFact(PetType petType) async {
    if (!_isInitialized || _model == null) {
      throw Exception('AI Service not initialized. Please provide an API key.');
    }

    final prompt = '''
Share an interesting and educational fun fact about ${petType.name}s.
Make it engaging and suitable for pet owners.
Keep it to 1-2 sentences.
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model!.generateContent(content);
      return response.text ?? 'Did you know pets bring joy to our lives?';
    } catch (e) {
      throw Exception('Failed to get pet fact: $e');
    }
  }
}
