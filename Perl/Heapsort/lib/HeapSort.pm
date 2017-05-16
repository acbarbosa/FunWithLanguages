package HeapSort;

use strict;
use warnings;


sub sort {
    my @input = @_;
    return @input;
}


sub max_heapify {
    my ( $heap_array, $node_index ) = @_;
    my ( $array_index, $left_index, $right_index ) = ( $node_index - 1, 2 * $node_index - 1, 2 * $node_index);
    my $biggest_value_index = $array_index;

    $biggest_value_index = index_with_biggest_value( $heap_array, $biggest_value_index, $left_index );
    $biggest_value_index = index_with_biggest_value( $heap_array, $biggest_value_index, $right_index );

    if( $biggest_value_index != $array_index ) {
        switch_nodes( $heap_array, $biggest_value_index, $array_index );
        return max_heapify( $heap_array, $biggest_value_index + 1 );
    }

    return @{ $heap_array };
}


sub index_with_biggest_value {
    my ( $array, $parent_index, $child_index ) = @_;
    my $array_length = $#{$array};
    my $biggest_value_index = $parent_index;

    if( $child_index <= $array_length &&
        $array->[$child_index] > $array->[$parent_index] ) {
        $biggest_value_index = $child_index;
    }
    return $biggest_value_index;
}


sub switch_nodes {
    my ( $array, $first_index, $second_index ) = @_;
    my $tmp = $array->[$first_index];
    $array->[$first_index] = $array->[$second_index];
    $array->[$second_index] = $tmp;
}


return 1;
