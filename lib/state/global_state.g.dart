// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GlobalState _$_$_GlobalStateFromJson(Map<String, dynamic> json) {
  return _$_GlobalState(
    locale: const LocaleConverter().fromJson(json['locale'] as String?),
    themeMode: _$enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
  );
}

Map<String, dynamic> _$_$_GlobalStateToJson(_$_GlobalState instance) =>
    <String, dynamic>{
      'locale': const LocaleConverter().toJson(instance.locale),
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
