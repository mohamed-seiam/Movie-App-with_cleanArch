import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/presentation/screens/section/section_screen_arguments.dart';
import 'package:movies_app/presentation/screens/section/widgets/section_body_view.dart';

import '../../blocs/section/sections_cubit.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({super.key, required this.moviesArguments});

  final SectionMoviesArguments moviesArguments;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  late SectionsCubit sectionsCubit;

  @override
  void initState() {
    sectionsCubit = getItInstance.get<SectionsCubit>();
    sectionsCubit.getSectionMovies(index: widget.moviesArguments.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moviesArguments.title),
      ),
      body: BlocProvider.value(
          value: sectionsCubit,
          child: SectionBodyView(
            index: widget.moviesArguments.index,
          )),
    );
  }
}
