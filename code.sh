#!/usr/bin/bash 
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#--------First Menu------<create db>---<list>-----<drop>------<connect>
 select choice in Create_db List_db Drop_db Connect_db
    do 
        case $choice in
            "Create_db")
                read -p "Enter Name for New Data Base: " name
                if [ -e $name ];then
                    echo "Data Base have Same Name";
                else
                        re=^[A-Za-z][A-Za-z0-9_]*$
                     if [[ $name =~ $re ]];then 
                        mkdir ~/Downloads/DBs/$name;
                        chmod u+x $name
                     else
                            echo "Enter vaild Name";
                     fi
                fi            
            ;;
            "List_db" )
                read -p "Enter Name Data Base to list it: " list
                    ls ~/Downloads/DBs/$list
            ;;
            "Drop_db")
                 cd ~/Downloads/DBs
                read -p "Enter Name for data base want to remove : " drop
                    if [ -d $drop ];then
                        rm -r $drop
                    else
                        echo "Not Found Name For Data Base"
                    fi 
            ;;
            "Connect_db" )
                cd ~/Downloads/DBs
                read -p "Enter Name for data base want to connect it :" connect
                    if [ -d $connect ];then
                        cd ~/Downloads/DBs/$connect
                    else
                        echo "Not Found Name For Data Base"  
                    fi
            ;;
            * )
                break;
        esac
    done 
#-------------------------------------------




