package AutoTools::Ignores;

use 5.10.0;
use strict;
use warnings;

use AutoTools::Globals;
use Exporter qw(import);
use File::Spec::Functions;

our @EXPORT = qw( hgignore gitignore );


sub hgignore {
    
    my $fh;
    my $file = catfile($root, ".hgignore");
    my $text = <<"EOT";
syntax: regexp
## The recurrent (^|/) idiom in the regexps below should be understood
## to mean "at any directory" while the ^ idiom means "from the
## project's top-level directory".
      
# The built program
(^|/)$project
(^|/)$project-0.1.tar.gz
(^|/)$project-0.1

## gnulib related files
(^|/)gnulib\$
# This directory gets created by gnulib during the build.
(^|/)libgnu\$
# gnulib makes these silly backup files.
.~\$
      
## m4 related files
# This directory mostly contains cruft during build time, but it does
# contain some Octave code, so be more careful about what we ignore here.
^m4/(?!ax_).+\.m4\$
      
## Autoconf, Automake automatically generated files
^aclocal\\.m4\$
^autom4te\\.cache\$
^config\\.in\\.h\$
^configure\$
(^|/)config.cache\$
(^|/)config.h\$
(^|/)config.log\$
(^|/)config.status\$
      
(^|/)Makefile\\.in\$
^INSTALL\$
      
## CMake associated files
# We don't use CMake, but some IDEs use this index file to indicate
# what files are part of a project (e.g., CLion).
^CMakeLists.txt\$
EOT
      
    open($fh, '>', $file) or die "unable to open $file";
    print $fh $text;
    close $fh;

}

sub gitignore {
    
    my $fh;
    my $file = catfile($root, ".gitignore");
    my $text = <<"EOT";
# The built program
/$project
/$project-0.1.tar.gz
/$project-0.1
      
# VSCode
.vscode/*.log
      
# Backup files (sometimes by autoreconf)
*~
      
# Build
.deps
.libs
libtool
*.la
*.a
*.o
*.lo
.dirstamp
/config.h
/tests/mocks
/tests/runners
/tests/test_*.log
/tests/test_*.trs
test-suite.log
      
# Python
.mypy_cache
__pycache__
      
# http://www.gnu.org/software/automake
    
Makefile.in
/ar-lib
/mdate-sh
/py-compile
/test-driver
/ylwrap
      
# http://www.gnu.org/software/autoconf
    
autom4te.cache
/autoscan.log
/autoscan-*.log
/aclocal.m4
/compile
/config.guess
/config.h.in
/config.log
/config.status
/config.sub
/configure
/configure.scan
/depcomp
/install-sh
/missing
/stamp-h1
      
# https://www.gnu.org/software/libtool/
    
/ltmain.sh
      
# http://www.gnu.org/software/texinfo
    
/texinfo.tex
      
# http://www.gnu.org/software/m4/
    
m4/libtool.m4
m4/ltoptions.m4
m4/ltsugar.m4
m4/ltversion.m4
m4/lt~obsolete.m4
      
# Generated Makefile
# (meta build system like autotools,
# can automatically generate from config.status script
# (which is called by configure script))
Makefile
EOT

    open($fh, '>', $file) or die "unable to open $file";
    print $fh $text;
    close $fh;
      
}

1;

__END__
  
=head1 NAME

AutoTools::Program - A class to create cofiguration file for GNU AutoTools
  
=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head1 SEE ALSO

=head1 AUTHOR

Kevin L. Esteb, E<lt>kevin@kesteb.usE<gt>
  
=head1 COPYRIGHT AND LICENSE

Copyright (c) 2024 Kevin L. Esteb
  
This is free software; you can redistribute it and/or modify it under
the terms of the Artistic License 2.0. For details, see the full text
of the license at http://www.perlfoundation.org/artistic_license_2_0.
  
=cut

