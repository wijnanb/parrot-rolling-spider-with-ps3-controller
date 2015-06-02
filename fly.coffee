dualShock = require('dualshock-controller')

controller = dualShock
  config : "dualShock3",
  accelerometerSmoothing : true,
  analogStickSmoothing : false
    
controller.on 'error', (data) ->
  console.log 'error', data

controller.on 'connected', (data) ->
  console.log 'connected', data
  
controller.on 'x:press', (data) ->
  console.log 'x:press', data

controller.on 'triangle:press', (data) ->
  console.log 'triangle:press', data

controller.on 'start:press', (data) ->
  console.log 'start:press', data

controller.on 'left:move', (data) ->
  console.log 'left:move', data

controller.on 'right:move', (data) ->
  console.log 'right:move', data

controller.connect()