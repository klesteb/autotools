package AutoTools::Program;

use 5.10.0;
use strict;
use warnings;

use AutoTools::Globals;
use Exporter qw(import);
use File::Spec::Functions;

our @EXPORT = qw( create_autogen create_src_makefile_am 
                  create_root_config_ac create_root_makefile_am 
                  create_header_code create_source_code);

sub create_autogen {

    my $fh;
    my $file = catfile($root, 'autogen.sh');

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "#!/bin/sh\n";
    print $fh "\n";
    print $fh "# This script is used to automate the process of running some of the autotools\n";
    print $fh "# against their input files (configure.in, Makefile.am) after _any_ of them have\n";
    print $fh "# been updated. The commands and parameters were taken based on a similar script\n";
    print $fh "# found via google and seeing the same commands issued in GNU autotool tutorials.\n";
    print $fh "aclocal\n";
    print $fh "automake --add-missing --force-missing\n";
    print $fh "autoconf\n";
    print $fh "\n";

    close $fh;

    chmod(0700, $file);

}

sub create_src_makefile_am {

    my $fh;
    my $file = catfile($source, 'Makefile.am');

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "# Macro file for use with GNU AutoTools for generating config files and Makefiles.\n";
    print $fh "# This file was manually created based on information found via Google and the\n";
    print $fh "# GNU documentation. Although it works for the source code it's included with,\n";
    print $fh "# it may not be 100% correct so additional research/tweaking may be needed.\n";
    print $fh "#\n";
    print $fh "# bin_PROGRAMS is used to define the binary that's to be built from the\n";
    print $fh "# source code. The binary name will also be used in variable names to\n";
    print $fh "# pass values that will only apply to this binary.\n";
    print $fh "bin_PROGRAMS = $project\n";
    print $fh "# Note: that the following names all start with the binary name defined in\n";
    print $fh "# bin_PROGRAMS.\n";
    print $fh "\n";
    print $fh "# <binary_name>_LDADD is used to pass extra parameters at link time, such as\n";
    print $fh "# libraries that need to be linked in.\n";
    print $fh sprintf("%s_LDADD =\n", $project);
    print $fh "\n";
    print $fh "# <binary_name>_LDFLAGS is used to pass extra parameters at compilation time,\n";
    print $fh "# such as the paths to libraries that are needed that are not in the default\n";
    print $fh "# paths.\n";
    print $fh "# If the user supplies a directory where libpcap is installed, the contents\n";
    print $fh "# of the variable setup in configire.in will be substituted below so the\n";
    print $fh "# library file will be found.\n";
    print $fh sprintf("%s_LDFLAGS =\n", $project);
    print $fh "\n";
    print $fh "# <binary_name>_SOURCES takes a space delimited list of the source code files\n";
    print $fh "# that need to be compiled/linked to build the binary.\n";
    print $fh sprintf("%s_SOURCES = %s.c\n", $project, $project);
    print $fh "\n";
    print $fh "# The AM_CPPFLAGS macro allows us to tell the tools where needed header files are\n";
    print $fh "# located if they aren't in the default paths. In this case it's a subdirectory\n";
    print $fh "# in the source code directory where all the header files are centrally located.\n";
    print $fh "# If the user supplies a directory where libpcap is installed, the contents\n";
    print $fh "# of the variable setup in configire.in will be substituted below so the\n";
    print $fh "# header file will be found\n";
    print $fh "AM_CPPFLAGS = -I../include\n";
    print $fh "\n";

    close $fh;

}

