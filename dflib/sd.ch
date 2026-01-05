: sd.pactl {pactl -fjson list}; from-json; ,,

: sd.restart {systemctl --user restart pulseaudio}; r; drop; ,,

: sd.sources-raw sd.pactl; sources get; ,,

: sd.sinks-raw sd.pactl; sinks get; ,,

: sd.sources
    sd.sources-raw;
    [dup;
     (index description mute state) get;
     swap;
     volume get; values; [value_percent get; % "" s] map; avg; push] map;
    ,,

: sd.sinks
    sd.sinks-raw;
    [dup;
     (index description mute state) get;
     swap;
     volume get; values; [value_percent get; % "" s] map; avg; push] map;
    ,,

: sd.headphones
    sd.sinks-raw;
    [description get; headphones/i m] first;
    ,,

: sd.microphone
    sd.sources-raw;
    [description get; digital.microphone/i m] first;
    ,,

: sd.mute
    sd.sources-raw;
    [index get] map; [{pamixer --source {} -m}; r; drop] for;
    sd.sinks-raw;
    [index get] map; [{pamixer --sink   {} -m}; r; drop] for;
    ,,

: sd.headphones.unmute
    sd.headphones;
    index get;
    {pamixer --sink {} -u}; r; drop;
    ,,

: sd.microphone.unmute
    sd.microphone;
    index get;
    {pamixer --source {} -u}; r; drop;
    ,,

: sd.headphones.volume
    sd.headphones;
    index get;
    {pamixer --sink {} --set-volume {}}; r; drop;
    ,,

: sd.microphone.volume
    sd.microphone;
    index get;
    {pamixer --source {} --set-volume {}}; r; drop;
    ,,

: sd.zoom
    sd.restart;
    sd.mute;
    100 sd.headphones.volume;
    100 sd.microphone.volume;
    sd.headphones.unmute;
    sd.microphone.unmute;
    ,,
