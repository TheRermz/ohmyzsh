# ~/.oh-my-zsh/themes/aussiegeek-bateria.zsh-theme

# Função para hora no formato 24h
function prompt_time_24h() {
  date +%H:%M
}

# Função para mostrar nível da bateria
function prompt_battery_level() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    pmset -g batt | grep -Eo "\d+%" | cut -d% -f1
  elif [[ -f /sys/class/power_supply/BAT0/capacity ]]; then
    cat /sys/class/power_supply/BAT0/capacity
  else
    echo "?"
  fi
}

# Prompt principal
PROMPT='%{${fg_bold[blue]}%}[ %{${fg[red]}%}$(prompt_time_24h) ⏰ %{${fg_bold[blue]}%}] %{${fg_bold[blue]}%} [ %{${fg[red]}%}%n@%m:%~$(git_prompt_info)%{${fg[yellow]}%}$(ruby_prompt_info)%{${fg_bold[blue]}%} ]%{$reset_color%}
 $ '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg_bold[green]}%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
