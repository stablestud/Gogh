#!/usr/bin/env bash

export PROFILE_NAME="Sat"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DD0007"           # Red (Syntax string)
export COLOR_03="#07DD00"           # Green (Command)
export COLOR_04="#DDD600"           # Yellow (Command second)
export COLOR_05="#0007DD"           # Blue (Path)
export COLOR_06="#D600DD"           # Magenta (Syntax var)
export COLOR_07="#00DDD6"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#7D7D7D"           # Bright Black
export COLOR_10="#FF7478"           # Bright Red (Command error)
export COLOR_11="#78FF74"           # Bright Green (Exec)
export COLOR_12="#FFFA74"           # Bright Yellow
export COLOR_13="#7478FF"           # Bright Blue (Folder)
export COLOR_14="#FA74FF"           # Bright Magenta
export COLOR_15="#74FFFA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#758480"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+yes}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
