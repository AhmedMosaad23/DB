#!/bin/bash
shopt -s extglob
select choice in delete_all  deletebyrow
do
    #echo $choice
    case $choice in 
        "delete_all" ) 
            read -p "Enter Name of table " name
            if [ -f $name ];then
                sed -i 'd' $name 
                wc -c $name
            else 
                echo "table not exist"
            fi
        ;;
        "deletebyrow" ) 
            read -p "Enter Name of table " name
            if [ -f $name ];then
                read -p "Enter the value you want to delete :" value
                sed -i "/$value/d" $name

            else 
                echo "field not exist"
            fi

        ;;
       
        *)
            break
            
    esac
done

