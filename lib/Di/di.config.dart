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
import '../data-layer/Repository/DataSourceContract/news-data-source.dart'
    as _i550;
import '../data-layer/Repository/DataSourceContract/sources-data-source.dart'
    as _i667;
import '../data-layer/Repository/DataSourceImpl/news-data-source-impl.dart'
    as _i600;
import '../data-layer/Repository/DataSourceImpl/sources-data-source-impl.dart'
    as _i127;
import '../data-layer/Repository/RepositoryIpml/news-repository-impl.dart'
    as _i770;
import '../data-layer/Repository/RepositoryIpml/sources-repository-impl.dart'
    as _i327;

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
    gh.factory<_i550.NewsDataSource>(
        () => _i600.NewsDataSourceImpl(apiManger: gh<_i989.ApiManger>()));
    gh.factory<_i667.SourcesDataSource>(
        () => _i127.SourcesDataSourceImpl(apiManger: gh<_i989.ApiManger>()));
    gh.factory<_i750.NewsRepository>(() =>
        _i770.NewsRepositoryImpl(newsDataSource: gh<_i550.NewsDataSource>()));
    gh.factory<_i30.NewsViewModel>(
        () => _i30.NewsViewModel(newsRepository: gh<_i750.NewsRepository>()));
    gh.factory<_i1044.SourcesRepository>(() =>
        _i327.SourcesRepositoryImpl(sources: gh<_i667.SourcesDataSource>()));
    gh.factory<_i935.SourcesViewModel>(() => _i935.SourcesViewModel(
        sourcesRepository: gh<_i1044.SourcesRepository>()));
    return this;
  }
}
