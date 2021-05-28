export default function webSocket() {
  var supportsWebSockets = 'WebSocket' in window || 'MozWebSocket' in window
  
  if (supportsWebSockets) {
    var ws = new WebSocket("ws://localhost:5000")
    
    ws.onopen = function () {
      console.log("open ws")
    }
    ws.onmessage = function (evt) {
      var received_msg = evt.data
      console.log(received_msg)
      return received_msg
    }
    ws.onclose = function () {
      console.log("Connection is closed...")
    }
  } else {
    alert("WebSocket NOT supported by your Browser!")
  }
}