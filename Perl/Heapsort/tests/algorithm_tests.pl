BEGIN {
    use File::Basename;
    use File::Spec 'rel2abs';

    $TEST_DIR = File::Spec->rel2abs( dirname( __FILE ) );
    $LIB_DIR = File::Spec->rel2abs( "$TEST_DIR/lib" );
    push @INC, $LIB_DIR;
}

use Test::Most;
use HeapSort;


subtest "ordenação de array vazio" => sub {
    my @actual = HeapSort::sort( () );
    ok( is_deeply( \@actual, [] ) );
};

subtest "ordenação de array com um único elemento" => sub {
    my @actual = HeapSort::sort( (9) );
    ok( is_deeply( \@actual, [9] ) );
};

subtest "ordenação de array ordenado com dois elementos" => sub {
    my @actual = HeapSort::sort( (3, 9) );
    ok( is_deeply( \@actual, [3, 9] ) );
};

subtest "ordena heap para heap de tamanho 1" => sub {
    my @actual = HeapSort::max_heapify( [23], 1 );
    ok( is_deeply( \@actual, [23] ) );
};

subtest "ordena heap de tamanho 2" => sub {
    my $expected = [23, 11];

    my @actual = HeapSort::max_heapify( [23, 11], 1 );
    ok( is_deeply( \@actual, $expected ) );

    @actual = HeapSort::max_heapify( [11, 23], 1 );
    ok( is_deeply( \@actual, $expected ) );
};

subtest "ordena heap de tamanho 3" => sub {
    my $expected = [4, 3, 2];

    my @actual = HeapSort::max_heapify( [4, 3, 2], 1 );
    ok( is_deeply( \@actual, $expected ) );

    @actual = HeapSort::max_heapify( [3, 4, 2], 1 );
    ok( is_deeply( \@actual, $expected ) );

    @actual = HeapSort::max_heapify( [2, 3, 4], 1 );
    ok( is_deeply( \@actual, $expected ) );
};

subtest "ordena heap de tamanho 6" => sub {
    my @actual = HeapSort::max_heapify( [23, 19, 14, 2, 9, 5], 1 );
    ok( is_deeply( \@actual, [23, 19, 14, 2, 9, 5] ) );

    @actual = HeapSort::max_heapify( [19, 23, 14, 2, 9, 5], 1 );
    ok( is_deeply( \@actual, [23, 19, 14, 2, 9, 5] ) );

    @actual = HeapSort::max_heapify( [2, 19, 23, 14, 9, 5], 1 );
    ok( is_deeply( \@actual, [23, 19, 5, 14, 9, 2] ) );

    @actual = HeapSort::max_heapify( [9, 23, 19, 14, 2, 5], 1 );
    ok( is_deeply( \@actual, [23, 14, 19, 9, 2, 5] ) );
};

done_testing();
