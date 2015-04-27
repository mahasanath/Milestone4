while true
do
#ansible canary2 -m shell -a "sudo latencytop"
  ansible canary2 -m copy -a "src=/var/lib/jenkins/workspace/sampleapp dest=/home/ubuntu/"
  ansible canary2 -m copy -a "src=/home/ubuntu/deployScript.sh dest=/home/ubuntu/"
  ansible canary2 -m shell -a "cd /home/ubuntu/; sh deployScript.sh"
  echo "silence all alerts" 
 # ansible canary1 -m nagios -a "action=silence_nagios" --sudo
 # echo "Utilization of CPU in individual server and memory usage"
  ansible canary2 -m shell -a "mpstat; free"
  echo "Deployment Success on Canary server"
#  sleep 10
done
