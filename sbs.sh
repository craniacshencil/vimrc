vimpath="$HOME/.vim"
colorpath="$HOME/.vim/colors"
vimrcpath="$HOME/.vimrc"



# ================COLORS PART===============
# Checking if .vim folder exists in home
if [ -d "$vimpath" ]
then
    echo "Directory .vim already exists"
# Checking if colors folder exists in .vim folder
    if [ -d "$colorpath" ]
    then
        echo "Directory 'colors' exists in .vim folder"
        echo "====="
        echo "Choose an option"
        echo "[A]Preserve your themes and add themes from rainglow vim to your colors folder"
        echo "[B]Delete your themes and add create a new one containing only rainglow vim themes"
        echo "====="
        echo "Enter your choice: [A/B]"
        read colorsChoice

# Keep asking for choice if something other than A or B is entered
        while [[ "$colorsChoice" != "A" ]] && [[ "$colorsChoice" != "B" ]]
        do
            echo "Choose an option"
            read colorsChoice
        done

# If option A is chosen
        if [ "$colorsChoice" = "A" ]
        then
            cp -r colors/* $HOME/.vim/colors

        fi
        fi
        fi
