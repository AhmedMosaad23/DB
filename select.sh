#!/bin/bash
shopt -s extglob
select choice in selectall  selectbycolumn selectrow
do
    #echo $choice
    case $choice in 
        "selectall" ) 
            read -p "Enter Name of table " name
            if [ -f $name ];then
                cat ~/$name
            else 
                echo "table not exist"
            fi
        ;;
        "selectbycolumn" ) 
            read -p "Enter Name of table " name
            if [ -f $name ];then
                read -p "Enter the number of column " num
                cut $name -d ':' -f $num 
            else 
                echo "field not exist"
            fi

        ;;
        "selectrow" ) 
            read -p "Enter name of table " name
            if [ -f $name ];then
                read -p "Enter the value of field you want to see :" value
                sed -n "/${value}/p" $name 
            fi
        
        ;;
        *)
            break
            
    esac
done