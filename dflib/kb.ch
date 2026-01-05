h(laptop      (dotfiles/profiles/work/Xmodmap2)
  apple       (dotfiles/profiles/home/Xmodmap
               .XmodmapE)
  keychrontkl (.XmodmapKTKL)
  keychron    (.XmodmapK60)
  none        ())
kb-files var; kb-files !;

: exec2
    dup;
    dup; println;
    exec; 0 =; not; if;
        "failed to run program ('{}')" fmt; error;
    else;
        drop;
    then;
    ,,

: kb-set
    kb-files @; swap; get; dup; is-null; if;
        drop;
        "keyboard not found" error;
    then;
    "setxkbmap -layout us" exec2;
    "xset r rate 200 50" exec2;
    HOME getenv; "xmodmap {}/dotfiles/Xmodmap-common" fmt; exec2;
    clone; [HOME getenv; "xmodmap {}/{}" fmt; exec2] for;
    ,,

: kb-set.apple    apple    kb-set; ,,
: kb-set.laptop   laptop   kb-set; ,,
: kb-set.keychron keychron kb-set; ,,
: kb-set.none     none     kb-set; ,,
