import 'package:onlin/services/location_service.dart';

/// 地址格式示例
void main() async {
  print('=== 详细地址格式示例 ===\n');
  
  final locationService = LocationService();
  
  // 测试自贡市荣县双石镇的地址格式
  print('1. 测试自贡市荣县双石镇地址格式...');
  DetailedAddress? detailedAddress = await locationService.getDetailedAddressFromCoordinates(
    29.4, // 自贡市荣县双石镇附近的坐标
    104.8,
  );
  
  if (detailedAddress != null) {
    print('原始地址信息:');
    print('  国家: ${detailedAddress.country}');
    print('  省份: ${detailedAddress.administrativeArea}');
    print('  城市: ${detailedAddress.locality}');
    print('  县/区: ${detailedAddress.county}');
    print('  镇/街道: ${detailedAddress.town}');
    print('  道路: ${detailedAddress.thoroughfare}');
    print('  门牌号: ${detailedAddress.subThoroughfare}');
    
    print('\n不同格式的地址显示:');
    print('  标准格式: ${detailedAddress.toDisplayString()}');
    print('  街道级别: ${detailedAddress.getStreetLevelAddress()}');
    print('  区县级别: ${detailedAddress.getDistrictLevelAddress()}');
    print('  完整详细: ${detailedAddress.getFullDetailedAddress()}');
    
    // 期望输出: "中国四川省自贡市荣县双石镇民生街57号"
    print('\n期望格式: 中国四川省自贡市荣县双石镇民生街57号');
    print('实际输出: ${detailedAddress.getFullDetailedAddress()}');
  }
  
  print('\n2. 测试其他城市的地址格式...');
  
  // 测试其他城市的地址格式
  List<Map<String, dynamic>> testCities = [
    {'name': '北京天安门', 'lat': 39.9042, 'lng': 116.4074},
    {'name': '上海外滩', 'lat': 31.2304, 'lng': 121.4737},
    {'name': '广州塔', 'lat': 23.1291, 'lng': 113.2644},
    {'name': '深圳市民中心', 'lat': 22.5431, 'lng': 114.0579},
  ];
  
  for (var city in testCities) {
    print('\n${city['name']}:');
    DetailedAddress? address = await locationService.getDetailedAddressFromCoordinates(
      city['lat'],
      city['lng'],
    );
    
    if (address != null) {
      print('  完整地址: ${address.getFullDetailedAddress()}');
    }
  }
  
  print('\n3. 地址格式说明:');
  print('   - toDisplayString(): 标准显示格式');
  print('   - getStreetLevelAddress(): 街道级别地址');
  print('   - getDistrictLevelAddress(): 区县级别地址');
  print('   - getFullDetailedAddress(): 完整详细地址（推荐使用）');
  
  print('\n4. 地址字段说明:');
  print('   - country: 国家');
  print('   - administrativeArea: 省份');
  print('   - locality: 城市');
  print('   - county: 县/区');
  print('   - town: 镇/街道');
  print('   - thoroughfare: 道路名');
  print('   - subThoroughfare: 门牌号');
  
  print('\n=== 示例完成 ===');
} 