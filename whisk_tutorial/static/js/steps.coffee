###
  This is the main script file. It can attach to the terminal
###

COMPLETE_URL = "/whats-next/"


###
  Array of question objects
###


q = []
q.push ({
html: """
      <h3>OpenWhisk Getting started</h3>
      <p>OpenWhisk is an event-driven compute platform that executes code in response to events or direct invocations.
      </p>
      <p>Examples of events include changes to database records, IoT sensor readings that exceed a certain temperature, new code commits to a GitHub repository, or simple HTTP requests from web or mobile apps. Events from external and internal event sources are channeled through a trigger, and rules allow actions to react to these events. </p>
      <p>Actions can be small snippets of Javascript or Swift code, or custom binaries embedded in a Docker container. Actions in OpenWhisk are instantly deployed and executed whenever a trigger fires. The more triggers fire, the more actions get invoked. If no trigger fires, no action code is running, so there is no cost.</p>
      <p>In addition to associating actions with triggers, it is possible to directly invoke an action by using the OpenWhisk API, CLI, or iOS SDK. A set of actions can also be chained without having to write any code. Each action in the chain is invoked in sequence with the output of one action passed as input to the next in the sequence.</p> <a href="https://new-console.ng.bluemix.net/docs/openwhisk/index.html"> Getting Started with Bluemix OpenWhisk documentation</a>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Use a wsk command to see the full list of accepted arguments</p>
      <p>If you see a list of arguments then you know that you are all set with your wsk client installation.</p>
      """
intermediateresults: [
  () -> """<p>Whisk argument switches usually start with two dashes. Try "--help"</p>"""
  ]
tip: "<p>This emulator provides only a limited set of shell and wsk commands, so some commands may not work as expected</p>"
command_expected: ['wsk', '--help']
result: """<p>Well done! Let's move to the next assignment.</p>"""
})

q.push ({
html: """
      <h3>Creating a JavaScript Action</h3>
      <p>Actions encapsulate an actual code to be executed. One can think of an action as a piece of code that runs in response to an event. Actions support multiple language bindings including NodeJS, Swift and arbitrary binary programs encapsulated in Docker Containers. Actions invoke any part of an open ecosystem including existing Bluemix services for analytics, data, cognitive, or any other 3rd party service. </p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Create an action called "hello" from the content of the "hello.js" file. "hello.js" had been already created.</p>
      """
command_expected: ['wsk', 'action', 'create', 'hello', 'hello.js']
result: """<p>You found it! Way to go!</p>"""
tip: "For this assignment, the file 'hello.js' had been already created. Perform a 'ls' to ensure file exists and 'cat hello.js' to examine the contents of the file"
})

q.push ({
html: """
      <h3>List actions that have been created. </h3>
      <p>Existing and newly created actions can be looked up by using a wsk command.</p>
      """
assignment:
      """
      <h3>Assignment</h3>
      <p>List the actions that were created</p>
      """
command_expected: ['wsk', 'action', 'list']
result: """<p>Cool. Look at the result. You'll see that the action created in step 1 was listed</p>"""
})

q.push ({
html: """
      <h3>Running an action using a blocking invocation</h3>
      <p>After you create your action, you can run it in the cloud in OpenWhisk with the 'invoke' command. You can invoke actions with a blocking
      invocation or a non-blocking invocation by specifying a flag in the command. A blocking invocation waits until the action runs to completion and
      returns a result. This example uses blocking invocation.</p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Invoke the hello action utilizing blocking invocation.  </p>
      """
command_expected: ['wsk', 'action', 'invoke', '--blocking', 'hello']
command_show: ['wsk', 'action', 'invoke', '--blocking', 'hello']

result: """<p>Great! The command outputs two important pieces of information:
            <ul>
              <li>The activation ID (44794bd6aab74415b4e42a308d880e5b)</li>
              <li>The invocation result. The result in this case is the string Hello world 
              returned by the JavaScript function. The activation ID can be used to 
              retrieve the logs or result of the invocation at a future time.</li>
            </ul>"""
intermediateresults: [
  () -> """<p>You seem to be almost there. Did you feed in the "wsk action" command "invoke --blocking hello" parameters?"""
  ]
tip:"""
    <ul>
       <li>Remember to use wsk action command.</li>
    </ul>
    """
})

