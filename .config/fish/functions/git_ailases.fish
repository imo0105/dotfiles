alias g='git'

# refered to https://qiita.com/ymm1x/items/a735e82244a877ac4d23
alias gpck='git branch -a --sort=-authordate | cut -b 3- | perl -pe '\''s#^remotes/origin/###'\'' | perl -nlE '\''say if !$c{$_}++'\'' | grep -v -- "->" | peco | xargs git checkout'

alias gtbpush='git push origin (git rev-parse --abbrev-ref HEAD|tr -d \\\\r\\\\n)'
