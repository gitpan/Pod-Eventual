use strict;
use warnings;
package Pod::Eventual::Simple;
our $VERSION = '0.003';

use Pod::Eventual;
BEGIN { our @ISA = 'Pod::Eventual' }
# ABSTRACT: just get an array of the stuff Pod::Eventual finds


sub new {
  my ($class) = @_;
  bless [] => $class;
}

sub read_handle {
  my ($self, $handle, $arg) = @_;
  return $self->new->read_handle($handle, $arg) unless ref $self;
  $self->SUPER::read_handle($handle, $arg);
  return [ @$self ];
}

sub handle_event {
  my ($self, $event) = @_;
  push @$self, $event;
}

sub handle_nonpod {
  my ($self, $line) = @_;
  push @$self, $line;
}

1;  

__END__

=pod

=head1 NAME

Pod::Eventual::Simple - just get an array of the stuff Pod::Eventual finds

=head1 VERSION

version 0.003

=head1 SYNOPSIS

    use Pod::Eventual::Simple;

    my $output = Pod::Eventual::Simple->read_file('awesome.pod');

This subclass just returns an array reference when you use the reading methods.
The arrayref contains all the POD events and non-POD content.  If you just want
the POD events, grep for references.

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


