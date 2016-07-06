<!-- 
Copyright 2015-2016 IBM Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--> 

{% extends 'tutorial/home.html' %}
{% load static %}

{% block copy_introduction %}
    <h2>Interactive commandline tutorials</h3>
    <p> The best way to learn how OpenWhisk works is to use it!</p>
    <p>This hands-on tutorial is 100% online, so you don't need to install a thing. In about 20-25 minutes you'll be familiar with the basic OpenWhisk commands.</p>
{% endblock %}



{% block linksToTrails %}
<div id="interactive">
    {% include 'tutorial/snippet.html' %}
</div>
<div class="jumbotron" id="basic">

    <div class="row text-center" id="headerHolder">
      <h3>wsk Basic Actions Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/blueTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
            <h4>Learn the first steps of using the wsk CLI, such as:</h4>
            <ul>
              <li>Create an action</li>
              <li>Invoke a blocking action</li>
              <li>Invoke a non-blocking action</li> 
              <li>Get result of a non-blocking action</li>
            </ul>
            <a class="btn btn-primary secondary-action-button" onclick="switchToBasic(); goFullScreen(0);">Start the Actions tutorial</a>
        </div>       
    </div>
</div>  

<div class="jumbotron" id="advanced">

    <div class="row text-center" id="headerHolder">
      <h3>wsk Advanced Actions  Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/redTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
            <h4>Learn the first steps of using the wsk CLI, such as:</h4>
            <ul>
              <li>Create chain of actions</li>
            </ul>
            <a class="btn btn-primary secondary-action-button" onclick="switchToAdvanced(); goFullScreen(0);">Start the Advanced tutorial.</a>
        </div>       
    </div>
</div>  

<div class="jumbotron" id="triggers">
    <div class="row text-center" id="headerHolder">
      <h3>wsk Triggers Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/blueTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
            <h4>Learn to use triggers</h4>
            <ul>
                <li>Create a trigger</li>
            </ul>
            <a class="btn btn-primary secondary-action-button" onclick="switchToTriggers(); goFullScreen(0);">Start the Triggers tutorial.</a>
        </div>       
    </div>
</div> 

<div class="jumbotron" id="rules">
    <div class="row text-center" id="headerHolder">
      <h3>wsk Rules Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/blueTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
          <h4>Learn to use rules</h4>
          <ul>
            <li>Create a rule</li>
          </ul>
          <a class="btn btn-primary secondary-action-button" onclick="switchToRules(); goFullScreen(0);"> Start the Rules tutorial</a>
        </div>       
    </div>
</div>  

<div class="jumbotron" id="packages">

    <div class="row text-center" id="headerHolder">
      <h3>wsk Packages Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/blueTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
          <h4>Learn to use packages:</h4>
          <ul>
            <li>Create a packages</li>
          </ul>
          <a class="btn btn-primary secondary-action-button" onclick="switchToPackages(); goFullScreen(0);"> Start the Packages tutorial</a>
        </div>       
    </div>
</div> 

<div class="jumbotron" id="mobilesdk">

    <div class="row text-center" id="headerHolder">
      <h3>wsk Mobile SDK Tutorial</h3>
    </div>

    <div class="row">
        <div id="imgHolder" class="col-md-7">
            <img id="tutorialPreview" src="{% static 'img/blueTut.png' %}" alt="wsk tutorial">
        </div>

        <div class="col-md-5">
          <h4>Learn to use Mobile SDK</h4>
            <ul>
              <li>Mobile SDK Placeholder</li>
            </ul>
          <a class="btn btn-primary secondary-action-button" onclick="switchToPackages(); goFullScreen(0);"> Start the Mobile SDK tutorial</a>
        </div>       
    </div>
</div>  




{% endblock %}