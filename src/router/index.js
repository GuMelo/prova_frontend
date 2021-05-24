import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home.vue'
import Jaspioncoin from '../views/Jaspioncoin.vue'
import Jibancoin from '../views/Jibancoin.vue'
import Jirayacoin from '../views/Jirayacoin.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/jaspioncoin',
    name: 'Jaspioncoin',
    component: Jaspioncoin
  },
  {
    path: '/jibancoin',
    name: 'Jibancoin',
    component: Jibancoin
  },
  {
    path: '/jirayacoin',
    name: 'Jirayacoin',
    component: Jirayacoin
  }
]

const router = new VueRouter({
  routes
})

export default router
