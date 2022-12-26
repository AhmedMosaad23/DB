#!/bin/bash
shopt -s extglob
read -p "Enter Table Name : " name
if [ -f $name ];then
    read -p "Enter Column name :" cname
    cnum=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$cname'") print i}}}' $name)
    if [[ $cname == "" ]];then
        echo "column not exist"
    else
        read -p " Enter value you want to modify : " old
        if [[ $old == "" ]];then
            echo "value not exist"
        else
            NR=$(awk 'BEGIN{FS=":"}{if ($'$cnum' == "'$old'") print NR}' $name)
            read -p "Enter the new value you want to update : " new
            sed -i "s/$old/$new/" $name
            echo "table updated successfully"
        fi
    fi
fi

