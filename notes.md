# --------------------------Devops--------------------------------

-> First I have created a folder called "DEVOPS", in that folder, created "jenkins_data" folder and an "docker.compose.yml" file. In "docker.compose.yml" file, we have created the service based on the requirement. And then in terminal, we run command as 'docker compose up" (note: we have to run "docker desktop" on the background). While running the container (docker compose up), we will get the "hashKey", copy that hashcode and meanwhile in the chrome, open the hostport(i.e, here we are using 9090, so open "localhost:9090"), there copy the "hashKey".

Hash code : 5d5d85ad4c524b8b9524d32731b450f0
-> Install all the packges by selecting first option in custom jenkins and then create username and password.

--------commands--------------------
docker compose up                                             // To start the container
docker compose down                                          // To stop the containers
docker compose restart <container_name>                     // Restart the container
docker ps                                                  // it wil show the container details
docker exec -it <containerName> bash                          // By executing this command, we can go into the container
docker cp <name of the file which we have to copy> <name of the container where we have to copy that file>
-----------------------------------------------------------------------------------------------------

-> In jenkins, 'task' is being called as 'job'.

# creating job
->Click on 'New Item' -> Fill 'Enter an item name' -> In 'Select an item type', select "Freestyle project" -> click on 'Ok'
-> When we click on 'Ok'-> It will redirect to the 'COnfiguration'-> In 'Build Steps'=>'Add Build Step'=> select 'Execution Shell'(In 'Exceution Shell', we have to write the command that we wanted to execute)-> 'Save'.
-> Then click on "Build now" (which is in left menu)-> After build is scheduled, open that particular build in the "build history"-> Check the "Console Output" to see whether build is succeed or failed.

Note: Everything that's going to happen in the jenkins job will occur within the container only, we can't see outside the container. For suppose, when we run a job in jenkins, that we can see within the container only(i.e., docker exec -it jenkins_container bash), not outside the container(docker ps). In simple, jenkins job is executed within the container.

## Some Exceution shell commands (note: all jenkins jobs are executed withing the container only)
   => echo Hello world
   => echo "current date and time is $(date)"
   => NAME=DEVIPRIYA
      echo "Hey $NAME, the current date and time is $(date)"
   => NAME=PAVANSAI
      echo "Hey $NAME, the current date and time is $(date)" >/tmp/info      // check:  cat /tmp/info (check within container: docker exec -it jenkins_container bash )

# Executing bash scripts in jenkins
-> First I have created a sampleScript.sh outside the container. (If you want, we can execute as below:
   ./sampleScript.sh Devi mam
   )
-> Then copy this .sh file to container using below command:
    docker cp sampleScript.sh jenkins_container:/tmp/sampleScript.sh
-> Then go to the container(docker exec -it jenkins_container bash)
   Check whether it is copied perfectly or not(cat tmp/sampleScript.sh)
   Then execute this command: /tmp/script.sh Devi priya
-> Now we can run the job in container with same command in execution shell(/tmp/script.sh Devi priya) 
   and build it

# Add parameters to the job
-> Here we can dynamically add the parameters while configuration itself.
   Configuration -> General -> Select "The project is parameterized"-> Add Paramter(string parameter)-> Give name and default value-> Add something into the execution shell(eg: echo $FIRST_NAME $LASTNAME)->save-> Build with parameters-> Here we can use default parameters or we can change the parametrs and build it.