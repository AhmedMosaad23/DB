#!/usr/bin/bash 
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#--------First Menu------<create db>---<list>-----<drop>------<connect>
 select choice in Create_db List_db Drop_db Connect_db
    do 
        case $choice in
            "Create_db")
                name=$(zenity --entry --title="Please enter your name")
                zenity --info --text="Successful Create $name " --no-wrap
                if [ -e $name ];then
                    echo "Data Base have Same Name";
                else
                        re=^[A-Za-z][A-Za-z0-9_]*$
                     if [[ $name =~ $re ]];then 
                        mkdir ~/Downloads/DBs/$name;
                     else
                            echo "Enter vaild Name";
                     fi
                fi            
            ;;
            "List_db" )
                #read -p "Enter Name Data Base to list it: " list
                    ls -F ~/Downloads/DBs | grep /
            ;;
            "Drop_db")
                 cd ~/Downloads/DBs
                read -p "Enter Name for data base want to remove : " drop
                   #re=^[A-Za-z][A-Za-z0-9_]*$
                   # if [[ $connect =~ $re ]];then
                        if [ -d $drop ];then
                        #--------------------------GUI--------------------
                            if zenity --question --title="Confirm deletion" --text="Are you sure you want to delete this file?" --no-wrap 
                            then
                                zenity --info --title="Success" --text="Data base remove" --no-wrap
                                rm -rf $drop
                            fi
                        #-------------------------------------------------
                            
                        else
                         echo "Not Found Name For Data Base"
                        fi
                    #else
                    #    echo "Enter Vaild Name "
                    #fi         
            ;;
            "Connect_db" )
                cd ~/Downloads/DBs
                read -p "Enter Name for data base want to connect it :" connect
                    re=^[A-Za-z][A-Za-z0-9_]+$
                     if [[ $connect =~ $re ]];then
                        if [ -d $connect ];then
                            cd ~/Downloads/DBs/$connect
                            exec ~/Downloads/DBs/code1.sh
                        else
                            echo "Not Found Name For Data Base"  
                        fi
                     else 
                        echo "Enter Vaild Name"
                     fi   
            ;;
            * )
                break;
        esac
    done 
#-------------------------------------------




