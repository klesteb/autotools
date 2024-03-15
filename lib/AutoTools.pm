package AutoTools;

use 5.10.0;
use strict;
use warnings;

use Exporter qw(import);

our $VERSION = '1.0.0';
our @EXPORT = qw( $VERSION );

1; # End of autotools

__END__
  
=head1 NAME

AutoTools - A package to create cofiguration for GNU AutoTools
  
=head1 DESCRIPTION

This package, along with the autotools-starter program, is used to create 
files and directories for GNU AutoTools based code. This is primarily for 
C code, but the configuration can be modified to be used by other languages. 
I am calling this code base a "project". The term "project" can have many 
different meanings, based on your coding environment.

The GNU AutoTools tool chain has been used for many years and has many web
sites documenting what you should do to set it up. Many of them are confusing, 
to say the least. This package codifies one way of doing this. 

The autotools-starter program is modeled after Perl's module-starter program.
Which codifies one way to set up files and directories for Perl modules 
and programs.

=head1 INSTALLATION

Once you have downloaded, checked out or otherwise aquired this distribution
you can do the following to install the code:

    > perl Build.PL
    > ./Build
    > ./Build test
    > ./Build install

=head1 USAGE

Once this is done, you can proceed to create your "project". To do so, you 
can do the following:

    > autotools-starter project --author "Kevin L. Esteb" /
      --email "kevin@kesteb.us" / 
      --license artistic2
    > cd project
    > ./autogen.sh
    > ./configure
    > make
    > cd src
    > ./project
    Hello World
    >

If all goes well, this should have compiled the sample project.c in the src 
directory. It is now your job to expand on the sample code and create 
something "cool".

=head1 SEE ALSO

=over 4

=item L<autotools-starter|autotools-starter>

=item L<AutoTools::Global|AutoTools::Ignores>

=item L<AutoTools::Ignores|AutoTools::Ignores>

=item L<AutoTools::Program|AutoTools::Program>

=item L<AutoTools::Shared|AutoTools::Shared>

=item L<AutoTools::Static|AutoTools::Static>

=back

=head1 AUTHOR

Kevin L. Esteb, E<lt>kevin@kesteb.usE<gt>
  
=head1 COPYRIGHT AND LICENSE

Copyright (c) 2024 Kevin L. Esteb
  
This is free software; you can redistribute it and/or modify it under
the terms of the Artistic License 2.0. For details, see the full text
of the license at http://www.perlfoundation.org/artistic_license_2_0.
  
=cut

