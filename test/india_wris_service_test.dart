import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jalnetra/services/india_wris_service.dart';
import 'package:jalnetra/models/india_wris_models.dart';

void main() {
  group('India-WRIS service tests', () {
    late IndiaWRISService service;

    setUp(() {
      final dio = Dio(BaseOptions(baseUrl: 'https://indiawris.gov.in'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final requestedState =
                options.queryParameters['stateName'] as String?;
            final requestedDistrict =
                options.queryParameters['districtName'] as String?;
            final records = _stationRecords.where((record) {
              final matchesState =
                  requestedState == null ||
                  record['stateName'] == requestedState;
              final matchesDistrict =
                  requestedDistrict == null ||
                  record['districtName'] == requestedDistrict;
              return matchesState && matchesDistrict;
            }).toList();

            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'content': records,
                  'totalElements': records.length,
                  'totalPages': 1,
                  'size': records.length,
                  'number': 0,
                  'first': true,
                  'last': true,
                  'numberOfElements': records.length,
                },
              ),
            );
          },
        ),
      );
      service = IndiaWRISService(dio: dio);
    });

    test('should fetch available states', () async {
      final states = await service.getAvailableStates();
      expect(states, isNotEmpty);
      expect(states, contains('Andhra Pradesh'));
      expect(states, contains('Delhi'));
    });

    test('should fetch districts for Andhra Pradesh', () async {
      final districts = await service.getDistrictsByState('Andhra Pradesh');
      expect(districts, isNotEmpty);
      expect(districts, contains('West Godavari'));
    });

    test('should search stations by location', () async {
      final stations = await service.searchStationsByLocation(
        state: 'Andhra Pradesh',
        district: 'West Godavari',
      );
      expect(stations, isNotEmpty);
      expect(stations.first.state, equals('Andhra Pradesh'));
      expect(stations.first.district, equals('West Godavari'));
    });

    test('should parse GroundWaterLevelRecord correctly', () {
      final json = {
        'stationId': 'TEST001',
        'stationName': 'Test Station',
        'stateName': 'Test State',
        'districtName': 'Test District',
        'latitude': 28.6139,
        'longitude': 77.2090,
        'waterLevelBelowGroundLevel': 15.5,
        'dateOfReading': '2023-10-26T10:00:00Z',
        'wellStatus': 'Active',
        'dataQuality': 'Good',
      };

      final record = GroundWaterLevelRecord.fromJson(json);
      expect(record.stationId, equals('TEST001'));
      expect(record.stationName, equals('Test Station'));
      expect(record.stateName, equals('Test State'));
      expect(record.districtName, equals('Test District'));
      expect(record.latitude, equals(28.6139));
      expect(record.longitude, equals(77.2090));
      expect(record.waterLevelBelowGroundLevel, equals(15.5));
    });

    test('should convert GroundWaterLevelRecord to DWLRStation', () {
      final json = {
        'stationId': 'TEST001',
        'stationName': 'Test Station',
        'stateName': 'Test State',
        'districtName': 'Test District',
        'latitude': 28.6139,
        'longitude': 77.2090,
        'waterLevelBelowGroundLevel': 15.5,
        'dateOfReading': '2023-10-26T10:00:00Z',
        'wellStatus': 'Active',
        'dataQuality': 'Good',
      };

      final record = GroundWaterLevelRecord.fromJson(json);
      final station = record.toDWLRStation();

      expect(station.stationId, equals('TEST001'));
      expect(station.stationName, equals('Test Station'));
      expect(station.state, equals('Test State'));
      expect(station.district, equals('Test District'));
      expect(station.latitude, equals(28.6139));
      expect(station.longitude, equals(77.2090));
      expect(station.currentWaterLevel, equals(15.5));
      expect(station.status, equals('Active'));
    });
  });
}

const _stationRecords = [
  {
    'stationId': 'AP001',
    'stationName': 'West Godavari Monitoring Station',
    'stateName': 'Andhra Pradesh',
    'districtName': 'West Godavari',
    'latitude': 16.7107,
    'longitude': 81.0952,
    'waterLevelBelowGroundLevel': 15.5,
    'dateOfReading': '2023-10-26T10:00:00Z',
    'wellStatus': 'Active',
    'dataQuality': 'Good',
  },
  {
    'stationId': 'DL001',
    'stationName': 'North Delhi Monitoring Station',
    'stateName': 'Delhi',
    'districtName': 'North Delhi',
    'latitude': 28.7041,
    'longitude': 77.1025,
    'waterLevelBelowGroundLevel': 12.0,
    'dateOfReading': '2023-10-26T10:00:00Z',
    'wellStatus': 'Active',
    'dataQuality': 'Good',
  },
];
