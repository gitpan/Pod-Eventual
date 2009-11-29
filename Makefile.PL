
use strict;
use warnings;



use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Pod-Eventual',
  NAME      => 'Pod::Eventual',
  AUTHOR    => "Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "read\ a\ POD\ document\ as\ a\ series\ of\ trivial\ events",
  VERSION   => '0.093330',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::Deep" => '0',
    "Mixin::Linewise::Readers" => '0.001',
  },
  test => {TESTS => 't/*.t'}
);

