# Milestone4

### Devops - Special Milestone    

##### Mahalaxmi Sanathkumar (smahala@ncsu.edu)  & Parul Upadhyaya (pupadhy2@ncsu.edu)

We aim to introduce resilience testing in our system. The setup and method is explained in detail below.

#### Pre-steps to setup deployment servers and Proxy server on an Ubuntu server.
--------------------------------------------------------------------------------

* The project that has been used for the special milestone is 'sampleapp' (in App folder). This is a simple web application. This application passes all the phases of pipeline and is deployed on different servers.

* We have created two more server instances and deployed the application in those server instances. There are in total three instances running now. One runs the latest versions (canary release- Canary2 server). The shell script for this deployment is runCanary.sh. Less number of users are directed to this server instance and the other two servers are production servers. Once the application is tested properly in canary server, it is moved to the production servers. The code for production deployment is runDeployment.sh. More number of user requests are directed to this.

On executing runCanary.sh, we get the following:

![canary](https://github.com/mahasanath/Milestone4/blob/master/runCanary.png)

On executing runDeployment.sh, we get the following:

![Production](https://github.com/mahasanath/Milestone4/blob/master/runDeployment.png)

The active servers where the application is deployed are:

     [Canary2] 54.148.105.208:54321
     [Production] 54.201.118.4:54321
     [Canary4] 54.201.44.79:54321 (Another server)


* A proxy server is running on the server that deploys the application. The server maintains a list of active servers that will handle the user requests. The proxy server can be run by using the command below. Go into proxy folder and the run the command.

 ```bash
sh target/bin/webapp
```

The proxy server is running on 54.148.145.59:7878.

![proxy server](https://github.com/mahasanath/Milestone4/blob/master/proxy.png)


####Special Milestone explained
-------------------------------

The implementation and details of the special milestone is as follows:

* We are testing the robustness of the system as to how well the system can auto-scale depending on the number of users, incoming requests and the number of servers in working condition (to accept and process the user requests).

* The proxy server has the implementation for resilience testing. We are maintaining a list of active servers in an arraylist and before accepting any request, the proxy server removes a server instance randomly from the list before accepting any request. This stops the traffic flow to that one instance. The incoming requests are distributed among the left servers. At the end, the removed server is put back into the pool of active servers. This is analogous to the chaos monkey situation where abruptly a server is terminated. The requests are transferred in such a way that the canary release gets 10% of the users and rest of the servers receive the left requests in balance. The code for the same resides in src/Main/java/servlet/HelloServlet.java. 

This way the behavior of the system can be checked if the a few servers go down. 

The requests are redirected to the servers by proxy server as below:

![Canary](https://github.com/mahasanath/Milestone4/blob/master/Canary_resilience.png)

![Production 1](https://github.com/mahasanath/Milestone4/blob/master/ProductionResilience.png)

![Production 2](https://github.com/mahasanath/Milestone4/blob/master/server3.png) 

* In order to test this setup, we have used 'Siege' which is a  multi-threaded http load tester (Reference: http://linux.die.net/man/1/siege). It shows various performance measures like availability, throughput, transaction rate, etc. It generated user requests and bombards the provided url. The command for the same is given as below:

```bash
siege -d10 -c20 http://54.148.145.59:7878/hello
```
Here d is the time between two consecutive requests and c is the number of requests generated.


On starting siege, one gets the following:

![siege](https://github.com/mahasanath/Milestone4/blob/master/siege.png)

The output I received was as below. The first line is number of servers active and second line is the server removed for testing reason:

![siege console](https://github.com/mahasanath/Milestone4/blob/master/siege%20before.png)

And the performance stats is as follows obtained on stopping siege:

![siege stats](https://github.com/mahasanath/Milestone4/blob/master/siege%20after.png)

