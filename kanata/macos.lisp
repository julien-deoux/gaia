(defcfg
  macos-dev-names-include "Apple Internal Keyboard / Trackpad"
  process-unmapped-keys yes
)

(defsrc
  f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
  a s d f     ; l k j
  fn
)

(deflayer default
  brdn  brup  mctl  sls   dtn   dnd   prev  pp  next  mute  vold  volu
  @a @s @d @f      @; @l @k @j
  @fnl
)

(deflayer fn
  f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
  _ _ _ _     _ _ _ _
  _
)

(defalias
  a (tap-hold-release 200 200 a lmet)
  s (tap-hold-release 200 200 s lalt)
  d (tap-hold-release 200 200 d lctl)
  f (tap-hold-release 200 200 f lsft)
  ; (tap-hold-release 200 200 ; rmet)
  l (tap-hold-release 200 200 l ralt)
  k (tap-hold-release 200 200 k rctl)
  j (tap-hold-release 200 200 j rsft)
  fnl (tap-hold-release 200 200 fn (layer-toggle fn))
)
