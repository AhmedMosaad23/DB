#!/bin/bash
shopt -s extglob
#---------------------------------------------#
read -p "Enter table name: " tname
	case $tname in
		+([A-Za-z]))
			if [[ -f ./$tname ]];then 
					zenity --warning \
						--title "Warning Message" \
						--width 500 \
						--height 100 \
					--text "Error! This Table is already exist."                      
				#echo "Error! This Table is already exist."
			else
                read -p "Enter number of Fields: " num_fields		            
				while [[ "$num_fields" =~ ['!`@#$%^&*()_+'] ]]  ||  [[ -z "$num_fields" ]] || [[ $num_fields = +([A-Za-z]) ]];  
				do
					echo -e "you must enter a number \n"
					read -p "Enter The number of Fields: " num_fields  
				done
				# Start loop
				primary_key="" 
				count=1                                
				while [[ $count -le $num_fields ]]
				do  
					read -p "Name of field no.$count: " field_name
					while ! [[ $field_name = +([A-Za-z]) ]];
					do                   
						echo "invalid field name !!"
						read -p "Name of field no.$count: " field_name	
  					done
					echo -e "Type of field $field_name:"
					select type in "int" "str"
					do
						case $type in
							int )
							field_type="int";
							break
							;;
							str )
							field_type="str";
							break
							;;
							* )
							echo "invalid type" 
							;;
					    esac
					done
					new_line="\n"
					seperator=":"                                                                           
					meta_data="field"$seperator"type"$seperator"key"            
						# Check if a pk or no
						while [ "$primary_key" == "" ]   
						do
							echo -e "Do u want to make a Primary Key?"
							select answer in "yes" "no"
							do
								case $answer in
								yes ) primary_key="PKset";
									meta_data=$$field_name$seperator$field_type$seperator$primary_key;break;;
								
							    no ) primary_key="no";
									meta_data=$$field_name$seperator$field_type$seperator$primary_key;break;;

							    * ) echo "invalid answer" 
									;;
								esac
							done						
						done
						if [ "$primary_key" == "no" ];then
								primary_key=""
						fi
						arr[$count]=$field_name$seperator$field_type$seperator$primary_key
						if [ "$primary_key" == "PK" ]  ;then
								primary_key="\t"                                    
						fi
								((count++))
                done
						touch $tname
						touch meta_$tname
						echo -e "field"$seperator"type"$seperator"key" >> meta_$tname		
						for i in ${arr[*]}
						do
							echo -e "$i" >> meta_$tname                                
						done
						awk '(NR>1)' meta_$tname | cut -d ":" -f 1 | awk  '{ printf "%s:",$1 }' > $tname 
						echo "" >> $tname

						if [ $? -eq 0 ];then
								echo "table is Created Successfully"
								exec ~/Downloads/DBs/code1.sh		
						else
								echo "error! Creating table $tname"
						fi
			fi
				;;      
			*)
					echo "invalid table name: "
					;;      
    esac 