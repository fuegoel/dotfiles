override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  Time12a="\$(date +%H:%M:%S)"

  GIT_PROMPT_LEADING_SPACE=1
  GIT_PROMPT_PREFIX="${Cyan}["                 # start of the git info string
  GIT_PROMPT_SUFFIX="${Cyan}]"                 # the end of the git info string
  GIT_PROMPT_SEPARATOR=""              # separates each item

  GIT_PROMPT_BRANCH="${Magenta}"        # the git branch that is active in the current directory
  GIT_PROMPT_STAGED="${Yellow}●"           # the number of staged files/directories
  GIT_PROMPT_CONFLICTS="${Red}✖ "       # the number of files in conflict
  GIT_PROMPT_CHANGED="${Blue}✚ "        # the number of changed files

  # GIT_PROMPT_REMOTE=" "                 # the remote branch name (if any) and the symbols for ahead and behind
  GIT_PROMPT_UNTRACKED="${Cyan}…"       # the number of untracked files/dirs
  GIT_PROMPT_STASHED="${Magenta}⚑ "    # the number of stashed files/dir
  GIT_PROMPT_CLEAN="${Green}✔"      # a colored flag indicating a "clean" repo

  GIT_PROMPT_COMMAND_OK="${Green}✔"    # indicator if the last command returned with an exit code of 0
  GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_"    # indicator if the last command returned with an exit code of other than 0

  GIT_PROMPT_VIRTUALENV="(${Blue}_VIRTUALENV_${ResetColor}) "

  GIT_PROMPT_UPSTREAM=" {${Blue}_UPSTREAM_${ResetColor}}"

  ## _LAST_COMMAND_INDICATOR_ will be replaced by the appropriate GIT_PROMPT_COMMAND_OK OR GIT_PROMPT_COMMAND_FAIL
  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${BoldBlueFg}${Time12a}${ResetColor} ${BoldYellow}${PathShort}"
  GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
  if [ -n "$SSH_CLIENT" ]; then
    GIT_PROMPT_END_USER="\n${BoldRed} ➤ ${ResetColor}"
    GIT_PROMPT_END_ROOT="\n${BoldRed} » ${ResetColor}"
  else
    GIT_PROMPT_END_USER="\n${BoldBlue} ➭ ${ResetColor}"
    GIT_PROMPT_END_ROOT="\n${BoldRed} # ${ResetColor}"
  fi
GIT_PROMPT_SYMBOLS_AHEAD="↑·"             # The symbol for "n versions ahead of origin"
  GIT_PROMPT_SYMBOLS_BEHIND="↓·"            # The symbol for "n versions behind of origin"
  GIT_PROMPT_SYMBOLS_PREHASH=":"            # Written before hash of commit, if no name could be found
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="L" # This symbol is written after the branch, if the branch is n
}

reload_git_prompt_colors "Custom"
