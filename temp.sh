scriptpath="$PWD"
echo "$scriptpath"
cd ~
mkdir example
echo "Enter a value for a variable"
read x
if [ "$x" = "y" ];
then
    cd "$scriptpath"
    cp colors -r ~/example/colors
else
    echo "wrong code"
fi
