import { shallowMount } from '@vue/test-utils'
import Jaspioncoin from '@/views/Jaspioncoin.vue'

describe('Jaspioncoin.vue', () => {
  it('renders props.msg when passed', () => {
    const cripto_values = {"jaspion_coin_value": 0}
    const wrapper = shallowMount(Jaspioncoin, {
      propsData: { cripto_values }
    })
    expect(wrapper.text()).toMatch(cripto_values)
  })
})
