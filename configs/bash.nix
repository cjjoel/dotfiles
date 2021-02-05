{ pkgs, ... }:

{
  enable = true;
  initExtra = ''
    git_prompt() {
      local status="$(${pkgs.git}/bin/git status 2> /dev/null)"
      local branch="$(${pkgs.git}/bin/git symbolic-ref --short HEAD 2>/dev/null)"
      prompt="\e[1;32m\u@\h \W\e[0m "
      if [ "''${branch}" != "" ]; then
        if echo ''${status} | ${pkgs.gnugrep}/bin/grep -E -c "Changes not staged for commit|Untracked files" &> /dev/null; then
          prompt+="\e[1;31m(''${branch})\e[0m "
        elif echo ''${status} | ${pkgs.gnugrep}/bin/grep -c "Changes to be committed" &> /dev/null; then
          prompt+="\e[1;33m(''${branch})\e[0m "
        else
          prompt+="\e[1;32m(''${branch})\e[0m ";    
        fi
      fi
      prompt+="\e[1;32m\$ \e[0m"
      echo $prompt
    }
    export PS1=$(git_prompt)
    PROMPT_COMMAND='export PS1=$(git_prompt)'
  '';
}
