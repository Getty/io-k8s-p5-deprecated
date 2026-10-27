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

### Consolidated into the generic `IO::K8s::List` (74 classes)

IO-K8s replaced every per-resource `*List` class (`PodList`, `ServiceList`,
etc.) with a single generic [`IO::K8s::List`](https://metacpan.org/pod/IO::K8s::List)
back in its `1.00` Moose-to-Moo rewrite. Each one only ever emitted a
deprecation warning after that -- none were real classes in the `1.x`
series. `IO-K8s` `1.100` was the last CPAN release to ship even that
warning stub; all 76 such stubs were then dropped from the distribution
outright. 74 of them stayed gone and are tombstoned here (for the other two
see "No longer tombstoned" below). Full list of the 74 old names: see
`lib/IO/K8s/Deprecated.pm`'s POD, or `t/01-tombstones.t`. Every one of them
redirects to `IO::K8s::List`.

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

### Retired API versions from IO-K8s 0.03, with a successor (180 classes)

`IO-K8s` `0.01` to `0.03` (May 2018) shipped classes for the alpha and beta
API versions of that time. Kubernetes has retired those API versions since,
and no `IO-K8s` `1.x` release ships these classes, so the PAUSE index kept
resolving their names to `IO-K8s` `0.03` -- a release that would also
replace the classes of a current IO-K8s, `IO::K8s` itself included, with
their 2018 versions. Each tombstone names its successor: mostly the same
class at the GA version, or the group it moved to (`extensions/v1beta1`
workloads to `apps/v1`, Ingress and NetworkPolicy to
`networking.k8s.io/v1`, Scale to `autoscaling/v1`), plus `Handler` ->
`LifecycleHandler` and the v1beta1 `Webhook` -> `MutatingWebhook` /
`ValidatingWebhook`. Full list with successors: `lib/IO/K8s/Deprecated.pm`'s
POD, or `t/01-tombstones.t`'s `%retired_api_successor`.

### Dropped by Kubernetes, from IO-K8s 0.03 (32 classes)

Also only in `IO-K8s` `0.01` to `0.03`, with no successor class:
PodSecurityPolicy (20 classes, `extensions` and `policy` v1beta1), the
alpha Initializers (5), the Deployment rollback types (4), the alpha
PodPreset (2) and RawExtension (1, an `Opaque` field in IO-K8s `1.x`).
Each tombstone says why. List: `lib/IO/K8s/Deprecated.pm`'s POD, or
`t/01-tombstones.t`'s `%retired_api_removed`.

### No longer tombstoned

Release `1.105` of this distribution also shipped tombstones for
`IO::K8s::Apimachinery::Pkg::Apis::Meta::V1::APIGroupList` and
`IO::K8s::Apimachinery::Pkg::Apis::Meta::V1::APIResourceList`, swept up with
the `*List` classes above. They are not lists of resources but the `meta.v1`
discovery Kinds, and `IO-K8s` `1.106` ships both again as real classes. Both
distributions install the same file, so installing this one after `IO-K8s`
replaced the working classes with stubs that die on load -- the two
tombstones were removed.

If you installed `IO-K8s-Deprecated` `1.105` on top of `IO-K8s` `1.106` or
later, upgrading this distribution does not bring the two classes back;
reinstall `IO-K8s` (`cpanm --reinstall IO::K8s`).

The rule behind it -- no package shipped here may be shipped by the current
`IO-K8s` -- is held by `t/02-name-guard.t`. It compares against an
`io-k8s-p5` checkout next to this one, or an installed `IO::K8s` at least as
new as this distribution (what it ships is what its `.packlist` lists), or
the lib directory named in `IO_K8S_LIB`, and skips when none of them is
there.

### Considered but not tombstoned

The Cilium v1.19.2 upgrade in `IO-K8s` `1.100` initially dropped 8
`cilium.io/v2alpha1` classes. They were restored in `IO-K8s` instead, for
backward compatibility (matching `io-k8s-p5`'s own convention of keeping
multiple API versions of a resource side by side, e.g. Autoscaling V1/V2).
No tombstone needed -- see `lib/IO/K8s/Deprecated.pm`'s
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
place, was restored for backward compatibility, or is shipped by `IO-K8s`
again.

## License

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
