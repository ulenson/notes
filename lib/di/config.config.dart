// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/notes/note_repo.dart' as _i3;
import '../domain/interactor/notes.dart' as _i4;
import '../ui/notes/note_store.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.NotesRepo>(() => _i3.NotesRepo());
  gh.factory<_i4.NotesInteractor>(
      () => _i4.NotesInteractor(get<_i3.NotesRepo>()));
  gh.factory<_i5.NoteStore>(() => _i5.NoteStore(get<_i4.NotesInteractor>()));
  return get;
}
