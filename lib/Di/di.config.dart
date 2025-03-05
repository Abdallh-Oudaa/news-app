// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../bussinese-logic-layer/news-view-model.dart' as _i30;
import '../bussinese-logic-layer/RepositoryContract/news-repository.dart'
    as _i750;
import '../bussinese-logic-layer/RepositoryContract/sources-repository.dart'
    as _i1044;
import '../bussinese-logic-layer/sources-view-model.dart' as _i935;
import '../data-layer/api/api-manger.dart' as _i989;
import '../data-layer/DataSourceContract/news-data-source.dart' as _i41;
import '../data-layer/DataSourceContract/sources-data-source.dart' as _i1011;
import '../data-layer/DataSourceImpl/news-data-source-impl.dart' as _i912;
import '../data-layer/DataSourceImpl/sources-data-source-impl.dart' as _i560;
import '../data-layer/Repository/news-repository-impl.dart' as _i427;
import '../data-layer/Repository/sources-repository-impl.dart' as _i951;

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
    gh.singleton<_i989.ApiManger>(() => _i989.ApiManger());
    gh.factory<_i41.NewsDataSource>(
        () => _i912.NewsDataSourceImpl(apiManger: gh<_i989.ApiManger>()));
    gh.factory<_i1011.SourcesDataSource>(
        () => _i560.SourcesDataSourceImpl(apiManger: gh<_i989.ApiManger>()));
    gh.factory<_i750.NewsRepository>(() =>
        _i427.NewsRepositoryImpl(newsDataSource: gh<_i41.NewsDataSource>()));
    gh.factory<_i1044.SourcesRepository>(() =>
        _i951.SourcesRepositoryImpl(sources: gh<_i1011.SourcesDataSource>()));
    gh.factory<_i30.NewsViewModel>(
        () => _i30.NewsViewModel(newsRepository: gh<_i750.NewsRepository>()));
    gh.factory<_i935.SourcesViewModel>(() => _i935.SourcesViewModel(
        sourcesRepository: gh<_i1044.SourcesRepository>()));
    return this;
  }
}
