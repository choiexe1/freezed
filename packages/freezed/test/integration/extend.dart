import 'package:freezed_annotation/freezed_annotation.dart';

part 'extend.freezed.dart';

class Base {
  const Base.named(this.value);
  final int value;
}

@freezed
abstract class Subclass extends Base with _$Subclass {
  const Subclass._(super.value) : super.named();
  const factory Subclass(int value) = _Subclass;
}

class BaseWithEqual {
  const BaseWithEqual([this.another = 0]);
  final int another;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BaseWithEqual) return false;
    return another == other.another;
  }

  @override
  int get hashCode => another.hashCode;
}

@freezed
class Subclass2 extends BaseWithEqual with _$Subclass2 {
  Subclass2([this.value = 0, super.another = 0]) : super();

  @override
  final int value;
}

class EqualWithoutHashCode {
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EqualWithoutHashCode) return false;
    return true;
  }
}

class HashCodeWithoutEqual {
  @override
  // ignore: hash_and_equals
  int get hashCode => 42;
}

@freezed
class Subclass3 extends EqualWithoutHashCode with _$Subclass3 {
  Subclass3(this.value) : super();

  @override
  final int value;
}

@freezed
class Subclass4 extends HashCodeWithoutEqual with _$Subclass4 {
  Subclass4(this.value) : super();

  @override
  final int value;
}
