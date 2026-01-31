import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SafeSvg extends StatelessWidget {
  final String url;
  final double size;

  const SafeSvg({
    super.key,
    required this.url,
    this.size = 45,
  });

  Future<String?> _fetchSvg() async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode != 200) return null;

      final body = res.body.trim();
      if (!body.startsWith('<svg')) return null;

      return body;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _fetchSvg(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(width: size, height: size);
        }

        if (snapshot.hasData && snapshot.data != null) {
          return SvgPicture.string(
            snapshot.data!,
            width: size,
            height: size,
            fit: BoxFit.cover,
          );
        }

        return Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            url.split('/')[4].substring(0, 1), 
            style: TextStyle(
              color: Colors.black54, 
              fontSize: 18, 
              fontWeight: FontWeight.bold
            ),
          )
        );
      },
    );
  }
}