q.push ({
html: """
      <h3>Running an action using a non-blocking invocation</h3>
      <p>If you don't need the action result right away, you can omit the --blocking flag to make a non-blocking invocation. You can get the result later by using the activation ID. </p>
      """
assignment: """
            <h3>Assignment</h3>
            <p>Invoke the "hello" action utilizing non-blocking invocation.  </p>
            """
command_expected: ['wsk', 'action', 'invoke', 'hello']
command_show: ['wsk', 'action', 'invoke', 'hello']

result: """<p>Great! Action was invoked. Next we are going to obtain the result"""
intermediateresults: [
  () -> """<p>You seem to be almost there. Did you feed in the wsk action command "invoke hello" parameters"""
  ]
tip:  """
      <ul>
        <li>Remember to use wsk action</li>
      </ul>
      """
})

q.push ({
html: """
      <h3>Get action's invocation result using the activation ID</h3>
      <p>You can get an actions result by using the action activation ID. If you forgot to record the activation ID, you can get a list of activations ordered from most recent to the oldest running the <code> wsk activation list</code> command </p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Obtain a non-blocking action's result.  Remember, a non-blocking invocation may execute in the background so obtaining the result requires the activation ID</p>
      """
command_expected: ["wsk", "activation", "result", "6bf1f670ee614a7eb5af3c9fde813043"]
command_show: ["wsk", "activation", "result", "6bf1f670ee614a7eb5af3c9fde813043"]

result: """<p>Great! You Have completed the Basic wsk CLI tutorial! Hit next to move on to the <em style="color:crimson;">Advanced</em> tutorial!"""
tip: """
  <ul>
     <li>You need to use the <code> wsk activation result</code> command along with the activation ID</li>
  </ul>
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the basic wsk commands!</p>
          <p><strong>Did you enjoy this tutorial? </p>
          <h3>Your next steps</h3>
          <ol>
            <li><a href="#" onClick="leaveFullSizeMode()">Close</a> this tutorial, and continue with the rest of the getting started.</li>
          </ol>
          <p> - Or - </p>
          <p>Continue to learn the advanced features of the wsk CLI. </p><p><a onclick="switchToAdvanced()" class='btn btn-primary secondary-action-button'>Start <em style="color:crimson;">Advanced</em> tutorial</a></p>

        </div>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

  ]
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )

})


###
  Array of ADVANCED question objects
###

adv_q = []

adv_q.push ({
html: """
      <h3>Creating a python action</h3>
      <p>The process of creating Python actions is similar to that of JavaScript actions.</p>
      """
assignment: """
            <h3>Assignment</h3>
            <p>Creating a python action</p>
            """
command_expected: ['wsk', 'action', 'create', 'helloPython', 'hello.py']
command_show: ['wsk', 'action', 'create', 'helloPython','hello.py']

result: """<p>Great! Python action was created. """
intermediateresults: [
  () -> """<p>You seem to be almost there. Did you feed in the wsk action command "invoke hello" parameters"""
  ]
tip:  """
      <ul>
        <li>You could create actions implemented in other languages, such as Java, Swift, they are the same!</li>
      </ul>
      """
})

adv_q.push ({
html: """
      <h3>Creating Sequence of actions</h3>
      <p>You can create an action that chains together a sequence of actions.Several utility actions are provided in a package called /whisk.system/util that you can use to create your first sequence. You can learn more about packages in the Packages section. </p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>1. Display the actions in the /whisk.system/util package using <code>wsk package get --summary /whisk.system/util</code> 2. Create an action sequence called "sequenceOfActions" so that the result of the <code>/whisk.system/util/cat</code> action is passed as an argument to the <code>/whisk.system/util/sort</code> action. </p>
      """
#command_expected: ["wsk", "action", "create", "sequenceOfActions", "--sequence", "/whisk.system/util/cat,/whisk.system/util/sort"]
command_expected: ["end_of_tutorial"] # Used to signify end of tutorial
command_show: ["wsk", "action", "create", "sequenceOfActions", "--sequence", "/whisk.system/util/cat,/whisk.system/util/sort"]

result: """<p>Great! You Have completed the Advanced CLI tutorial!"""
tip: """
  <ul>
     <li>Creating action sequences is similar to creating a single action except one needs to add the "--sequence" switch and specify a list of comma separated existing actions</li>
  </ul>
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the  wsk action commands!</p>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

      return """<p>All done!. You are now familiar with the action command.</p>"""
  ]
tip: """<ul>
     </ul>"""
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )


})

