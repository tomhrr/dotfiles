: font-set
    dup; 32 <=; if;
        dup;
        "XTerm*font: -*-terminus-medium-r-*-*-{}-*-*-*-*-*-iso10646-*\nURxvt*font: xft:Terminus:pixelsize={};xft:Droid Sans\n" fmt;
        1 mlist;
        /home/tomh/.Xresources2 f>;
        "xrdb -merge ~/.Xresources" exec; drop;
    else;
        dup;
        "XTerm*font: -*-courier-medium-r-*-*-{}-*-*-*-*-*-iso10646-*\nURxvt*font: xft:Courier:pixelsize={};xft:Droid Sans\n" fmt;
        1 mlist;
        /home/tomh/.Xresources2 f>;
        "xrdb -merge ~/.Xresources" exec; drop;
    then;
    ,,

: font-set.home   20 font-set; ,,
: font-set.normal 24 font-set; ,,
: font-set.large  32 font-set; ,,
: font-set.huge   48 font-set; ,,
