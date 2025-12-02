set -l plugin_name lens0021_personal

fish_indent -w **/*.fish

cat src/conf.d/*.fish >conf.d/$plugin_name.fish
cat src/functions/*.fish >functions/$plugin_name.fish
cat src/completions/*.fish >completions/$plugin_name.fish
