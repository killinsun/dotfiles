<template>
  <input
    type="text"
    class="form-control"
    :id="inputId"
    v-model="updateValue"
    :placeholder="placeholder"
  />
</template>
<script>
  export default {
    name: 'vInputText',
    props: {
      inputId: {
        required: true
      },
      placeholder: {
        required: false
      },
      value: {
        require: true
      }
    },
    computed: {
      updateValue: {
        get() {
          return this.value
        },
        set(val) {
          this.$emit('update:value', val)
        }
      }
    }
  }
</script>