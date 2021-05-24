<template>
  <b-button size="sm" variant="outline-secondary">{{ textButton }}</b-button>
</template>

<script>
export default {  
  name: 'Button',
  props: {
    textButton: String
  }
}
</script>
