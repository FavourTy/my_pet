import 'package:in_app_purchase/in_app_purchase.dart';
import '../models/user.dart';

class SubscriptionService {
  final InAppPurchase _iap = InAppPurchase.instance;
  
  static const String monthlySubscriptionId = 'pet_game_monthly_subscription';
  static const String yearlySubscriptionId = 'pet_game_yearly_subscription';
  
  late Stream<List<PurchaseDetails>> purchaseUpdates;
  
  Future<void> initialize() async {
    final available = await _iap.isAvailable();
    if (!available) {
      throw Exception('In-app purchases not available');
    }
    
    purchaseUpdates = _iap.purchaseStream;
  }

  Future<List<ProductDetails>> getAvailableSubscriptions() async {
    final productIds = {
      monthlySubscriptionId,
      yearlySubscriptionId,
    };
    
    final response = await _iap.queryProductDetails(productIds);
    
    if (response.error != null) {
      throw Exception('Failed to query products: ${response.error}');
    }
    
    return response.productDetails;
  }

  Future<void> purchaseSubscription(ProductDetails product) async {
    final purchaseParam = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  /// Check if user has active subscription
  Future<bool> hasActiveSubscription(User user) async {
    if (user.subscriptionExpiryDate == null) {
      return false;
    }
    
    return user.subscriptionExpiryDate!.isAfter(DateTime.now());
  }

  /// Process successful purchase
  Future<User> processPurchaseSuccess(
    User user,
    PurchaseDetails purchase,
  ) async {
    // Update user's membership tier and expiry date
    user.membershipTier = MembershipTier.paid;
    
    // Set expiry based on subscription type
    if (purchase.productID == monthlySubscriptionId) {
      user.subscriptionExpiryDate = DateTime.now().add(Duration(days: 30));
    } else if (purchase.productID == yearlySubscriptionId) {
      user.subscriptionExpiryDate = DateTime.now().add(Duration(days: 365));
    }
    
    await user.save();
    return user;
  }

  /// Get benefits of paid membership
  List<String> getPaidMembershipBenefits() {
    return [
      'Create AI-generated custom pets',
      'Access to exclusive Event Plaza',
      'Link pet qualifications and achievements',
      'Unlimited room expansion',
      'Early access to limited edition items',
      'Ad-free experience',
      'Priority support',
      'Exclusive monthly items',
    ];
  }
}
