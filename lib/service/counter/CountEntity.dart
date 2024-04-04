class CountEntity {

  final int _count;


  CountEntity(this._count);

  //
  // getters

  int get count => _count;


  // copy method

  CountEntity copy([int? count]) {
    return CountEntity(count ?? _count);
  }
}