###
  Array of Triggers question objects
###

trigger_q = []

trigger_q.push ({
html: """
      <h3>Creating Triggers</h3>
      <p>You can create a trigger using the trigger command</p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Create a trigger called 'myTrigger'</p>
      """
#command_expected: ["wsk", "trigger", "create", "myTrigger"]
command_expected: ["end_of_tutorial"] #Used to signify end of tutorial
command_show: ["wsk", "trigger", "create", "myTrigger"]

result: """<p>Great! You have completed the Trigger tutorial!"""
tip: """
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the  wsk trigger commands!</p>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

      return """<p>All done!. You are now familiar with the trigger command.</p>"""
  ]
tip: """<ul>
     </ul>"""
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )


})


###
  Array of Rules question objects
###

rlz_q = []
rlz_q.push ({
html: """
      <h3>Creating a rule</h3>
      <p>You can create a rule using the rule command</p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Create a rule called 'myRule'</p>
      """
#command_expected: ["wsk", "rule", "create", "myRule"]
command_expected: ["end_of_tutorial"] #Used to signify end of tutorial
command_show: ["wsk", "rule", "create", "myRule"]

result: """<p>Great! You Have completed the Rules tutorial!"""
tip: """
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the  wsk rules commands!</p>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

      return """<p>All done!. You are now familiar with the rule command.</p>"""
  ]
tip: """<ul>
     </ul>"""
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )


})

###
  Array of Packages question objects
###

