package AutoTools::Globals;

use 5.10.0;
use strict;
use warnings;

use Exporter qw( import );

#
# globals
#

our $root;
our $source;
our $include;
our $license;
our $mode = '0755';
our $directory = '.';
our $project = 'testing';
our $author = $ENV{'USER'};
our $email = "$author\@example.com";

our @EXPORT = qw( $root $source $include $license $mode 
                  $directory $author $email $project );

1;

__END__
  
=head1 NAME

AutoTools::Globals - A package that contains global variables
  
=head1 SYNOPSIS

 use AutoTools::Globals;

=head1 DESCRIPTION

This package contains the global variables used by the other packages.

=head1 METHODS

No methods are defined. This package exports the following variables:

=over 4

=item B<$root>

=item B<$source>

=item B<$include>

=item B<$license>

=item B<$mode>

=item B<$directory>

=item B<$project>

=item B<$author>

=item B<$email>

=back

=head1 SEE ALSO

=over 4

=item L<Autotools|AutoTools>

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

