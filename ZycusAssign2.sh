#Write a bash/python script that takes list of hostnames (comma separated) as an argument.
#This script, when executed, should connect to all the servers via. SSH (standard port) (assume #password-less connectivity) and give a single prompt to the user.
#When the user executes a command on this prompt, the script should run the command on all connected #servers and display the output.
#Make this as efficient as possible, code comments appreciated.


#!/bin/bash

#Storing Hostnames entered as arguments to the script!
hostnames=$@

#Enter the command to execute on all the hostnames!
echo "Enter the command to execute"
read -p 'Command: ' command

#Overwriting results file if already exists!
echo "Your results are " > ./result

#User to login via ssh!
user=ec2-user

#For Loop to login to every host and execute command and store the output in results file!
for host in $(echo $hostnames | sed "s/,/ /g")
do
   echo "This is for $host" >> ./result
   ssh $user@$host "$command" >> ./result
done

#Displaying the output of command for every hostname
cat ./result

#Script Ends
echo All Done
