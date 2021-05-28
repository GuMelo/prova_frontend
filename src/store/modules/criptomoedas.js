const criptomoedas = {
  namespaced: true,
  state: {
    jaspion_coin: [],
    jiban_coin: [],
    jiraya_coin: []
  },
  mutations: {
    SET_CRIPTO(state, data) {
      if(data.criptomoedas === 'jaspion_coin_value'){
        state.jaspion_coin = data.criptomoedas
      } else if(data.criptomoedas === 'jiban_coin_value') {
        state.jiban_coin = data.criptomoedas
      } else if(data.criptomoedas === 'jiraya_caoin_value') {
          state.jiraya_coin = data.criptomoedas
      }
    }
  },
  getters: {
    // jaspion_coin: (state, data) => {
    //   for(var key of Object.keys(data)){
    //     console.log('Entrou aqui')
    //     if(key === "jaspion_coin_value") {
    //       state = data.criptomoedas
    //     }
    //   }
    //   // if(data.criptomoedas === 'jaspion_coin_value'){
    //   //   return data
    //   // }
    // }
  },
  actions: {
    loadCriptos({commit}) {
      var supportsWebSockets = 'WebSocket' in window || 'MozWebSocket' in window
      if (supportsWebSockets) {
        var ws = new WebSocket("ws://localhost:5000")
        
        ws.onopen = function () {
          console.log("open ws")
        }
        ws.onmessage = function (evt) {
          var received_msg = (evt.data != 'OK' ? JSON.parse(evt.data) : '')
          // console.log("RECEBENDO DADOS DAS CRIPTOMOEDAS", received_msg)
          commit('SET_CRIPTO', received_msg)
        }
        ws.onclose = function () {
          console.log("Connection is closed...")
        }
      } else {
        alert("WebSocket NOT supported by your Browser!")
      }
    }
  }
}

export default criptomoedas
