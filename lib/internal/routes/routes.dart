import 'package:github_repository_finder/internal/integration/pages/search_page/search_page.dart';
import 'package:github_repository_finder/internal/integration/pages/search_result_page/search_result_page.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes(
      [
        SailorRoute(
            name: '/search_page',
            builder: (context, args, params) {
              return SearchPage();
            }),
        SailorRoute(
          name: '/search_result',
          builder: (context, args, params) {
            return SearchResultPage(args);
          },
        ),
      ],
    );
  }
}
