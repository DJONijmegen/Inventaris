#!/usr/bin/perl -w

use strict;

use MongoDB;
use JSON::PP;

my $client = MongoDB->connect( 'mongodb://localhost' );
my $parts  = $client->ns( 'djonijmegen.parts' );

print "Search for: ";
my $q = <>;
chomp $q;

my $cursor = $parts->find( { "model" => { '$regex' => $q } } );

while ( my $part = $cursor->next ) {

	print JSON::PP->new()->pretty->canonical->encode( $part );

}
