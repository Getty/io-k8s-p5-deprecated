package IO::K8s::Api::Policy::V1beta1::RunAsUserStrategyOptions;
# ABSTRACT: REMOVED -- dropped by Kubernetes, see IO::K8s::Deprecated

use strict;
use warnings;

our $VERSION = '1.113';

die __PACKAGE__ . " has been removed. It was part of PodSecurityPolicy"
  . " (policy/v1beta1), which Kubernetes removed in v1.25. Pod Security"
  . " Admission took its place and is set through namespace labels, so"
  . " there is no successor class. IO-K8s shipped it only in 0.01 to"
  . " 0.03 (2018). Install a current IO::K8s instead:\n"
  . "  cpanm IO::K8s\n"
  . "  https://metacpan.org/dist/IO-K8s\n";

1;

__END__

=head1 NAME

IO::K8s::Api::Policy::V1beta1::RunAsUserStrategyOptions - REMOVED, no direct replacement

=head1 DESCRIPTION

This module has been removed, not renamed -- there is no 1:1 replacement.
It was part of PodSecurityPolicy (policy/v1beta1), which Kubernetes
removed in v1.25. Pod Security Admission took its place and is set through
namespace labels, so there is no successor class. IO-K8s shipped it only
in its first releases C<0.01> to C<0.03> (2018); no C<1.x> release has it.

This module is a CPAN redirect stub, part of L<IO::K8s::Deprecated>. It
carries no implementation and B<dies unconditionally> as soon as it is
loaded (C<use>/C<require>). It exists so that C<cpanm
IO::K8s::Api::Policy::V1beta1::RunAsUserStrategyOptions> -- or a cpanfile
/ code that still references the old name -- surfaces a clear message
instead of installing C<IO-K8s> C<0.03>, the last CPAN release that
carries this name. That release would also replace the classes of a
current IO-K8s, C<IO::K8s> itself included, with their 2018 versions.

=head1 SEE ALSO

L<IO::K8s>, L<IO::K8s::Deprecated>

=cut
