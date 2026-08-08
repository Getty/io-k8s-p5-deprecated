# IO-K8s-Deprecated

Permanent home for CPAN redirect ("tombstone") stub modules covering
[IO::K8s](https://metacpan.org/pod/IO::K8s) modules that were renamed or
retired.

PAUSE has no delete, and it indexes per **module name**, not per
distribution: once a module name is indexed against a release, it stays
there forever unless a *higher*-versioned release of that module name takes
it over. When an IO::K8s module is renamed or deleted within the
distribution's own later releases, the old name would otherwise keep
resolving to stale, superseded code with no hint a replacement exists. This
distribution ships a tiny stub package under each OLD name with a hand-set
`$VERSION` higher than the last release that shipped that name, taking over
the PAUSE index entry. The stub does nothing but `die` immediately on load
with a message naming the replacement.

## Current tombstones

### Consolidated into the generic `IO::K8s::List` (76 classes)

IO-K8s replaced every per-resource `*List` class (`PodList`, `ServiceList`,
etc.) with a single generic [`IO::K8s::List`](https://metacpan.org/pod/IO::K8s::List)
back in its `1.00` Moose-to-Moo rewrite. Each one only ever emitted a
deprecation warning after that -- none were real classes in the `1.x`
series. `IO-K8s` `1.100` was the last CPAN release to ship even that
warning stub; all 76 were then dropped from the distribution outright. Full
list of the 76 old names: see `lib/IO/K8s/Deprecated.pm`'s POD, or
`t/01-tombstones.t`. Every one of them redirects to `IO::K8s::List`.

### Removed -- classic DRA control-plane-controller allocation (4 classes)

`resource.k8s.io/v1alpha3` shipped an alpha-only (never GA) "classic DRA"
allocation flow. When Dynamic Resource Allocation graduated to GA with a
structured-parameters model at `resource.k8s.io/v1`, that mechanism --
including these four classes -- was dropped, with no 1:1 successor. Last
shipped in `IO-K8s` `1.100`:

| Old module | Redirects to |
|---|---|
| `IO::K8s::Api::Resource::V1alpha3::PodSchedulingContext` | *(removed, no replacement -- see IO::K8s::Api::Resource::V1)* |
| `IO::K8s::Api::Resource::V1alpha3::PodSchedulingContextSpec` | *(removed, no replacement)* |
| `IO::K8s::Api::Resource::V1alpha3::PodSchedulingContextStatus` | *(removed, no replacement)* |
| `IO::K8s::Api::Resource::V1alpha3::ResourceClaimSchedulingStatus` | *(removed, no replacement)* |

### Considered but not tombstoned

The Cilium v1.19.2 upgrade in `IO-K8s` `1.100` initially dropped 8
`cilium.io/v2alpha1` classes. They were restored in `IO-K8s` instead, for
backward compatibility (matching `io-k8s-p5`'s own convention of keeping
multiple API versions of a resource side by side, e.g. Apps
V1beta1/V1beta2/V1). No tombstone needed -- see `lib/IO/K8s/Deprecated.pm`'s
POD for the full note.

A later v1.31 -> v1.36 upstream sync flagged the same pattern for older
served-but-superseded core API tracks (`ValidatingAdmissionPolicy`
v1alpha1/v1beta1, `SelfSubjectReview` v1alpha1/v1beta1,
`flowcontrol.apiserver.k8s.io/v1beta3`) -- kept in `IO-K8s`, not
tombstoned, for the same reason.

## Adding a new tombstone

See the `io-k8s-deprecated` skill
(`.claude/skills/io-k8s-deprecated/SKILL.md`) for the step-by-step procedure
the next time an IO::K8s module is renamed or removed -- including how to
audit the distribution's git history for orphaned module names, and how to
tell a genuine orphan apart from a class that's merely soft-deprecated in
place or was restored for backward compatibility.

## License

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
