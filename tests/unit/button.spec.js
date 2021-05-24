import { shallowMount } from '@vue/test-utils'
import Button from '@/components/Button.vue'

describe('Button.vue', () => {
  it('renders props.msg when passed', () => {
    const textButton = 'Novo Botão'
    const wrapper = shallowMount(Button, {
      propsData: { textButton }
    })
    expect(wrapper.text()).toMatch(textButton)
  })
})
