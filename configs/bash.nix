{ ... }:

{
  enable = true;
  initExtra = ''
    git_prompt() {    
      local status="$(git status 2> /dev/null)"
      local branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
      prompt="\n\[\e[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]"
      if [ "''${branch}" != "" ]; then
        if echo ''${status} | grep -E -c "Changes not staged for commit|Untracked files" &> /dev/null; then
          prompt+="\e[1;31m (''${branch}) \e[m"
        elif echo ''${status} | grep -c "Changes to be committed" &> /dev/null; then
          prompt+="\e[1;33m (''${branch}) \e[m"
        else
          prompt+=" (''${branch}) ";    
        fi
      fi
      prompt+="\$ \[\e[0m\]"
      echo $prompt
    }
    export PS1=$(git_prompt)
    PROMPT_COMMAND='export PS1=$(git_prompt)'
  '';
}
