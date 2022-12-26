#!/usr/bin/bash 
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#-------------------for second menu--------------
sleep 1
select choice in create_Table List_Tables Drop_Table Insert_into_Table Select_From_Table Delete_From_Table Update_Table Back
    do
        case $choice in 
            "create_Table" )
                
                exec ~/Downloads/DBs/test_create.sh

            ;;
            #----------------------------------------------
            "List_Tables" )
             ls -F |grep /
            ;;
            #-----------------------------------------------
            "Drop_Table" )
            read -p "Enter name of Table:" drop
                if [[ -f $drop && -e $drop ]];then
            #------------------GUI FOR DROP-------------------------
                    if zenity --question --title="Confirm deletion" --text="Are you sure you want to delete this file?" --no-wrap 
                    then
                        zenity --info --title="Success" --text="Data base remove" --no-wrap
                        rm  $drop
                    fi
            #-------------------------------------------
                else
                    echo "Not Found Name Table"
                fi    
            ;;
            #------------------------------------------------
            "Insert_into_Table" )

                exec ~/Downloads/DBs/insert-data.sh

            ;;

            #------------------------------------------------
            "Select_From_Table" )

                exec ~/Downloads/DBs/select.sh



            ;;
            #-------------------------------------------------
            "Delete_From_Table" )
             
               exec ~/Downloads/DBs/del.sh


            ;;
            #------------------------------------------------
            "Update_Table" )






            ;;
            #-----------------------------------------------
            "Back")
              exec ~/Downloads/DBs/code.sh


            ;;


        esac
    done