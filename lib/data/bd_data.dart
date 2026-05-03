import 'package:latlong2/latlong.dart';

class District {
  final String name, division, desc, famous, population;
  final double lat, lng;
  final int area;
  const District({
    required this.name, required this.division,
    required this.lat, required this.lng, required this.area,
    required this.population, required this.desc, required this.famous,
  });
}

class RiverData {
  final String name, origin, destination, length, desc, color;
  final List<LatLng> coords;
  const RiverData({
    required this.name, required this.origin,
    required this.destination, required this.length,
    required this.desc, required this.color, required this.coords,
  });
}

class HistoricPlace {
  final String name, period, year, desc, icon;
  final double lat, lng;
  const HistoricPlace({
    required this.name, required this.period,
    required this.year, required this.desc,
    required this.icon, required this.lat, required this.lng,
  });
}

class BorderPoint {
  final String name, country, type, desc;
  final double lat, lng;
  const BorderPoint({
    required this.name, required this.country,
    required this.type, required this.desc,
    required this.lat, required this.lng,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answer;
  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

const List<District> kDistricts = [
  District(name:'Dhaka', division:'Dhaka', lat:23.8103, lng:90.4125,
    area:1463, population:'10.3 million',
    desc:'Capital and largest city of Bangladesh.',
    famous:'Lalbagh Fort, Ahsan Manzil, National Parliament'),
  District(name:'Chittagong', division:'Chittagong', lat:22.3419, lng:91.8155,
    area:5283, population:'8.9 million',
    desc:'Main seaport and second largest city.',
    famous:'Karnaphuli River, Patenga Beach'),
  District(name:'Sylhet', division:'Sylhet', lat:24.8949, lng:91.8687,
    area:3452, population:'3.4 million',
    desc:'Famous for tea gardens and haor wetlands.',
    famous:'Ratargul, Jaflong, Shah Jalal Mazar'),
  District(name:'Rajshahi', division:'Rajshahi', lat:24.3636, lng:88.6241,
    area:2425, population:'3.9 million',
    desc:'Mango capital of Bangladesh.',
    famous:'Bagha Mosque, Puthia Rajbari, Varendra Museum'),
  District(name:'Khulna', division:'Khulna', lat:22.8456, lng:89.5403,
    area:4394, population:'2.3 million',
    desc:'Gateway to the Sundarbans mangrove forest.',
    famous:'Sundarbans, Shatgombuj Mosque, Rupsha Bridge'),
  District(name:'Barisal', division:'Barisal', lat:22.7010, lng:90.3535,
    area:2784, population:'2.8 million',
    desc:'River city on the Kirtankhola river.',
    famous:'Durga Sagar, Shere Bangla birthplace'),
  District(name:'Rangpur', division:'Rangpur', lat:25.7439, lng:89.2752,
    area:2308, population:'2.9 million',
    desc:'Heart of northern Bangladesh.',
    famous:'Tajhat Palace, Begum Rokeya home'),
  District(name:'Mymensingh', division:'Mymensingh', lat:24.7471, lng:90.4203,
    area:4363, population:'5.8 million',
    desc:'Agricultural hub on old Brahmaputra river.',
    famous:'Muktagacha Monda, Botanical Garden'),
  District(name:"Cox's Bazar", division:'Chittagong', lat:21.4272, lng:92.0058,
    area:2492, population:'2.3 million',
    desc:'World longest sea beach city (120 km).',
    famous:'Sea Beach, Himchari, Inani Beach'),
  District(name:'Comilla', division:'Chittagong', lat:23.4607, lng:91.1809,
    area:3146, population:'6.2 million',
    desc:'Famous for Rosmalai and Buddhist heritage.',
    famous:'Shalban Vihara, Mainamati, War Cemetery'),
  District(name:'Jessore', division:'Khulna', lat:23.1664, lng:89.2082,
    area:2607, population:'2.9 million',
    desc:'Flower district. First liberated in 1971.',
    famous:'Michael Madhusudan home, Bagaan House'),
  District(name:'Bogura', division:'Rajshahi', lat:24.8466, lng:89.3773,
    area:2919, population:'3.6 million',
    desc:'Ancient city known for Mahasthangarh.',
    famous:'Mahasthangarh, Behular Basarghor'),
];

const List<RiverData> kRivers = [
  RiverData(
    name:'Padma', origin:'Himalayas', destination:'Meets Meghna',
    length:'120 km in BD', desc:'Main branch of the Ganges. Most important river.',
    color:'#3b82f6',
    coords:[LatLng(25.0,88.5),LatLng(24.5,88.8),LatLng(23.9,89.5),LatLng(23.5,90.0),LatLng(23.2,90.5)],
  ),
  RiverData(
    name:'Meghna', origin:'Surma-Kushiyara', destination:'Bay of Bengal',
    length:'160 km', desc:'Carries combined flow of Padma and Jamuna.',
    color:'#06b6d4',
    coords:[LatLng(24.5,90.8),LatLng(23.9,90.7),LatLng(23.3,90.9),LatLng(22.8,91.2)],
  ),
  RiverData(
    name:'Jamuna', origin:'Brahmaputra', destination:'Meets Padma',
    length:'250 km', desc:'Main channel of Brahmaputra. Main cause of floods.',
    color:'#8b5cf6',
    coords:[LatLng(25.5,89.5),LatLng(25.0,89.7),LatLng(24.5,89.9),LatLng(24.0,90.1),LatLng(23.5,90.2)],
  ),
  RiverData(
    name:'Karnaphuli', origin:'Mizoram Hills', destination:'Bay of Bengal',
    length:'320 km', desc:'Main river of Chittagong. Kaptai dam is here.',
    color:'#f59e0b',
    coords:[LatLng(22.8,92.3),LatLng(22.5,91.9),LatLng(22.3,91.5)],
  ),
  RiverData(
    name:'Surma', origin:'Barak River', destination:'Kalni River',
    length:'250 km', desc:'Main river of Sylhet. Flows through haor region.',
    color:'#10b981',
    coords:[LatLng(25.1,92.3),LatLng(24.9,91.9),LatLng(24.7,91.5),LatLng(24.5,91.0)],
  ),
];

const List<HistoricPlace> kHistoricPlaces = [
  HistoricPlace(name:'Lalbagh Fort', period:'Mughal Era', year:'1678',
    desc:'Tomb of Pari Bibi daughter of Shaista Khan.', icon:'\u{1F3F0}', lat:23.7195, lng:90.3893),
  HistoricPlace(name:'Ahsan Manzil', period:'Nawab Era', year:'1859',
    desc:'Pink Palace of Dhaka Nawabs. Now national museum.', icon:'\u{1F3DB}', lat:23.7093, lng:90.4067),
  HistoricPlace(name:'Shatgombuj Mosque', period:'Sultanate', year:'15th century',
    desc:'Largest ancient mosque. UNESCO World Heritage.', icon:'\u{1F54C}', lat:22.6605, lng:89.4777),
  HistoricPlace(name:'Mahasthangarh', period:'Ancient', year:'3rd century BC',
    desc:'Oldest archaeological site of Bangladesh.', icon:'\u{1F3DB}', lat:24.9756, lng:89.3463),
  HistoricPlace(name:'Paharpur', period:'Pala Dynasty', year:'8th century',
    desc:'Sompur Mahavihara. UNESCO World Heritage.', icon:'\u{1F5FF}', lat:25.0319, lng:88.9758),
  HistoricPlace(name:'Shalban Vihara', period:'Buddhist Era', year:'7th century',
    desc:'Buddhist monastery in Comilla.', icon:'\u{1F3EF}', lat:23.3945, lng:91.2094),
];

const List<BorderPoint> kBorderPoints = [
  BorderPoint(name:'Benapole', country:'India', type:'Land Port',
    desc:'Busiest land port between Bangladesh and India.', lat:23.0096, lng:88.8802),
  BorderPoint(name:'Burimari', country:'India', type:'Land Port',
    desc:'Important border point of northern Bangladesh.', lat:25.8820, lng:89.3505),
  BorderPoint(name:'Akhaura', country:'India', type:'Land Port',
    desc:'Important port connected to Tripura.', lat:23.8765, lng:91.2040),
  BorderPoint(name:'Teknaf', country:'Myanmar', type:'River Port',
    desc:'Myanmar border on Naf river bank.', lat:20.8647, lng:92.2988),
];

const List<QuizQuestion> kQuizQuestions = [
  QuizQuestion(
    question:'Which district does the Padma river enter Bangladesh through?',
    options:['Rajshahi','Kushtia','Chapainawabganj','Pabna'], answer:2),
  QuizQuestion(
    question:'Which is the largest district of Bangladesh by area?',
    options:['Rangamati','Chittagong','Mymensingh','Sylhet'], answer:0),
  QuizQuestion(
    question:'The Sundarbans forest is located in which division?',
    options:['Dhaka','Chittagong','Khulna','Barisal'], answer:2),
  QuizQuestion(
    question:'Shatgombuj Mosque is in which district?',
    options:['Khulna','Bagerhat','Satkhira','Jessore'], answer:1),
  QuizQuestion(
    question:'Kaptai Lake was built on which river?',
    options:['Sangu','Karnaphuli','Matamuhuri','Halda'], answer:1),
  QuizQuestion(
    question:'Mahasthangarh is in which district?',
    options:['Rajshahi','Natore','Bogura','Pabna'], answer:2),
  QuizQuestion(
    question:'How many districts are in Bangladesh?',
    options:['60','62','64','66'], answer:2),
  QuizQuestion(
    question:'What is the only coral island of Bangladesh?',
    options:['Maheshkhali','Sandwip','St. Martin','Hatia'], answer:2),
  QuizQuestion(
    question:'Tanguar Haor is in which district?',
    options:['Netrokona','Sunamganj','Habiganj','Moulvibazar'], answer:1),
  QuizQuestion(
    question:'Which is the largest river port of Bangladesh?',
    options:['Dhaka','Narayanganj','Chandpur','Barisal'], answer:1),
];
