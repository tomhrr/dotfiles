h(laptop   (dotfiles/profiles/work/Xmodmap2)
  apple    (dotfiles/profiles/home/Xmodmap
            .XmodmapE)
  keychron (.XmodmapK)
  none     ())
kb-files var; kb-files !;

: kb-set
    kb-files @; swap; get; dup; is-null; if;
        drop;
        "keyboard not found" error;
    then;
    "setxkbmap -layout us" exec; drop;
    "xset r rate 250 50" exec; drop;
    [HOME getenv; "xmodmap {}/{}" fmt; exec; drop] for;
    HOME getenv; "xmodmap {}/dotfiles/Xmodmap-common" fmt; exec; drop;
    ,,

: kb-set.apple    apple    kb-set; ,,
: kb-set.laptop   laptop   kb-set; ,,
: kb-set.keychron keychron kb-set; ,,
: kb-set.none     none     kb-set; ,,
