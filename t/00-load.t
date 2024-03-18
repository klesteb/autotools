#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 6;

BEGIN {
    use_ok( 'AutoTools' )          || print "Bail out!\n";
    use_ok( 'AutoTools::Globals' ) || print "Bail out!\n";
    use_ok( 'AutoTools::Ignores' ) || print "Bail out!\n";
    use_ok( 'AutoTools::Program' ) || print "Bail out!\n";
    use_ok( 'AutoTools::Static' )  || print "Bail out!\n";
    use_ok( 'AutoTools::Shared' )  || print "Bail out!\n";
}

diag( "Testing autotools $AutoTools::VERSION, Perl $], $^X" );