pkg_q = []
pkg_q.push ({
html: """
      <h3>Creating a package</h3>
      <p>You can create a package using the package command</p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Create a package called 'myPackage'</p>
      """
#command_expected: ["wsk", "package", "create", "myPackage"]
command_expected: ["end_of_tutorial"] #Used to signify end of tutorial
command_show: ["wsk", "package", "create", "myPackage"]

result: """<p>Great! You Have completed the package tutorial!"""
tip: """
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the  wsk package commands!</p>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

      return """<p>All done!. You are now familiar with the package command.</p>"""
  ]
tip: """<ul>
     </ul>"""
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )


})


###
  Array of Packages question objects
###

mob_q = []
mob_q.push ({
html: """
      <h3>Placeholder for mobile SDK</h3>
      <p></p>
      """
assignment: """
      <h3>Assignment</h3>
      <p>Placeholder</p>
      """
#command_expected: ["placeholder"]
command_expected: ["end_of_tutorial"] # Used to signify end of tutorial
command_show: ["placeholder"]

result: """<p>Great! You Have completed the MobileSDK tutorial!"""
tip: """
  """
intermediateresults:
  [
    () ->
      $('#instructions .assignment').hide()
      $('#tips, #command').hide()

      $('#instructions .text').html("""
        <div class="complete">
          <h3>Congratulations!</h3>
          <p>You have mastered the  MobileSDK trail!</p>
        """)


      data = { type: EVENT_TYPES.complete }
      #logEvent(data)

      return """<p>All done!.</p>"""
  ]
tip: """<ul>
     </ul>"""
finishedCallback: () ->
  webterm.clear()
  webterm.echo( myTerminal() )
})

# the index arr
questions = []




###
  Register the terminal
###

@webterm = $('#terminal').terminal(interpreter, basesettings)




EVENT_TYPES =
  none: "none"
  start: "start"
  command: "command"
  next: "next"
  peek: "peek"
  feedback: "feedback"
  complete: "complete"



###
  Sending events to the server


logEvent = (data, feedback) ->
    ajax_load = "loading......";
    loadUrl = "/tutorial/api/";
    if not feedback
      callback = (responseText) -> $("#ajax").html(responseText)
    else
      callback = (responseText) ->
        results.set("Thank you for your feedback! We appreciate it!", true)
        $('#feedbackInput').val("")
        $("#ajax").html(responseText)

    if not data then data = {type: EVENT_TYPES.none}
    data.question = current_question


    $("#ajax").html(ajax_load);
    $.post(loadUrl, data, callback, "html")


###
###
  Event handlers
###


## next
$('#buttonNext').click (e) ->

  # disable the button to prevent spacebar to hit it when typing in the terminal
  this.setAttribute('disabled','disabled')
  console.log(e)
  next()

$('#buttonFinish').click ->
  window.open(COMPLETE_URL)

## previous
$('#buttonPrevious').click ->
  previous()
  $('#results').hide()

## Stop mousewheel on left side, and manually move it.
$('#leftside').bind('mousewheel',
  (event, delta, deltaX, deltaY) ->
    this.scrollTop += deltaY * -30
    event.preventDefault()
  )

$('#overlay').bind('mousewheel',
  (event, delta, deltaX, deltaY) ->
    this.scrollTop += deltaY * -30
    event.preventDefault()
  )

## submit feedback
$('#feedbackSubmit').click ->
  feedback = $('#feedbackInput').val()
  data = { type: EVENT_TYPES.feedback, feedback: feedback}
  #logEvent(data, feedback=true)

## fullsize
$('#fullSizeOpen').click ->
  goFullScreen()

@goFullScreen = () ->
  window.scrollTo(0, 0)
  console.debug("going to fullsize mode")
  $('.togglesize').removeClass('startsize').addClass('fullsize')

  $('.hide-when-small').css({ display: 'inherit' })
  $('.hide-when-full').css({ display: 'none' })

  next(0)

  webterm.resize()

  # send the next event after a short timeout, so it doesn't come at the same time as the next() event
  # in the beginning. Othewise two sessions will appear to have been started.
  # This will make the order to appear wrong, but that's not much of an issue.


## leave fullsize
$('#fullSizeClose').click ->
  leaveFullSizeMode()

@leaveFullSizeMode = () ->
  console.debug "leaving full-size mode"

  $('.togglesize').removeClass('fullsize').addClass('startsize')

  $('.hide-when-small').css({ display: 'none' })
  $('.hide-when-full').css({ display: 'inherit' })

  webterm.resize()

## click on tips
$('#command').click () ->
  if not $('#commandHiddenText').hasClass('hidden')
    $('#commandHiddenText').addClass("hidden").hide()
    $('#commandShownText').hide().removeClass("hidden").fadeIn()

  #logEventata = { type: EVENT_TYPES.peek }
  data = { type: EVENT_TYPES.peek }



###
  Navigation amongst the questions
###


current_question = 0
next = (which) ->
  # before increment clear style from previous question progress indicator
  $('#marker-' + current_question).addClass("complete").removeClass("active")

  if not which and which != 0
    current_question++
  else
    current_question = which

  questions[current_question]()
  results.clear()
  @webterm.focus()

  if not $('#commandShownText').hasClass('hidden')
    $('#commandShownText').addClass("hidden")
    $('#commandHiddenText').removeClass("hidden").show()

  # enable history navigation
  history.pushState({}, "", "#" + current_question);
  data = { 'type': EVENT_TYPES.next }
  #logEvent(data)

  # change the progress indicator
  $('#marker-' + current_question).removeClass("complete").addClass("active")

  $('#question-number').find('text').get(0).textContent = current_question

  # show in the case they were hidden by the complete step.
  $('#instructions .assignment').show()
  $('#tips, #command').show()


  return

previous = () ->
  current_question--
  questions[current_question]()
  results.clear()
  @webterm.focus()
  return

  # hide the other(then basic) div from showing, address issue #7.
clearOtherDiv = () ->
  $('#advanced').hide()
  $('#triggers').hide()
  $('#rules').hide()
  $('#packages').hide()
  $('#mobilesdk').hide()
  return



results = {
  set: (htmlText, intermediate) ->
    if intermediate
      console.debug "intermediate text received"
      $('#results').addClass('intermediate')
      $('#buttonNext').hide()
    else
      $('#buttonNext').show()

    window.setTimeout ( () ->
      $('#resulttext').html(htmlText)
      $('#results').fadeIn()
      $('#buttonNext').removeAttr('disabled')
    ), 300

  clear: ->
    $('#resulttext').html("")
    $('#results').fadeOut('slow')
#    $('#buttonNext').addAttr('disabled')
}



###
  Transform question objects into functions
###

buildfunction = (q) ->
  _q = q
  return ->
    console.debug("function called")

    $('#instructions').hide().fadeIn()
    $('#instructions .text').html(_q.html)
    $('#instructions .assignment').html(_q.assignment)
    $('#tipShownText').html(_q.tip)
    if _q.command_show
      $('#commandShownText').html(_q.command_show.join(' '))
    else
      $('#commandShownText').html(_q.command_expected.join(' '))

    if _q.finishedCallback?
      window.finishedCallback = q.finishedCallback
    else
      window.finishedCallback = () -> return ""

    window.immediateCallback = (input, stop) ->
      if stop == true # prevent the next event from happening
        doNotExecute = true
      else
        doNotExecute = false

      if doNotExecute != true
        console.log (input)

        data = { 'type': EVENT_TYPES.command, 'command': input.join(' '), 'result': 'fail' }

        # Was like this:  if not input.switches.containsAllOfThese(_q.arguments)
        if input.containsAllOfTheseParts(_q.command_expected)
          data.result = 'success'

          setTimeout( ( ->
            @webterm.disable()
            $('#buttonNext').focus()
          ), 1000)

          results.set(_q.result)
          console.debug "contains match"
        else
          console.debug("wrong command received")

        # call function to submit data
        #logEvent(data)
      return

    window.intermediateResults = (input) ->
      if _q.intermediateresults
        results.set(_q.intermediateresults[input](), intermediate=true)
    return

statusMarker = $('#progress-marker-0')
progressIndicator = $('#progress-indicator')
leftside = $('#leftside')

tutorialTop = $('#tutorialTop')
advancedTag = $('#advancedTag')

window.switchToBasic = switchToBasic = () ->
  questions = []
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#26343f" }, 1000 )
  tutorialTop.animate({ backgroundColor: "rgb(59, 74, 84)" }, 1000 )
  clearOtherDiv()
  stepNumber = 0
  for step in q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")
    stepNumber++
  drawStatusMarker('ADV')

  next(0)


window.switchToTriggers = switchToTriggers = () ->
  window.advancedTut = false
  questions = []
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#26343f" }, 1000 )
  tutorialTop.animate({ backgroundColor: "rgb(59, 74, 84)" }, 1000 )
  advancedTag.fadeOut()
  clearOtherDiv()
  stepNumber = 0
  for step in trigger_q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")  
    stepNumber++

  next(0)

window.switchToRules = switchToRules = () ->
  window.advancedTut = false
  questions = []
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#26343f" }, 1000 )
  tutorialTop.animate({ backgroundColor: "rgb(59, 74, 84)" }, 1000 )
  advancedTag.fadeOut()
  clearOtherDiv()
  stepNumber = 0
  for step in rlz_q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")  
    stepNumber++

  next(0)

window.switchToPackages = switchToPackages = () ->
  window.advancedTut = false
  questions = []
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#26343f" }, 1000 )
  tutorialTop.animate({ backgroundColor: "rgb(59, 74, 84)" }, 1000 )
  advancedTag.fadeOut()
  clearOtherDiv()
  stepNumber = 0
  for step in pkg_q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")  
    stepNumber++

  # go to first question
  next(0)

window.switchToMobileSDK = switchToMobileSDK = () ->
  window.advancedTut = false
  questions = []
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#26343f" }, 1000 )
  tutorialTop.animate({ backgroundColor: "rgb(59, 74, 84)" }, 1000 )
  advancedTag.fadeOut()
  clearOtherDiv()
  stepNumber = 0
  for step in mob_q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")  
    stepNumber++

  next(0)

window.switchToAdvanced = switchToAdvanced = () ->
  questions = []
  window.advancedTut = true
  statusMarker.prevAll('span').remove()
  statusMarker.nextAll('span').remove()
  leftside.animate({ backgroundColor: "#543B3B" }, 1000 )
  tutorialTop.animate({ backgroundColor: "#3F2626" }, 1000 )
  advancedTag.fadeIn()

  marker = statusMarker.clone()
  marker.prependTo(progressIndicator)
  marker.title = 'Go back to the Basic Tutorial'

  marker.attr("id", "marker-" + 'BSC')
  marker.find('text').get(0).textContent = '←'
  marker.click( ->switchToBasic() )
  marker.removeClass("active")
  clearOtherDiv()
  stepNumber = 0
  for step in adv_q
    questions.push(buildfunction(step))
    drawStatusMarker(stepNumber)
    if stepNumber > 0
      $('#marker-' + stepNumber).removeClass("active").removeClass("complete")
    else
      $('#marker-' + stepNumber).removeClass("complete").addClass("active")  
    stepNumber++

  next(0)

window.next = next = (which) ->
  # before increment clear style from previous question progress indicator
  $('#marker-' + current_question).addClass("complete").removeClass("active")
  if which is 'ADV'
    switchToAdvanced()
  else if which is '←'
    switchToBasic()
  else if not which and which != 0
    current_question++
    if current_question is questions.length
      next('ADV')
  else
    current_question = which

  questions[current_question]()
  results.clear()
  @webterm.focus()

  if not $('#commandShownText').hasClass('hidden')
    $('#commandShownText').addClass("hidden")
    $('#commandHiddenText').removeClass("hidden").show()
  if window.advancedTut is true
    history.pushState({}, "", "#" + current_question + "-ADV")
    window.location.hash = "#" + current_question + "-ADV"
  else
    history.pushState({}, "", "#" + current_question)
    window.location.hash = "#" + current_question
  data = { 'type': EVENT_TYPES.next }
  $('#marker-' + current_question).removeClass("complete").addClass("active")
  $('#question-number').find('text').get(0).textContent = current_question
  $('#instructions .assignment').show()
  $('#tips, #command').show()


  return

drawStatusMarker = (i) ->
  if i == 0
    marker = statusMarker
  else
    marker = statusMarker.clone()
    marker.appendTo(progressIndicator)

  marker.attr("id", "marker-" + i)
  marker.find('text').get(0).textContent = i
  marker.click( -> next(i) )


questionNumber = 0
for question in q
  f = buildfunction(question)
  questions.push(f)
  drawStatusMarker(questionNumber)
  questionNumber++


###
  Initialization of program
###

#load the first question, or if the url hash is set, use that
if (window.location.hash)
  try
    currentquestion = window.location.hash.split('#')[1].toNumber()
#    questions[currentquestion]()
#    current_question = currentquestion
    next(currentquestion)

  catch err
    questions[0]()
else
  questions[0]()

$('#results').hide()
