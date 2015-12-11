#= require cable

@App = {}
App.cable = Cable.createConsumer window.appCableUrl
