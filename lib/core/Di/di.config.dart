// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../bussinese/news-view-model.dart' as _i126;
import '../../bussinese/RepositoryContract/news-repository.dart' as _i1;
import '../../bussinese/RepositoryContract/sources-repository.dart' as _i1034;
import '../../bussinese/sources-view-model.dart' as _i736;
import '../../data/api/api-manger.dart' as _i745;
import '../../data/DataSourceContract/news-data-source.dart' as _i245;
import '../../data/DataSourceContract/sources-data-source.dart' as _i353;
import '../../data/DataSourceImpl/news-data-source-impl.dart' as _i611;
import '../../data/DataSourceImpl/sources-data-source-impl.dart' as _i675;
import '../../data/Repository/news-repository-impl.dart' as _i1045;
import '../../data/Repository/sources-repository-impl.dart' as _i204;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i745.ApiManger>(() => _i745.ApiManger());
    gh.factory<_i353.SourcesDataSource>(
        () => _i675.SourcesDataSourceImpl(apiManger: gh<_i745.ApiManger>()));
    gh.factory<_i1034.SourcesRepository>(() =>
        _i204.SourcesRepositoryImpl(sources: gh<_i353.SourcesDataSource>()));
    gh.factory<_i245.NewsDataSource>(
        () => _i611.NewsDataSourceImpl(apiManger: gh<_i745.ApiManger>()));
    gh.factory<_i1.NewsRepository>(() =>
        _i1045.NewsRepositoryImpl(newsDataSource: gh<_i245.NewsDataSource>()));
    gh.factory<_i736.SourcesViewModel>(() => _i736.SourcesViewModel(
        sourcesRepository: gh<_i1034.SourcesRepository>()));
    gh.factory<_i126.NewsViewModel>(
        () => _i126.NewsViewModel(newsRepository: gh<_i1.NewsRepository>()));
    return this;
  }
}
