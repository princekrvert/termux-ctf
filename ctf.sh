#!/usr/bin/bash 
#This tool is made by Prince Kumar 
#date 20 Jun 2023 
# If you are copying any part of the script give me the credit ..
# Trap the signal 
trap user_inttrupt SIGINT
trap user_inttrupt SIGTERM
user_inttrupt(){
echo -e "\033[31;1m Exiting ctf tool.."
exit 1
}
# Make a function to requirements 
req(){
# First check the os 
os=$(uname -o)
if [[ $os == "Android" ]];then
	command -v go > /dev/null 2>&1 || { echo -e "\e[32;1m Installing golang "; pkg install golang -y ;}
	command -v php > /dev/null 2>&1 || { echo -e "\e[32;1m Installing php" ; pkg install php -y; }
	command -v gum > /dev/null 2>&1 || { echo -e "\e[32;1m Installing gum" ; pkg install gum -y; }


else
	command -v go > /dev/null 2>&1 || { echo -e "\033;32;1m Installing golang "; sudo apt install golang -y ;}
	command -v php > /dev/null 2>&1 || { echo -e "\e[32;1m Installing php" ; sudo apt install php -y; }
	command -v php > /dev/null 2>&1 || { echo -e "\e[32;1m Installing php" ;sudo mkdir -p /etc/apt/keyrings;
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg;
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list;
sudo apt update && sudo apt install gum;}


fi
}
# NOw call the requirements function 
req 
# make a function to update the repo 
update_me(){
git pull
}
# make a function to generate the hash according to the system..
gen_hash(){
if [[ -f hash/main ]];then
	echo -ne ""
else
	gum style \
	--foreground 212 --border-foreground 212 --border normal \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Generating some binary '
	c_dir=$(pwd)
	cd hash 
	go build main.go 
	cd $c_dir
fi
}
gen_hash
#make a fuction if all is called 
all_c(){
# copy the all challange and make a temprory file to store  the output.. 
# first remove the old file if present ..
if [[ -f .pkctf/all ]];then 
	rm -rf .pkctf/all
else
	# no file is present.. 
	echo -ne " " 
fi
cat .pkctf/* > .pkctf/all
display_manue all
}
# Make a function for the About me 
about_me(){
echo -e "\e[32;1m Hi there , i am Prince Kumar a junior mechanical enginner. I am interested in cyber security."
echo -e "\e[32;1m Here is my social media links if you want to contact me."
echo -e "\e[30;1m Instagram : https://instagram.com/princekrvert \n Facebook : https://facebook.com/princekrvert \n Telegram : t.me/princekrvert"
}
# make a function to remove the wrong ans from the six fields....
remove_w_ans(){
# let's suppose $1 file name and $2 is the line number 
f_line=$(head -$2 $1 | tail +$2)
six_field=$( echo $f_line | awk '{ printf $6 }')
# now remove this text form that line use sed to do that 
sed -i -e $2"s/${six_field}/ /" $1

}

# now make a banner for this tool 
banner(){
echo -ne "\033[31;1m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠃⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⢛⠒⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣶⣄⡈⠓⢄⠠⡀⠀⠀⠀⣄⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣷⠀⠈⠱⡄⠑⣌⠆⠀⠀⡜⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠳⡆⠐⢿⣆⠈⢿⠀⠀⡇⠘⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣷⡇⠀⠀⠈⢆⠈⠆⢸⠀⠀⢣⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠈⢂⠀⡇⠀⠀⢨⠓⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣦⣤⠖⡏⡸⠀⣀⡴⠋⠀⠈⠢⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠁⣹⣿⣿⣿⣷⣾⠽⠖⠊⢹⣀⠄⠀⠀⠀⠈⢣⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣇⣰⢫⢻⢉⠉⠀⣿⡆⠀⠀⡸⡏⠀⠀⠀⠀⠀⠀⢇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⡇⠈⢸⢸⢸⠀⠀⡇⡇⠀⠀⠁⠻⡄⡠⠂⠀⠀⠀⠘
⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠛⠓⡇⠀⠸⡆⢸⠀⢠⣿⠀⠀⠀⠀⣰⣿⣵⡆⠀⠀⠀⠀
⠈⢻⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⣦⣀⡇⠀⢧⡇⠀⠀⢺⡟⠀⠀⠀⢰⠉⣰⠟⠊⣠⠂⠀⡸
⠀⠀⢻⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢧⡙⠺⠿⡇⠀⠘⠇⠀⠀⢸⣧⠀⠀⢠⠃⣾⣌⠉⠩⠭⠍⣉⡇
⠀⠀⠀⠻⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣋⠀⠈⠀⡳⣧⠀⠀⠀⠀⠀⢸⡏⠀⠀⡞⢰⠉⠉⠉⠉⠉⠓⢻⠃
⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⢀⣀⠠⠤⣤⣤⠤⠞⠓⢠⠈⡆⠀⢣⣸⣾⠆⠀⠀⠀⠀⠀⢀⣀⡼⠁⡿⠈⣉⣉⣒⡒⠢⡼⠀
⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣎⣽⣶⣤⡶⢋⣤⠃⣠⡦⢀⡼⢦⣾⡤⠚⣟⣁⣀⣀⣀⣀⠀⣀⣈⣀⣠⣾⣅⠀⠑⠂⠤⠌⣩⡇⠀
⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⣺⢁⣞⣉⡴⠟⡀⠀⠀⠀⠁⠸⡅⠀⠈⢷⠈⠏⠙⠀⢹⡛⠀⢉⠀⠀⠀⣀⣀⣼⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⡟⢡⠖⣡⡴⠂⣀⣀⣀⣰⣁⣀⣀⣸⠀⠀⠀⠀⠈⠁⠀⠀⠈⠀⣠⠜⠋⣠⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡟⢿⣿⣿⣷⡟⢋⣥⣖⣉⠀⠈⢁⡀⠤⠚⠿⣷⡦⢀⣠⣀⠢⣄⣀⡠⠔⠋⠁⠀⣼⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡄⠈⠻⣿⣿⢿⣛⣩⠤⠒⠉⠁⠀⠀⠀⠀⠀⠉⠒⢤⡀⠉⠁⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣤⣤⠴⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠤⠀⠀⠀⠀⠀⢩⠇⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[32;1m MADE BY PRINCE⠀"
echo ""
}
banner
# make a function to take the line number host the file and see the description 
display_challange(){
full_line=$(head -$1 $2 | tail +$1)
name_of_challange=$( echo $full_line | awk '{ printf $1 }')
discription_of_challange=$( echo $full_line | awk '{ printf $4 }')
location=$( echo $full_line | awk '{ printf $2 }')
echo -ne "\033[32;1m [~] \033[33;1m $name_of_challange \033[32;1m [~] \n"
echo -e "\e[35;1m $discription_of_challange "
# host the file name 
ran=$((RANDOM % 10))

gum spin --spinner dot --title "Starting server" -- sleep 3
php -S 127.0.0.1:8${ran}6${ran} -t $location > /dev/null 2>&1 & sleep 5
echo -e "\033[36;1m Server running on http://127.0.0.1:8${ran}6${ran} "
u_ans=$(gum input --placeholder "Your answer")
# now check for the user ans ..
third_field=$( echo $full_line | awk '{ printf $3 }')
ans_given=$(./hash/main sha256 $u_ans)

if [[ $third_field == $ans_given ]];then 
	# now place the ans into six field
	echo -ne "\033[0;1m congratulations..." 
	sed -i -e $1"s/.*/& ${u_ans}/" $2
else 
	echo -e " Wrong ans restrating the menu"
	sleep 2
	category 
	
fi

}
# create a function to create file manue 
display_manue(){
# first check the number of lines in the file ..
n=$(wc -l .pkctf/$1 | awk '{ printf $1 }' )
i=1
# now read the lines ..
while read -r line;do
	# check if 6th filed is present or not 
	six_field=$( echo ${line} | awk '{ printf $6 }')
	first_field=$( echo ${line} | awk '{ printf $1 }')
	if [[ $six_field == "" ]];then 
		echo -e "\033[31;1m[$i] $first_field "
	else 
		# now compare the hash 
		ans=$( hash/main sha256 $six_field) 
		third_field=$( echo ${line} | awk '{ printf $3 }')
		
       		if [[ $third_field == $ans ]];then
	 		echo -e "\033[32;1m[$i] $first_field"
		else
			echo -e "\033[31;1m[$i] $first_field "
			# now remove the wrong ans ...
			remove_w_ans .pkctf/$1 $i

		fi		
	fi
	i=$((i+1))
done < .pkctf/$1
# now read the user option challange.. 
read c_option 
display_challange $c_option .pkctf/$1
}
# make a function to categoty .
category(){
clear 

c_optn=$(gum choose "Forensics" "Web exploitation" "Reverse Engineering" "Cryptography" "Binary exploitaion" "Previous manue")

# now check the user option I
if [[ $c_optn == "Forensics" ]];then
	if [[ -f .pkctf/forensic ]];then
		# now disply the manue 
		display_manue forensic
	else
		echo "file not found"
	fi
elif [[ $c_optn == "Web exploitation" ]];then 
	if [[ -f .pkctf/web ]];then
		display_manue web
	else
		echo "file not found update the tool"
	fi
elif [[ $c_optn == "Reverse Engineering" ]];then 
	if [[ -f .pkctf/reverse ]];then
		display_manue reverse
	else
		echo "File not found update the tool"
	fi
elif [[ $c_optn == "Cryptography" ]];then 
	# first check if file is exist or not 
	if [[ -f .pkctf/cryptography ]];then
		display_manue cryptography 
	else
		echo -ne "Some file removed please update the tool .."
	fi
elif [[ $c_optn == "Binary exploitaion" ]];then 
	echo "Binary explotation called"
elif [[ $c_optn == "Previous manue" ]];then 
	main_m
else 
	echo -ne "\033[31;1m Invalid option "
	exit 1
fi
}
# Now make a manue for the ctf 
main_m(){
echo -ne "\033[32;1m[~] \033[0;1m Choose :"
echo ""
user_f=$(gum choose "All" "Category" "Update" "About me" "Exit")
# NOw read the answer form the user
if [[ $user_f == "All" ]];then
	all_c
elif [[ $user_f == "Category" ]];then 
	# show to category to solve to the user
	category
elif [[ $user_f == "Update" ]];then
	echo -e "\033[30;1m Updating the tool.."
	update_me
elif [[ $user_f == "About me" ]];then
	about_me
elif [[ $user_f == "Exit" ]];then 
	echo -e "\033[30;1m Exit"
else 
	echo -e "\033[31;1m Invalid input Exiting.. "
	exit 1 
fi
}
main_m
