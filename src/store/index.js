import Vue from 'vue'
import Vuex from 'vuex'
import criptomoedas from './modules/criptomoedas'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    criptomoedas
  }
})
