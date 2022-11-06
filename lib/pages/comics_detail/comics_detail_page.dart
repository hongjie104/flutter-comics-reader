import 'package:comics_reader/provider.dart';
import 'package:flutter/material.dart';

import '../page_state.dart';

class ComicsDetailPage extends StatefulWidget {
  final CoverData coverData;
  const ComicsDetailPage({super.key, required this.coverData});

  @override
  ComicsDetailPageState createState() => ComicsDetailPageState();
}

class ComicsDetailPageState extends FetchDataPageState<ComicsDetailPage> {
  @override
  String get title => "ComicsDetailPage";

  @override
  Widget buildFetchedBody({data}) {
    return Text("aa");
  }

  @override
  Future fetchData([bool isFristTime = true]) async {
    // final data = await Provider().getKoreanMangaDetail(widget.coverData.url);
    final data = await Provider()
        .getKoreanMangaImages('/photos-slidelow-aid-177299.html');
    return Future.value(data);
  }
}
