import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Diary = prefs.getStringList('ff_Diary') ?? _Diary;
  }

  late SharedPreferences prefs;

  List<String> _Diary = [];
  List<String> get Diary => _Diary;
  set Diary(List<String> _value) {
    _Diary = _value;
    prefs.setStringList('ff_Diary', _value);
  }

  void addToDiary(String _value) {
    _Diary.add(_value);
    prefs.setStringList('ff_Diary', _Diary);
  }

  void removeFromDiary(String _value) {
    _Diary.remove(_value);
    prefs.setStringList('ff_Diary', _Diary);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
