# --------------------------Devops--------------------------------
-> First I have created a folder called "DEVOPS", in that folder, created "jenkins_data" folder and an "docker.compose.yml" file. In "docker.compose.yml" file, we have created the service based on the requirement. And then in terminal, we run command as 'docker compose up" (note: we have to run "docker desktop" on the background). While running the container (docker compose up), we will get the "hashKey", copy that hashcode and meanwhile in the chrome, open the hostport(i.e, here we are using 9090, so open "localhost:9090"), there copy the "hashKey".

Hash code : 5d5d85ad4c524b8b9524d32731b450f0


-> 

--------commands--------------------
docker compose up                                             // To start the container
docker compose down                                          // To stop the containers
docker compose restart <container_name>                     // Restart the container
docker ps                                                  // it wil show the container details

