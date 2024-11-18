# impeller-shadow-bug

Replication of the bug described in https://github.com/flame-engine/flame/issues/3370

`flutter run --enable-impeller` on MacOS to replicate.

`flutter run --no-enable-impeller` on iOS to show that Skia works. Impeller is enabled by default on iOS.

Android and Web have been confirmed to not have this issue. Have not tested Windows.