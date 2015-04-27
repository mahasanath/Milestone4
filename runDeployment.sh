 ansible production -m copy -a "src=/var/lib/jenkins/workspace/sampleapp dest=/home/ubuntu/"
  ansible production -m copy -a "src=/home/ubuntu/deployScript.sh dest=/home/ubuntu/"
  ansible production -m shell -a "cd /home/ubuntu/; sh deployScript.sh"
  echo "silence all alerts" 
 # ansible canary1 -m nagios -a "action=silence_nagios" --sudo
 # echo "Utilization of CPU in individual server and memory usage"
  ansible production -m shell -a "mpstat; free"
  echo "Deployment Success on Production"
#  sleep 10


ansible canary4 -m copy -a "src=/var/lib/jenkins/workspace/sampleapp dest=/home/ubuntu/"
  ansible canary4 -m copy -a "src=/home/ubuntu/deployScript.sh dest=/home/ubuntu/"
  ansible canary4 -m shell -a "cd /home/ubuntu/; sh deployScript.sh"
  echo "silence all alerts" 
 # ansible canary1 -m nagios -a "action=silence_nagios" --sudo
 # echo "Utilization of CPU in individual server and memory usage"
 # ansible production -m shell -a "mpstat; free"
  echo "Deployment Success on Canary4"
#  sleep 10

