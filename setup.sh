vimpath="$HOME/.vim"
colorpath="$HOME/.vim/colors"
vimrcpath="$HOME/.vimrc"

# ================VIM PART==================
echo "REMINDER: this script only works on Debian(like ubuntu) based systems"
echo ""
echo "Do you want to install vim?"
echo "[A]Already have it installed"
echo "[B]Yes please(Choose this if you dont' know whether vim is installed on your machine)"
echo "Enter your choice: [A/B]"
read vimChoice

# Keep asking for choice if something other than A or B is entered
while [[ "$vimChoice" != "A" ]] && [[ "$vimChoice" != "B" ]] 
do
    echo "Enter your choice: [A/B]"
    read vimChoice 
done

#If option A is chosen
if [ "$vimChoice" = "A" ]
then
    echo "Skipping vim installation..."

#If option B is chosen
elif [ "$vimChoice" = "B" ]
then
    echo "Installing vim for you..."
    sudo apt install -y vim
fi

# ================COLORS PART===============
echo ""
# Checking if .vim folder exists in home
if [ -d "$vimpath" ]
then
    echo "Directory .vim already exists"
# Checking if colors folder exists in .vim folder
    if [ -d "$colorpath" ]
    then
        echo "Directory 'colors' exists in .vim folder"
        echo "Choose an option"
        echo "[A]Preserve your themes and add themes from repo"
        echo "[B]Delete your themes and add themes from repo"
        echo "[C]Preserve your themes, don't need new themes from repo"
        echo "Enter your choice: [A/B/C]"
        read colorsChoice

# Keep asking for choice if something other than A or B is entered
        while [[ "$colorsChoice" != "A" ]] && [[ "$colorsChoice" != "B" ]] && [[ "$colorsChoice" != "C" ]]
        do
            echo "Enter your choice: [A/B/C]"
            read colorsChoice
        done
        echo ""
# If option A is chosen
        if [ "$colorsChoice" = "A" ]
        then
            echo "Your themes are preserved..."
            echo "Adding themes from repo..."
            cp -r colors/* $HOME/.vim/colors

# If option B is chosen
        elif [ "$colorsChoice" = "B" ]
        then
            echo "Deleting your 'colors' directory..."
            rm -r $HOME/.vim/colors
            echo "Adding 'colors' directory in .vim from repo..."
            cp -r colors $HOME/.vim

# If option C is chosen
        elif [ "$colorsChoice" = "C" ]
        then
            echo "No new themes added..."
            echo "Your themes are preserved..."
        fi

# Control enters here if .vim exists but colors does not exist
    else
        echo "Creating 'colors' directory in .vim..."
        cp -r colors $HOME/.vim/colors
    fi

# Control enters here if .vim does not exist
else
    echo "Directory .vim does not exist..."
    mkdir $HOME/.vim
    echo "Creating .vim directory in home..."
    echo "Adding 'colors' directory in .vim from repo..."
    cp -r colors $HOME/.vim/colors
fi



# ===============.VIMRC PART===============
echo ""
if [ -f "$vimrcpath" ]
then
    echo "File .vimrc exists"
    echo "Choose an option"
    echo "[A]Delete current vimrc and use vimrc from repo"
    echo "[B]Do not use vimrc from repo and continue using your current vimrc"
    echo "Enter your choice: [A/B]"
    read vimrcChoice

# Keep asking for choice if something other than A or B is entered
    while [[ "$vimrcChoice" != "A" ]] && [[ "$vimrcChoice" != "B" ]]
    do
        echo "Enter your Choice: [A/B]"
        read vimrcChoice
    done

#Control enters here if option A is chosen
    if [ "$vimrcChoice" = "A" ]
    then
        echo "Deleting your vimrc..."
        rm $HOME/.vimrc
        echo "Repo's vimrc has been setup..."
        cp .vimrc $HOME/

#Control enters here if option B is chosen
    elif [ "$vimrcChoice" = "B" ]
    then
        echo "Current vimrc preserved..."
        echo "Repo's vimrc has not been setup..."
    fi

#Control enters here if .vimrc did not exist initially
else
   echo "File .vimrc does not exist..."
   cp .vimrc $HOME/
   echo "Repo's vimrc has been setup..."
fi
echo ""
echo "******************************"
echo "Script executed succesfully..."
echo "******************************"
