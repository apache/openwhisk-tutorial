# OpenWhisk Tutorials

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

OpenWhisk is a cloud-first distributed event-based programming service. 
It provides a programming model to upload event handlers to a cloud service, and register the handlers to respond to various events. 
Learn more at the main repository [openwhisk](https://github.com/openwhisk/openwhisk) 

This repository contains an interactive tutorials for the OpenWhisk CLI. 


Whisk Tutorial
===============

The Whisk tutorial is an interactive learning environment to get familiar with the whisk command line.


Development Guide:
==================
This project uses a simplified Django structure, builds on Django 1.6 and uses Python 2.7. 


Setting up the application:
=================
1. Clone whisk-tutorial repository to your local machine
2. Navigate to the whisk-tutorial folder

Running locally: 
=================
To run the application locally, execute the following commands from the whisk-tutorial directory:

`pip install -r requirements.txt`

`python manage.py runserver localhost:8080`

Running with Docker
=================
If you don't want bother run locally, you can run the tutorial in Docker with following comand:

`docker build -t openwhisk-tutorial .`
This command will help build the tutorial docker image.

`sudo docker run --name whisk-tutorial  -p 8081:8000 -d openwhisk-tutorial`
THis command will start a container running the tutorial app with name whisk-tutorial, and map
port 8081 from host to port 8000 in the container.

Now, open your host web browser, and nagivate to http://localhost:8081, you should be able to practice
with the tutorial now.

Running on Bluemix:
===================
There are two options to deploy to bluemix - manually and through the "deploy" button.     

Click to Deploy:
----------
[![Deploy to Bluemix](https://bluemix.net/deploy/button_x2.png)](https://bluemix.net/deploy?repository=https://github.com/openwhisk/openwhisk-tutorial.git)

Manual Deployment:
-------------
  1. Change the name field in the manifest.yml to a preferred name   
  2. Execute `cf push` from the whisk-tutorial directory  
   
Delete app from bluemix:
----------

   `cf delete learnwhisk`

NOTE: You will need to register for a Bluemix account.

Install dev tools:
===================
install coffee-script: `npm install -g coffee-script`   

install django-markdown-deux: `pip install django-markdown-deux`
   
Adding Tutorial/Trails links:
===========================
1. Locate home.md in the templates directory(i.e. whisk-tutorial/whisk_tutorial/tutorial/templates/home.md)
2. Add a new div tag to the tutorial links div


Adding/Updating steps
=======================
All the steps are stored in arrays. The basic tutorial is stored in 'q' while the advanced tutorial
is stored in 'adv_q' both of which can be found in steps.coffee. If you follow the pattern in the steps.coffee 
file it should be fairly trivial to figure out how to modify a question. When steps.cofee is modified you
will need to compile the .coffee files to javascript file. For this you will need to have coffee-script 
installed on your computer. see "Install dev tools" section above. 

1. Open the steps.coffee file that is located in whisk_tutorial/static/js directory.
2. Locate the corresponding queue to which you'd like add a step to. For example, trigger_q holds all the step items for the trigger tutorial. 
3. Push a new item to the corresponding q. You can reuse the structure from previous steps.   
   Example: trigger_q.push({...})

compilation command: `coffee -c steps.coffee`
this will generate the steps.js file.

Updating the wsk cli interpreter
================================
The interpreter is written in terminal.coffee, in the 'wsk' function. The itepreter logic is a set of 
if else statements. The logic flow is pretty straight forward. To generate the js file, run the following:

1. Open the terminal.coffee file that is located in the whisk_tutorial/static/js directory.
2. Adding a new command to the interpreter:    
  1. Locate "WSK Interpreter" comment block    
  2. Add a new if clause to the wsk if-else code block and echo to the corresponding variable holding the content for the output   
  3. Adding content for the output of a command:  
     a. Locate "WSK Content" comment block.   
     b. Create a new variable holding the output content for the command to be added.   
3. Compile the terminal.coffee file:   
  1. `coffee -c terminal.coffee` 


Styling
==========
Styling can be found in the tutorial-style.css file.

Attribution
==============
The codebase for this project was cloned from the docker-tutorial(https://github.com/docker/docker-tutorial/commits/master).


### License

Copyright 2015-2016 IBM Corporation

Licensed under the [Apache License, Version 2.0 (the "License")](http://www.apache.org/licenses/LICENSE-2.0.html).

Unless required by applicable law or agreed to in writing, software distributed under the license is distributed on an "as is" basis, without warranties or conditions of any kind, either express or implied. See the license for the specific language governing permissions and limitations under the license.

### Issues

Report bugs, ask questions and request features [here on GitHub](../../issues).

### Contributing to OpenWhisk

We welcome contributions, but request you follow these [guidelines](CONTRIBUTING.md)

Happy coding!

testing skip travis on master


