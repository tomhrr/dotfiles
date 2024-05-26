: get-display-data
    {xrandr -q}; xr var; xr !;
    h() xrv var; xrv !;
    begin;
        xr @;
        [connected m] first;
        dup; is-null; if;
            drop;
            leave;
        then;
        dup;
        "^(\S+) " c; 1 get;
        swap; disconnected m; if;
            xrv @; swap;
            (0 0) set;
        else;
            xrv @; swap;
            xr @;
            [connected m] before;
            [\+ m] first;
            \s+ splitr; [] grep; shift;
            x split; r; set;
        then;
        drop;
        0 until;
    xrv @;
    ,,

: xrandr
    vars var; vars !;
    get-display-data; dd var; dd !;

    eDP-1 lkey var; lkey !;

    dd @; keys; sort; [eDP-1 =; not] grep;
    [dd @; swap; get; 0 get; 0 =; not] first;
    mkey var; mkey !;

    dd @; keys; sort;
    [dd @; swap; get; 0 get; 0 =] grep;
    ["xrandr --output {} --off" fmt; dup; println; exec; drop] for;

    vars @; laptop get; if;
        dd @; lkey @; get; clone; shift-all; swap;
        lkey @;
        "xrandr --output {} --primary --mode {}x{} --rotate normal" fmt;
        dup; println;
        exec; drop;
    else;
        lkey @;
        "xrandr --output {} --off" fmt;
        dup; println;
        exec; drop;
    then;

    vars @; external get; if;
        dd @; mkey @; get; clone; shift-all; swap;
        vars @; laptop get; is-null; not; if;
            dd @; lkey @; get; 0 get;
            mkey @;
            "xrandr --output {} --pos {}x0 --mode {}x{} --rotate normal" fmt;
            dup; println;
            exec; drop;
        else;
            mkey @;
            "xrandr --output {} --primary --mode {}x{} --rotate normal" fmt;
            dup; println;
            exec; drop;
        then;
    else;
        mkey @;
        "xrandr --output {} --off" fmt;
        dup; println;
        exec; drop;
    then;
    ,,

: xrandr.external h(external .t) xrandr; ,,
: xrandr.laptop   h(laptop   .t) xrandr; ,,
: xrandr.both     h(laptop   .t
                    external .t) xrandr; ,,
