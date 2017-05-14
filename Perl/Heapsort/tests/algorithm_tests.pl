BEGIN {
    use File::Basename;
    use File::Spec 'rel2abs';

    $TEST_DIR = File::Spec->rel2abs( dirname( __FILE ) );
    $LIB_DIR = File::Spec->rel2abs( "$TEST_DIR/lib" );
    push @INC, $LIB_DIR;
}

use Test::Most;
use HeapSort;


subtest "ordenação de array vazio retorna array vazio" => sub {
    my @expected = ();
    my @actual = HeapSort::sort( () );
    ok( is_deeply( \@actual, \@expected ) );
};

done_testing();
