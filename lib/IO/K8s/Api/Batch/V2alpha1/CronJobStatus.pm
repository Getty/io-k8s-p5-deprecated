package IO::K8s::Api::Batch::V2alpha1::CronJobStatus;
# ABSTRACT: REMOVED -- retired Kubernetes API version, see IO::K8s::Deprecated

use strict;
use warnings;

our $VERSION = '1.112';

die __PACKAGE__ . " has been removed. It was part of the batch/v2alpha1 API, which"
  . " Kubernetes has retired; IO-K8s shipped it only in 0.01 to 0.03"
  . " (2018), and no IO-K8s 1.x release has it. Use"
  . " IO::K8s::Api::Batch::V1::CronJobStatus instead:\n"
  . "  perldoc IO::K8s::Api::Batch::V1::CronJobStatus\n"
  . "  cpanm IO::K8s\n"
  . "  https://metacpan.org/dist/IO-K8s\n";

1;

__END__

=head1 NAME

IO::K8s::Api::Batch::V2alpha1::CronJobStatus - REMOVED, superseded by IO::K8s::Api::Batch::V1::CronJobStatus

=head1 DESCRIPTION

This module has been removed. It was part of the batch/v2alpha1 API, which
Kubernetes has retired; IO-K8s shipped it only in 0.01 to 0.03 (2018), and
no IO-K8s 1.x release has it. Its successor is
L<IO::K8s::Api::Batch::V1::CronJobStatus>.

This module is a CPAN redirect stub, part of L<IO::K8s::Deprecated>. It
carries no implementation and B<dies unconditionally> as soon as it is
loaded (C<use>/C<require>). It exists so that C<cpanm
IO::K8s::Api::Batch::V2alpha1::CronJobStatus> -- or a cpanfile / code that
still references the old name -- surfaces a clear message instead of
installing C<IO-K8s> C<0.03>, the last CPAN release that carries this
name. That release would also replace the classes of a current IO-K8s,
C<IO::K8s> itself included, with their 2018 versions.

=head1 SEE ALSO

L<IO::K8s::Api::Batch::V1::CronJobStatus>, L<IO::K8s::Deprecated>

=cut
