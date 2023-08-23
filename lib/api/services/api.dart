import 'package:dio/dio.dart';
import 'package:fake_data_generator/utils/constants.dart';

// TODO In each method, Convert JSON Response into model and return that model
class ApiService {
  final dio = Dio();

  ApiService._();

  static ApiService? _instance;

  factory ApiService() {
    _instance ??= ApiService._();
    return _instance!;
  }

  Future<void> getUser() async {
    try {
      print('Fetching user data');
      final userResponse = await dio.get('${Constants.url}/users');

      if (userResponse.statusCode == 200) {
        final userData = userResponse.data;
        logger.d(userData);
      } else {
        logger.e('Failed to fetch user data');
      }
    } catch (e) {
      logger.e('Error fetching user data: $e');
    }
  }

  Future<void> getAddress() async {
    try {
      print('Fetching address data');
      final addressResponse = await dio.get('${Constants.url}/addresses');

      if (addressResponse.statusCode == 200) {
        final addressData = addressResponse.data;
        logger.d(addressData);
      } else {
        logger.e('Failed to fetch address data');
      }
    } catch (e) {
      logger.e('Error fetching address data: $e');
    }
  }

  Future<void> getBank() async {
    try {
      print('Fetching banks data');
      final bankResponse = await dio.get('${Constants.url}/banks');

      if (bankResponse.statusCode == 200) {
        final bankData = bankResponse.data;
        logger.d(bankData);
      } else {
        logger.e('Failed to fetch banks data');
      }
    } catch (e) {
      logger.e('Error fetching banks data: $e');
    }
  }

  Future<void> getAppliance() async {
    try {
      print('Fetching appliance data');
      final applianceResponse = await dio.get('${Constants.url}/appliances');

      if (applianceResponse.statusCode == 200) {
        final applianceData = applianceResponse.data;
        logger.d(applianceData);
      } else {
        logger.e('Failed to fetch appliance data');
      }
    } catch (e) {
      logger.e('Error fetching appliance data: $e');
    }
  }

  Future<void> getBeer() async {
    try {
      print('Fetching beer data');
      final beerResponse = await dio.get('${Constants.url}/beers');

      if (beerResponse.statusCode == 200) {
        final beerData = beerResponse.data;
        logger.d(beerData);
      } else {
        logger.e('Failed to fetch beer data');
      }
    } catch (e) {
      logger.e('Error fetching beer data: $e');
    }
  }

  Future<void> getBloodType() async {
    try {
      print('Fetching bloodType data');
      final bloodTypeResponse = await dio.get('${Constants.url}/blood_types');

      if (bloodTypeResponse.statusCode == 200) {
        final bloodTypeData = bloodTypeResponse.data;
        logger.d(bloodTypeData);
      } else {
        logger.e('Failed to fetch bloodType data');
      }
    } catch (e) {
      logger.e('Error fetching bloodType data: $e');
    }
  }

  Future<void> getCreditCard() async {
    try {
      print('Fetching creditCard data');
      final creditCardResponse = await dio.get('${Constants.url}/credit_cards');

      if (creditCardResponse.statusCode == 200) {
        final creditCardData = creditCardResponse.data;
        logger.d(creditCardData);
      } else {
        logger.e('Failed to fetch creditCard data');
      }
    } catch (e) {
      logger.e('Error fetching creditCard data: $e');
    }
  }
}
