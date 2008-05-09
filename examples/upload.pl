#!/usr/bin/env perl

use strict;
use warnings;
use WWW::TarPipe;

use constant KEY => 'fc5801a505dbe0e71dc28c5cace69810';

my $tp = WWW::TarPipe->new( key => KEY );

while ( my $img = shift ) {
    
    print "$img\n";
    
    open my $if, '<', $img or die "Can't read $img ($!)\n";
    binmode $if;
    my $img_data = do { local $/; <$if> };
    close $if;
    
    $tp->upload( image => $img_data, title => $img );
}
