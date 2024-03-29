# Grab a loading screen lock
lsLockMoment = LoadScreen.lock()
# Import a script while using the returned Promise to ensure that
# the script has been fully loaded before executing dependent code
cloudflare = "https://cdnjs.cloudflare.com/ajax/libs/"
momentJs = [
  cloudflare + "moment.js/2.24.0/moment.min.js"
  cloudflare + "moment.js/2.24.0/locale/es.js"
  ]
importScripts(momentJs).then(->
  # Code that depends on the script goes here.
  LoadScreen.unlock lsLockMoment
  moment.locale 'es'
  if env == 'staging'
    console.log 'MomentJs cargado'
  return
).catch (err) ->
  # There was an error loading the script, log it to the console.
  console.log err
  return