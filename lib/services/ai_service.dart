// import 'package:google_generative_ai/google_generative_ai.dart';
// import '../models/pet.dart';

// class AiService {
//   late GenerativeModel _model;
//   String? _apiKey;

//   void initialize(String apiKey) {
//     _apiKey = apiKey;
//     _model = GenerativeModel(
//       model: 'gemini-pro',
//       apiKey: apiKey,
//     );
//   }

//   /// Generate a unique AI pet based on user preferences
//   Future<Pet> generateAiPet({
//     required String userId,
//     required String petName,
//     required PetType petType,
//     String? personalityTraits,
//     String? appearance,
//   }) async {
//     if (_apiKey == null) {
//       throw Exception('AI Service not initialized');
//     }

//     // Create prompt for AI pet generation
//     final prompt = '''
// Generate a unique virtual pet with the following characteristics:
// - Name: $petName
// - Type: ${petType.name}
// - Personality: ${personalityTraits ?? 'friendly and playful'}
// - Appearance: ${appearance ?? 'cute and fluffy'}

// Provide a detailed description of this pet's unique traits, behaviors, and special characteristics that make it unique.
// ''';

//     try {
//       final content = [Content.text(prompt)];
//       final response = await _model.generateContent(content);
      
//       // Create pet with AI-generated characteristics
//       return Pet(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: petName,
//         type: petType,
//         ownerId: userId,
//         isAiGenerated: true,
//         // Store AI description in a custom field or database
//       );
//     } catch (e) {
//       throw Exception('Failed to generate AI pet: $e');
//     }
//   }

//   /// Get AI-powered educational advice for pet care
//   Future<String> getEducationalAdvice({
//     required Pet pet,
//     required String question,
//   }) async {
//     if (_apiKey == null) {
//       throw Exception('AI Service not initialized');
//     }

//     final prompt = '''
// You are an educational AI assistant for virtual pet care.
// Pet Information:
// - Name: ${pet.name}
// - Type: ${pet.type.name}
// - Age: ${pet.age} days (${pet.yearsOld} years old in game)
// - Current HP: ${pet.hp}/${pet.maxHp}
// - Mood: ${pet.currentMood.name}

// User Question: $question

// Provide helpful, educational advice about pet care based on this information.
// ''';

//     try {
//       final content = [Content.text(prompt)];
//       final response = await _model.generateContent(content);
//       return response.text ?? 'No advice available at the moment.';
//     } catch (e) {
//       throw Exception('Failed to get AI advice: $e');
//     }
//   }

//   /// Generate training video recommendations
//   Future<List<String>> getTrainingVideoRecommendations({
//     required Pet pet,
//   }) async {
//     if (_apiKey == null) {
//       throw Exception('AI Service not initialized');
//     }

//     final prompt = '''
// Recommend 5 training video topics for a virtual ${pet.type.name} named ${pet.name}.
// The pet is ${pet.yearsOld} years old and is currently ${pet.currentMood.name}.
// Focus on educational content that would help improve the pet's behavior and happiness.

// Return only the video titles, one per line.
// ''';

//     try {
//       final content = [Content.text(prompt)];
//       final response = await _model.generateContent(content);
//       final text = response.text ?? '';
//       return text.split('\n').where((line) => line.trim().isNotEmpty).toList();
//     } catch (e) {
//       throw Exception('Failed to get video recommendations: $e');
//     }
//   }

//   /// Analyze pet behavior and provide insights
//   Future<String> analyzePetBehavior(Pet pet) async {
//     if (_apiKey == null) {
//       throw Exception('AI Service not initialized');
//     }

//     final hoursSinceFed = DateTime.now().difference(pet.lastFedAt).inHours;
//     final hoursSincePlayed = DateTime.now().difference(pet.lastPlayedAt).inHours;

//     final prompt = '''
// Analyze this virtual pet's behavior and provide insights:
// - Name: ${pet.name}
// - Type: ${pet.type.name}
// - Age: ${pet.age} days
// - HP: ${pet.hp}/${pet.maxHp} (${(pet.hpPercentage * 100).toStringAsFixed(1)}%)
// - Happiness Points: ${pet.happinessPoints}
// - Current Mood: ${pet.currentMood.name}
// - Hours since last fed: $hoursSinceFed
// - Hours since last played: $hoursSincePlayed

// Provide insights about the pet's current state and suggestions for improvement.
// ''';

//     try {
//       final content = [Content.text(prompt)];
//       final response = await _model.generateContent(content);
//       return response.text ?? 'Unable to analyze pet behavior at this time.';
//     } catch (e) {
//       throw Exception('Failed to analyze pet behavior: $e');
//     }
//   }
// }
