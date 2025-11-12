# ~/.config/fish/config.fish
# =============================
# Fish configuration for Hyprland setup
# =============================

# --- Disable default greeting ---
set -U fish_greeting

# --- Run fastfetch on shell startup ---
if status is-interactive
    fastfetch
end

# --- Fish Plugins ---
# Autosuggestions
if test -f ~/.local/share/fish/plugins/fish-autosuggestions/conf.d/fish-autosuggestions.fish
    source ~/.local/share/fish/plugins/fish-autosuggestions/conf.d/fish-autosuggestions.fish
end

# Syntax Highlighting
if test -f ~/.local/share/fish/plugins/fish-syntax-highlighting/share/functions/fish_highlight.fish
    source ~/.local/share/fish/plugins/fish-syntax-highlighting/share/functions/fish_highlight.fish
end


# --- Custom Bash-like prompt (fixed hostname issue) ---
function fish_prompt
    set_color green
    echo -n "["
    set_color yellow
    echo -n (whoami)
    set_color normal
    echo -n "@"
    set_color cyan
    # Use built-in variable as fallback if hostname command is unavailable
    if type -q hostname
        echo -n (hostname | cut -d . -f 1)
    else
        echo -n $hostname
    end
    set_color normal
    echo -n " "
    set_color magenta
    echo -n (prompt_pwd)
    set_color normal
    echo "]\$ "
end

