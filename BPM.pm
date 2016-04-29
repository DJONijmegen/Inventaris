package BPM;

# vim: set sw=4 sts=4 si:

use strict;

use Data::Printer;
use JSON::PP;

sub filename {
    die "Stub: Please define your own sub filename { return \"...\" }";
}

sub new {
    my $class = shift;

    my $self = bless {}, $class;

    $self->load( $self->filename() );

    return $self;
}

sub load {
    my $self = shift;
    my ( $name ) = @_;

    open FH, "<", $name or die "Can't open $name: $!";
    my $raw = join "", <FH>;
    close FH;

    my $data = JSON::PP->new()->utf8->decode( $raw );

    $self->{ name } = $name;
    $self->{ data } = $data;    
}

sub save {
    my $self = shift;
    my $data = $self->{ data };
    my $name = $self->{ name };

    open FH, ">", $name or die "Can't write to $name: $!";
    print FH JSON::PP->new()->utf8->pretty->canonical->encode( $data );
    close FH;
}

sub item {
    my $self = shift;
    my $data = $self->{ data };
    my ( $n ) = @_;

    return $data->{ $n };
}

sub DESTROY {
    my $self = shift;

    $self->save();
}

1;