sub create_root_config_ac {

    my $fh;
    my $file = catfile($root, 'configure.ac');

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "#\n";
    print $fh "# Macro file for use with GNU AutoTools for generating config files and Makefiles.\n";
    print $fh "# This file was manually created based on information found via Google and the\n";
    print $fh "# GNU documentation. Although it works for the source code it's included with,\n";
    print $fh "# it may not be 100% correct so additional research/tweaking may be needed.\n";
    print $fh "#\n";
    print $fh "# AC_INIT takes two parameters, the package name and a version number.\n";
    print $fh "AC_INIT([$project], [1.0])\n";
    print $fh "\n";
    print $fh "# AC_CONFIG_SRCDIR takes one parameter, the path and filename\n";
    print $fh "# for one of the source code files.\n";
    print $fh "AC_CONFIG_SRCDIR([src/$project.c])\n";
    print $fh "AM_INIT_AUTOMAKE\n";
    print $fh "AC_PROG_CC\n";
    print $fh "AC_PROG_RANLIB\n";
    print $fh "CFLAGS=\n";
    print $fh "LDFLAGS=\n";
    print $fh "LIBS=\n";
    print $fh "\n";
    print $fh "# This is a reusable macro for providing --with-libfoo functionality.\n";
    print $fh "#\n";
    print $fh "# REQUIRE_LIB(name,lib,testfn,description)\n";
    print $fh "# name = The complete name of the library file without the extension.\n";
    print $fh "# lib = The name of the library file without the 'lib' prefix and without the extension.\n";
    print $fh "# testfn = One function included in the library that can be used for a test compilation.\n";
    print $fh "# description = Human readable text to be displayed if the library can't be found or\n";
    print $fh "# if there's a problem during the test compilation.\n";
    print $fh "AC_DEFUN([REQUIRE_LIB], [ {\n";
    print $fh "    AC_ARG_WITH([\$1], AC_HELP_STRING([--with-\$1=<path>],[Location where \$4 is installed]),[],[with_\$1=default])\n";
    print $fh "    AS_IF( [test \"x\$with_\$1\" != xdefault],\n";
    print $fh "    [\n";
    print $fh "        LDFLAGS=\"\$LDFLAGS -L\${with_\$1}/lib\"\n";
    print $fh "        CFLAGS=\"\$CFLAGS -I\${with_\$1}/include\"\n";
    print $fh "    ])\n";
    print $fh "    AC_CHECK_LIB(\$2,\$3,[],\n";
    print $fh "    [\n";
    print $fh "        AC_MSG_ERROR([\$4 was not found, try specifying --with-\$1])\n";
    print $fh "    ])\n";
    print $fh "} ] )\n";
    print $fh "\n";
    print $fh "# The list of libraries required by the source code that are external to\n";
    print $fh "# our code.\n";
    print $fh "#REQUIRE_LIB(libpcap,pcap,pcap_dump_open,[Libpcap packet capture library])\n";
    print $fh "\n";
    print $fh "# AC_OUTPUT takes a space delimited list of where the Makefiles are to be created.\n";
    print $fh "# You need to pass all directories where there is source code (including the base\n";
    print $fh "# directory containing all of the source code (which won't need a path pre-pended\n";
    print $fh "# to the 'Makefile' keyword).\n";
    print $fh "AC_OUTPUT(Makefile src/Makefile)\n";
    print $fh "\n";

    close $fh;

}

sub create_root_makefile_am {

    my $fh;
    my $file = catfile($root, 'Makefile.am');

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "\n";
    print $fh "# Macro file for use with GNU AutoTools for generating config files and Makefiles.\n";
    print $fh "# This file was manually created based on information found via Google and the\n";
    print $fh "# GNU documentation. Although it works for the source code it's included with,\n";
    print $fh "# it may not be 100% correct so additional research/tweaking may be needed.\n";
    print $fh "\n";
    print $fh "# AUTOMAKE_OPTIONS is used to pass options to 'automake'. In this case\n";
    print $fh "# we're telling it to use the GNU tool chain.\n";
    print $fh "AUTOMAKE_OPTIONS = gnu\n";
    print $fh "\n";
    print $fh "# SUBDIRS takes a space delimited list of _all_ the subdirectories that\n";
    print $fh "# contain source code.\n";
    print $fh "SUBDIRS = src\n";
    print $fh "\n";

    close $fh;

}

sub create_header_code {

    my $fh;
    my $file = catfile($include, "$project.h");

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "\n";
    print $fh "/*\n";
    print $fh $license->notice;
    print $fh "*/\n";
    print $fh "\n";
    print $fh sprintf("#ifndef %s_H\n", uc($project));
    print $fh sprintf("#define %s_H\n", uc($project));
    print $fh "\n";
    print $fh "char global_foo[] = \"Hello World\";\n";
    print $fh "\n";    
    print $fh "#endif\n";
    print $fh "\n";    

    close $fh;

}

sub create_source_code {

    my $fh;
    my $file = catfile($source, "$project.c");

    open($fh, '>', $file) or die "unable to open $file";

    print $fh "\n";
    print $fh "/*\n";
    print $fh $license->notice;
    print $fh "*/\n";
    print $fh "\n";
    print $fh "#include <stdio.h>\n";
    print $fh "#include <stdlib.h>\n";
    print $fh "#include \"$project.h\"\n";
    print $fh "\n";
    print $fh "int main() {\n";
    print $fh "    printf(\"%s\\n\", global_foo);\n";
    print $fh "    return 0;\n";
    print $fh "}\n";
    print $fh "\n";

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

