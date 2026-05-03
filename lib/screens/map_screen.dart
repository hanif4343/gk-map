import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/bd_data.dart';
import '../widgets/info_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapCtrl = MapController();
  bool _showDistricts = true, _showRivers = true;
  bool _showHistoric = false, _showBorder = true;
  String? _infoTitle, _infoBody;

  void _showInfo(String title, String body) =>
    setState(() { _infoTitle = title; _infoBody = body; });

  void _closeInfo() =>
    setState(() { _infoTitle = null; _infoBody = null; });

  Color _hexColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050D05),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapCtrl,
            options: MapOptions(
              initialCenter: const LatLng(23.6850, 90.3563),
              initialZoom: 7.0,
              onTap: (_, __) => _closeInfo(),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.hanif.gkmap',
              ),
              if (_showRivers)
                PolylineLayer(
                  polylines: kRivers.map((r) => Polyline(
                    points: r.coords,
                    color: _hexColor(r.color),
                    strokeWidth: 3.5,
                    borderColor: Colors.black26,
                    borderStrokeWidth: 1,
                  )).toList(),
                ),
              if (_showDistricts)
                MarkerLayer(
                  markers: kDistricts.map((d) => Marker(
                    point: LatLng(d.lat, d.lng),
                    width: 90,
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        _mapCtrl.move(LatLng(d.lat, d.lng), 10);
                        _showInfo(
                          d.name,
                          'Division: ${d.division}\nArea: ${d.area} sq km\nPopulation: ${d.population}\n\n${d.desc}\n\nFamous: ${d.famous}',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xCC0A1A0A),
                          border: Border.all(color: const Color(0xFF4ADE80)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.circle, size: 5, color: Color(0xFF4ADE80)),
                            const SizedBox(width: 3),
                            Flexible(
                              child: Text(d.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF4ADE80),
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              if (_showHistoric)
                MarkerLayer(
                  markers: kHistoricPlaces.map((h) => Marker(
                    point: LatLng(h.lat, h.lng),
                    width: 36,
                    height: 36,
                    child: GestureDetector(
                      onTap: () => _showInfo(
                        h.name,
                        'Period: ${h.period}\nBuilt: ${h.year}\n\n${h.desc}',
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xCC2d1b00),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFfbbf24)),
                        ),
                        child: const Icon(Icons.account_balance,
                          color: Color(0xFFfbbf24), size: 18),
                      ),
                    ),
                  )).toList(),
                ),
              if (_showBorder)
                MarkerLayer(
                  markers: kBorderPoints.map((b) => Marker(
                    point: LatLng(b.lat, b.lng),
                    width: 30,
                    height: 30,
                    child: GestureDetector(
                      onTap: () => _showInfo(
                        b.name,
                        'Country: ${b.country}\nType: ${b.type}\n\n${b.desc}',
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFDC2626),
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(
                            color: Colors.red.withOpacity(.4), blurRadius: 8)],
                        ),
                        child: const Icon(Icons.flag, color: Colors.white, size: 16),
                      ),
                    ),
                  )).toList(),
                ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 12, right: 12,
            child: _buildSearchBar(),
          ),
          Positioned(
            right: 12,
            top: MediaQuery.of(context).padding.top + 68,
            child: _buildLayerControls(),
          ),
          if (_infoTitle != null)
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: InfoCard(
                title: _infoTitle!,
                body: _infoBody!,
                onClose: _closeInfo,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A1A0A),
          border: Border.all(color: const Color(0xFF1A4A1A)),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 12)],
        ),
        child: TextField(
          style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 14),
          decoration: const InputDecoration(
            hintText: 'Search district, river, historic place...',
            hintStyle: TextStyle(color: Color(0xFF4A7A4A), fontSize: 13),
            prefixIcon: Icon(Icons.search, color: Color(0xFF4ADE80), size: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
          onChanged: (v) {
            if (v.isEmpty) return;
            final all = [
              ...kDistricts.map((d) => MapEntry(d.name, LatLng(d.lat, d.lng))),
              ...kHistoricPlaces.map((h) => MapEntry(h.name, LatLng(h.lat, h.lng))),
              ...kBorderPoints.map((b) => MapEntry(b.name, LatLng(b.lat, b.lng))),
            ];
            final found = all.where((e) =>
              e.key.toLowerCase().contains(v.toLowerCase())).toList();
            if (found.isNotEmpty) {
              _mapCtrl.move(found.first.value, 10);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLayerControls() {
    return Column(children: [
      _layerBtn(Icons.location_city, _showDistricts,
        () => setState(() => _showDistricts = !_showDistricts)),
      _layerBtn(Icons.water, _showRivers,
        () => setState(() => _showRivers = !_showRivers)),
      _layerBtn(Icons.account_balance, _showHistoric,
        () => setState(() => _showHistoric = !_showHistoric)),
      _layerBtn(Icons.flag, _showBorder,
        () => setState(() => _showBorder = !_showBorder)),
    ]);
  }

  Widget _layerBtn(IconData icon, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF0D3320) : const Color(0xFF0A1A0A),
          border: Border.all(
            color: active ? const Color(0xFF4ADE80) : const Color(0xFF1A4A1A)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.4), blurRadius: 8)],
        ),
        child: Icon(icon,
          color: active ? const Color(0xFF4ADE80) : const Color(0xFF4A7A4A),
          size: 20),
      ),
    );
  }
}
