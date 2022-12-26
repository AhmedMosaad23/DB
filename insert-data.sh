#!/usr/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#----------------------------variable--------------------
new_line="\n"
sep=":" 
#----------------------------start_code-------------------------------
        read -p "Enter table name: " tname
        if [ -f $tname ]
        then
                # Count number of fields of the table
                fields=`awk -F ":" '{if(NR==1) print NF}' $tname`   
                i=2
                while [[ $i -le $fields+1 ]]
                do
                        field_name=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $1}' meta_$tname)
                        type=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $2}' meta_$tname)
                        read -p "Enter field ( $field_name ): " data
						if [[ $type == "int" ]]; then
							while ! [[ $data =~ ^[0-9]*$ ]]; do
								echo -e "invalid Type "
								echo -e "$field_name ($type) = \c"
								read data
							done
						fi
						#------------last edit -------------------------#
						if [[ $type == "str" ]]; then
							while ! [[ $data =~ ^[a-zA-Z] ]]; do
								echo -e "invalid Type "
								echo -e "$field_name ($type) = \c"
								read data
							done
						fi
                        # Insert new row into the table
                        if [ $i == $fields ]
                        then
                            new_row=$data$new_line
							new_row=$data$sep
                        else
                            new_row=$data$sep
							new_row=$data$sep
                        fi
                        echo -e $new_row"\c" >> $tname
                     ((i++))
                done
                if [ $? -eq 0 ]
                then
                        echo " new row is inserted successfully"
                else
                        echo " faild to insert Data "
                fi
        else
            echo "table name does not exist"
        fi