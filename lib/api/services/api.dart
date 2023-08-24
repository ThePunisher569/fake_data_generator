import 'package:dio/dio.dart';
import 'package:fake_data_generator/api/models/address/address.dart';
import 'package:fake_data_generator/api/models/appliance/appliance.dart';
import 'package:fake_data_generator/api/models/bank/bank.dart';
import 'package:fake_data_generator/api/models/blood_type/blood_type.dart';
import 'package:fake_data_generator/api/models/credit_card/credit_card.dart';
import 'package:fake_data_generator/utils/constants.dart';

import '../models/beer/beer.dart';
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

  Future<Address> getAddress() async {
    try {
      logger.i('Fetching address data');
      final addressResponse = await dio.get('/addresses');

      if (addressResponse.statusCode == 200) {
        final addressData = addressResponse.data;
        //logger.d(addressData);

        final address = Address.fromJson(addressData);

        logger.i('address data fetched and serialized successfully!');
        logger.d(address);

        return address;
      } else {
        throw Exception(
            'Failed to fetch address data due to ${addressResponse.statusCode} message: ${addressResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching address data: $e');
      throw Exception('Error fetching address data');
    }
  }

  Future<Bank> getBank() async {
    try {
      logger.i('Fetching banks data');
      final bankResponse = await dio.get('/banks');

      if (bankResponse.statusCode == 200) {
        final bankData = bankResponse.data;
        //logger.d(bankData);

        final bank = Bank.fromJson(bankData);
        logger.i('bank data fetched and serialized successfully!');
        logger.d(bank);

        return bank;
      } else {
        throw Exception(
            'Failed to fetch bank data due to ${bankResponse.statusCode} message: ${bankResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching bank data: $e');
      throw Exception('Error fetching bank data');
    }
  }

  Future<Appliance> getAppliance() async {
    try {
      logger.i('Fetching appliance data');
      final applianceResponse = await dio.get('/appliances');

      if (applianceResponse.statusCode == 200) {
        final applianceData = applianceResponse.data;
        // logger.d(applianceData);

        final appliance = Appliance.fromJson(applianceData);
        logger.i('appliance data fetched and serialized successfully!');
        logger.d(appliance);

        return appliance;
      } else {
        throw Exception(
            'Failed to fetch appliance data due to ${applianceResponse.statusCode} message: ${applianceResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching appliance data: $e');
      throw Exception('Error fetching appliance data');
    }
  }

  Future<Beer> getBeer() async {
    try {
      logger.i('Fetching beer data');
      final beerResponse = await dio.get('/beers');

      if (beerResponse.statusCode == 200) {
        final beerData = beerResponse.data;
        // logger.d(beerData);

        final beer = Beer.fromJson(beerData);
        logger.i('beer data fetched and serialized successfully!');
        logger.d(beer);

        return beer;
      } else {
        throw Exception(
            'Failed to fetch appliance data due to ${beerResponse.statusCode} message: ${beerResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching beer data: $e');
      throw Exception('Error fetching beer data');
    }
  }

  Future<BloodType> getBloodType() async {
    try {
      logger.i('Fetching bloodType data');
      final bloodTypeResponse = await dio.get('/blood_types');

      if (bloodTypeResponse.statusCode == 200) {
        final bloodTypeData = bloodTypeResponse.data;
        // logger.d(bloodTypeData);

        final bloodType = BloodType.fromJson(bloodTypeData);
        logger.i('bloodType data fetched and serialized successfully!');
        logger.d(bloodType);

        return bloodType;
      } else {
        throw Exception(
            'Failed to fetch bloodType data due to ${bloodTypeResponse.statusCode} message: ${bloodTypeResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching bloodType data: $e');
      throw Exception('Error fetching bloodType data');
    }
  }

  Future<CreditCard> getCreditCard() async {
    try {
      logger.i('Fetching creditCard data');
      final creditCardResponse = await dio.get('/credit_cards');

      if (creditCardResponse.statusCode == 200) {
        final creditCardData = creditCardResponse.data;
        logger.d(creditCardData);

        final creditCard = CreditCard.fromJson(creditCardData);
        logger.i('creditCard data fetched and serialized successfully!');
        logger.d(creditCard);

        return creditCard;
      } else {
        throw Exception(
            'Failed to fetch creditCard data due to ${creditCardResponse.statusCode} message: ${creditCardResponse.statusMessage}');
      }
    } catch (e) {
      logger.e('Error fetching creditCard data: $e');
      throw Exception('Error fetching creditCard data');
    }
  }
}
