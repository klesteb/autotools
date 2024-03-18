use 5.006;
use strict;
use warnings;
use Module::Build;
Module::Build->VERSION('0.4004');

my $builder = Module::Build->new(
    module_name         => 'autotools',
    license             => 'artistic_2',
    dist_author         => q{Kevin L. Esteb <kevin@kesteb.us>},
    dist_version_from   => 'lib/AutoTools.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => '0.4004',
    },
    test_requires => {
        'Test::More' => '0',
    },
    requires => {
        'perl'            => 5.010_0,
        'Try::Tiny'       => 0,
        'Pod::Usage'      => 0,
        'File::Path'      => 0,
        'Hash::Merge'     => 0,
        'Getopt::Long'    => 0,
        'Time::Piece'     => 0,
        'File::Spec'      => 0,
        'Module::Runtime' => 0,
    },
    add_to_cleanup     => [ 'autotools-*' ],
);

$builder->create_build_script();
