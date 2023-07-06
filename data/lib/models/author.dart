import 'package:conduit_core/conduit_core.dart';

import 'post.dart';

class Author extends ManagedObject<_Author> implements _Author {}

class _Author {
  @primaryKey
  int? id;
  ManagedSet<Post>? postList;
}
