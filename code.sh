#!/usr/bin/bash 
export LC_COLLATE=C 
shopt -s extglob
#--------First Menu------<create db>---<list>-----<drop>------<connect>
 select choice in Create_db List_db Drop_db Connect_db
    do 
        case $choice in
            "Create_db" )
                read -p "Enter Name for New Data Base: " new
                if [ -e $new ];then
                    echo "Enter Diffrent Name"
                else
                    if [[ $new = ^[a-zA-Z_][a-zA-Z0-9_]*$ ]];then 
                        mkdir /Downloads/DBs/$new
                    else
                        echo "Enter vaild Name"
                    fi
                fi            
            ;;
            "List_db" )
                read -p "Enter Name Data Base to list it: " list
                if [[ $list = ^[a-zA-Z_][a-zA-Z0-9_]*$ ]];then
                    ls -F $list | grep "/"
                else
                    echo "Enter Valid Name "
                fi    
            ;;
            "Drop_db")
                read -p "Enter Name for data base want to remove : " drop
                    if [ -d $drop ];then
                        rm -r $drop
                    else
                        echo "Not Found Name For Data Base"
                    fi 
            ;;
            "Connect_db" )
                read -p "Enter Name for data base want to connect it :" connect
                    if [ -d $connect ];then
                        cd ~/Downloads/DBs/$connect
                    else
                        echo "Not Found Name For Data Base"  
                    fi
            ;;
            * )
                break
        esac
    done 
#-------------------------------------------




