echo "change $1 to $2 ..."
for file in $(ls .)  
    do
    name=$(ls $file)
    mv $file.$1 ${name}.$2
    done

echo "change suffix sucess."

