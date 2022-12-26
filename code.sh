#!/usr/bin/bash 
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
dir=~/Downloads/DBs
if [ -e $dir ];then
   sleep 1
else  
  mkdir $dir
fi  
#--------First Menu------<create db>---<list>-----<drop>------<connect>
 select choice in Create_db List_db Drop_db Connect_db Exit
    do 
        case $choice in
            "Create_db")
                name=$(zenity --entry \--width 300 \--title "Data Base" \--text "Enter the data base name")
                    if [ -e $name ];then
                        #echo "Data Base have Same Name"
                        zenity --info --text="Data base have same name " --no-wrap
                        exec ~/Downloads/DBs/code.sh
                    else
                            re=^[A-Za-z][A-Za-z0-9_]+$
                        if [[ $name =~ $re ]];then 
                                zenity --info --text="Successful Create $name data base " --no-wrap
                                mkdir ~/Downloads/DBs/$name
                                exec ~/Downloads/DBs/code.sh
                        else
                                #echo "Enter vaild Name";
                                zenity --info --text="Enter vaild name not $name " --no-wrap
                                exec ~/Downloads/DBs/code.sh
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
                                exec ~/Downloads/DBs/code.sh
                            fi
                        #-------------------------------------------------
                            
                        else
                         echo "Not Found Name For Data Base"
                         exec ~/Downloads/DBs/code.sh
                        fi
                    #else
                    #    echo "Enter Vaild Name "
                    #fi         
            ;;
            "Connect_db" )
                cd ~/Downloads/DBs
                #read -p "Enter Name for data base want to connect it :" connect
                connect=$(zenity --entry \--width 300 \--title "Data Base" \--text "Enter the data base name")
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
            Exit )
                break;
        esac
    done 
#-------------------------------------------




