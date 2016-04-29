package Bag;

# vim: set sw=4 sts=4 si:

use strict;

use Data::Printer;
use JSON::PP;

use parent qw( BPM );

sub filename {
    return 'b.json';
}

#sub new {
#    my $class = shift;
#
#    my $self = bless {}, $class;
#
#    $self->load( 'b.json' );
#
#    return $self;
#}

#sub load {
#    my $self = shift;
#    my ( $name ) = @_;
#
#    open FH, "<", $name or die "Can't open $name: $!";
#    my $raw = join "", <FH>;
#    close FH;
#
#    my $data = JSON::PP->new()->utf8->decode( $raw );
#
#    $self->{ name } = $name
#    $self->{ data } = $data;    
#}

sub last {
    my $self = shift;
    my $data = $self->{ data };

    return ( sort { $a <=> $b } grep { /^\d+$/ } keys %$data )[ -1 ];
}

#sub save {
#    my $self = shift;
#    my $data = $self->{ data };
#    my $name = $self->{ name };
#
#    open FH, ">", $name or die "Can't write to $name: $!";
#    print FH JSON::PP->new()->utf8->pretty->canonical->encode( $data );
#    close FH;
#}

sub item {
    my $self = shift;
    my $data = $self->{ data };
    my ( $n ) = @_;

    return $data->{ sprintf( "%07d", $n ) };
}

#sub DESTROY {
#    my $self = shift;
#
#    $self->save();
#}

1;
