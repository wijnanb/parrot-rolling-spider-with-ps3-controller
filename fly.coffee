DualShock = require('dualshock-controller')
RollingSpider = require("rolling-spider")
temporal = require("temporal")

drone = new RollingSpider
  logger: console.log
  forceConnect: false

drone.disconnect()
console.log ' - connecting to drone'
drone.connect ->
  console.log ' - connected'
  drone.setup ->
    console.log ' - connected and setup'
    drone.startPing()



takeoff = ->
  console.log ' - takeoff'
  try
    drone.flatTrim()
    drone.startPing()
    drone.takeOff()
  catch e
    console.error e

land = ->
  console.log ' - land'
  try
    drone.land()
  catch e
    console.error e
  

forward = ->
  console.log ' - forward'
  drone.forward()


controller = DualShock
  config : "dualShock3",
  accelerometerSmoothing : true,
  analogStickSmoothing : false
    
controller.on 'error', (data) ->
  console.log 'error', data

controller.on 'connected', (data) ->
  console.log 'connected', data
  
controller.on 'x:press', (data) ->
  console.log 'x:press', data
  land()

controller.on 'triangle:press', (data) ->
  console.log 'triangle:press', data
  takeoff()

controller.on 'start:press', (data) ->
  console.log 'start:press', data

controller.on 'left:move', (data) ->
  console.log 'left:move', data

controller.on 'right:move', (data) ->
  console.log 'right:move', data

#controller.connect()

