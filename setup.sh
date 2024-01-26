vimpath="$HOME/.vim"
colorpath="$HOME/.vim/colors"
vimrcpath="$HOME/.vimrc"



# ================COLORS PART===============
# Checking if .vim folder exists in home
if [ -d "$vimpath" ]
then
    echo ".vim directory already exists"
# Checking if colors folder exists in .vim folder
    if [ -d "$colorpath" ]
    then
        echo "'colors' directory exists in .vim folder"
        echo "Choose an option"
        echo "[A]Preserve your themes and add themes from rainglow vim to your colors folder"
        echo "[B]Delete your themes and add create a new one containing only rainglow vim themes"
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

# If option B is chosen
        elif[ "$colorsChoice" = "B" ]
        then
            rm -r colors
            cp -r colors $HOME/.vim/colors
        fi

# Control enters here if .vim exists but colors does not exist
    else
        echo "Creating 'colors' directory in .vim..."
        cp -r colors $HOME/.vim/colors
    fi

# Control enters here if .vim does not exist
else
    echo ".vim directory does not exist..."
    mkdir $HOME/.vim
    echo "Create .vim directory in home..."
    echo "Creating 'colors' directory in .vim..."
    cp -r colors $HOME/.vim/colors
fi



# ===============.VIMRC PART===============
if [-d "$vimrcpath"]
then
    echo ".vimrc file exists"
    echo "Choose an option"
    echo "[A]Delete current vimrc and use my vimrc"
    echo "[B]Do not use my vimrc and continue using your vimrc"
    echo "Enter your choice: [A/B]"
    read vimrcChoice

# Keep asking for choice if something other than A or B is entered
    while [[ "$vimrcChoice" != "A" ]] && [[ "$vimrcChoice" != "B" ]]
    do
        echo "Choose an option"
        read vimrcChoice
    done

#Control enters here if option A is chosen
    if [ "$vimrcChoice" = "A" ]
    then
        rm $HOME/.vimrc
        cp .vimrc $HOME/

#Control enters here if option B is chosen
    elif [ "$vimrcChoice" = "B" ]
    then
        echo "Current vimrc preserved..."
    fi

#Contorl enters here if .vimrc did not exist initially
else
   echo ".vimrc file does not exist"
   cp .vimrc $HOME/
fi
echo "Script executed succesfully..."
