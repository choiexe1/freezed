import 'package:test/test.dart';

import 'integration/concrete.dart';

void main() {
  test('EmptyExtends', () {
    expect(
      EmptyExtends(42),
      isA<Empty>().having(
        (source) => (source as EmptyExtends).value,
        'value',
        42,
      ),
    );
  });

  test('Concrete', () {
    expect(
      Concrete(42),
      isA<A>()
          .having((source) => source.method(), 'method', 42)
          .having((source) => source.value, 'value', 42),
    );
  });

  test('can have const', () {
    const ConstConcrete();
  });

  test('MixedIn', () {
    expect(MixedIn().method(), 42);
  });

  test('does not override toString if one is user-defined', () {
    expect(CustomToString().toString(), '42');
    expect(MixedInToString().toString(), '42');
    expect(BaseToString().toString(), '42');
    expect(const Dollar($test: 'demo').toString(), r'Dollar($test: demo)');
    expect(
      const DollarMiddle(te$st: 'demo').toString(),
      r'DollarMiddle(te$st: demo)',
    );
    expect(
      const DollarEnd(test$: 'demo').toString(),
      r'DollarEnd(test$: demo)',
    );
    expect(const $DollarClass().toString(), r'$DollarClass()');
    expect(const DollarFactory.$().toString(), r'DollarFactory.$()');
  });
}
