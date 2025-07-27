(defcfg
  linux-dev /dev/input/by-path/platform-i8042-serio-0-event-kbd
  process-unmapped-keys yes
)

(defsrc
  a s d f
  ; l k j
)

(deflayer
  default
  @a @s @d @f
  @; @l @k @j
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
)
