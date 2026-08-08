package IO::K8s::Api::Resource::V1alpha3::PodSchedulingContext;
# ABSTRACT: REMOVED -- classic DRA control-plane-controller allocation retired, see IO::K8s::Deprecated

use strict;
use warnings;

our $VERSION = '1.106';

die __PACKAGE__ . " has been removed. It was part of Kubernetes' \"classic\""
  . " Dynamic Resource Allocation (DRA) control-plane-controller allocation"
  . " flow (resource.k8s.io/v1alpha3, alpha-only, never GA), used to"
  . " coordinate WaitForFirstConsumer scheduling between the scheduler and"
  . " an external controller. That whole mechanism was retired when DRA"
  . " graduated to GA with a structured-parameters model at"
  . " resource.k8s.io/v1 -- there is no 1:1 successor class, the"
  . " allocation flow itself changed. See IO::K8s::Api::Resource::V1::ResourceClaim"
  . " and IO::K8s::Api::Resource::V1::DeviceClass for the current DRA API."
  . " Install a current IO::K8s instead:\n"
  . "  cpanm IO::K8s\n"
  . "  https://metacpan.org/dist/IO-K8s\n";

1;

__END__

=head1 NAME

IO::K8s::Api::Resource::V1alpha3::PodSchedulingContext - REMOVED, no direct replacement

=head1 DESCRIPTION

This module has been removed, not renamed -- there is no 1:1 replacement.
It represented Kubernetes' "classic DRA" control-plane-controller
allocation flow (C<resource.k8s.io/v1alpha3>, alpha-only, never GA), which
coordinated C<WaitForFirstConsumer> resource-claim allocation between the
scheduler and an external controller via this resource. Dynamic Resource
Allocation graduated to GA with an architecturally different
structured-parameters model at C<resource.k8s.io/v1>, and the
control-plane-controller flow -- including this class -- was dropped
entirely. Last shipped in C<IO-K8s> C<1.100>.

This module is a CPAN redirect stub, part of L<IO::K8s::Deprecated>. It
carries no implementation and B<dies unconditionally> as soon as it is
loaded. It exists only so that C<cpanm
IO::K8s::Api::Resource::V1alpha3::PodSchedulingContext> -- or a cpanfile /
code that still references the old name -- surfaces a clear explanation
instead of silently installing the stale, superseded C<IO-K8s> C<1.100>
release that still carries this name.

For the current Dynamic Resource Allocation API, see
L<IO::K8s::Api::Resource::V1::ResourceClaim> and
L<IO::K8s::Api::Resource::V1::DeviceClass>.

=head1 SEE ALSO

L<IO::K8s::Api::Resource::V1::ResourceClaim>,
L<IO::K8s::Api::Resource::V1::DeviceClass>, L<IO::K8s::Deprecated>

=cut
