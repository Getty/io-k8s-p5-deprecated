package IO::K8s::Api::Auditregistration::V1alpha1::AuditSinkList;
# ABSTRACT: REMOVED -- superseded by the generic IO::K8s::List, see IO::K8s::Deprecated

use strict;
use warnings;

# Deliberately explicit $VERSION -- this dist's main module is versioned by
# dzil (RewriteVersion, restricted to :MainModule via version_finder in
# dist.ini), but tombstone sub-modules are NOT touched by it. This module
# needs its own hard-coded, higher $VERSION so PAUSE indexes THIS module as
# canonical for the name: PAUSE resolves each module name to whichever
# shipped distribution carries the highest $VERSION, and IO-K8s's last CPAN
# release to ship this module (as a warning stub) was 1.100. Do NOT "clean
# this up" to let dzil manage it -- doing so hands the PAUSE index entry
# back to the stale, superseded IO-K8s 1.100 release.
our $VERSION = '1.200';

die __PACKAGE__ . " has been removed. IO-K8s replaced all per-resource"
  . " *List classes with the single generic IO::K8s::List back in its 1.00"
  . " Moose-to-Moo rewrite; this class only ever emitted a deprecation"
  . " warning since then (it was never a real class in the 1.x series) and"
  . " has now been dropped outright. Use IO::K8s::List instead:\n"
  . "  perldoc IO::K8s::List\n"
  . "  cpanm IO::K8s\n"
  . "  https://metacpan.org/dist/IO-K8s\n";

1;

__END__

=head1 NAME

IO::K8s::Api::Auditregistration::V1alpha1::AuditSinkList - REMOVED, superseded by IO::K8s::List

=head1 DESCRIPTION

This module has been removed. IO-K8s replaced all per-resource C<*List>
classes (this one included) with a single generic L<IO::K8s::List> class
back in the C<1.00> Moose-to-Moo rewrite; C<IO::K8s::Api::Auditregistration::V1alpha1::AuditSinkList> itself was never a real
class in the C<1.x> series -- it only emitted a deprecation warning on load
pointing at C<IO::K8s::List>. IO-K8s C<1.100> was the last CPAN release to
ship even that warning stub; it has now been dropped from the distribution
entirely.

This module is a CPAN redirect stub, part of L<IO::K8s::Deprecated>. It
carries no implementation and B<dies unconditionally> as soon as it is
loaded (C<use>/C<require>), naming the replacement class. It exists only so
that C<cpanm IO::K8s::Api::Auditregistration::V1alpha1::AuditSinkList> -- or a cpanfile / code that still references the old
name -- surfaces a clear, actionable redirect instead of silently
installing the stale, superseded C<IO-K8s> C<1.100> release that still
carries this name.

Use L<IO::K8s::List> instead -- it derives C<api_version>/C<kind>
automatically from the items you give it, so one class now covers what used
to require a separate C<*List> class per resource type.

=head1 SEE ALSO

L<IO::K8s::List>, L<IO::K8s::Deprecated>

=cut
