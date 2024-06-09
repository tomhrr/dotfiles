: brightness-set
    /sys/class/backlight/intel_backlight/max_brightness f<;
    shift;
    chomp;
    100.0 /; *; int;
    "sudo sh -c 'echo {} > /sys/class/backlight/intel_backlight/brightness'" fmt; exec; drop;
    ,,

: brightness-set.min 30  brightness-set; ,,
: brightness-set.mid 60  brightness-set; ,,
: brightness-set.max 100 brightness-set; ,,
