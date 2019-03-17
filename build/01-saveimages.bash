for i in $(docker images |grep -v REPO|grep docker|awk '{print $1}'); do IF=$(echo $i|awk -F'/' '{print $NF}'); docker save $i -o $IF; done;
