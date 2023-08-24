import 'package:dio/dio.dart';
import 'package:fake_data_generator/utils/constants.dart';

import '../models/user/user.dart';

class ApiService {
  final dio = Dio()..options.baseUrl = Constants.url;

  ApiService._();

  static ApiService? _instance;

  factory ApiService() {
    _instance ??= ApiService._();
    return _instance!;
  }

  Future<User> getUser() async {
    try {
      logger.i('Fetching user data');
      final userResponse = await dio.get('/users');

      if (userResponse.statusCode == 200) {
        final userData = userResponse.data;
        //logger.d(userData);

        final user = User.fromJson(userData);

        logger.i('user data fetched and serialized successfully!');
        logger.d(user);

        return user;
      } else {
        throw Exception(
            'Failed to fetch user data due to ${userResponse.statusCode} message: ${userResponse.statusMessage}');
      }
    } on Exception catch (e) {
      logger.e('Error fetching user data: $e');
      throw Exception('Error fetching user data');
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
