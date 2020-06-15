<template>
  <div class="form-group row">
    <label v-bind:for="inputId" class="col-sm-12 col-md-2 col-form-label">{{ label }}</label>
    <div :class="inputTagSize">
      <vInputText
        type="text"
        class="form-control"
        :inputId="inputId"
        :value.sync="updateValue"
        :placeholder="placeholder"
      />
    </div>
  </div>
</template>

<script>
import vInputText from "@/components/atoms/v-InputText.vue";

export default {
  name: "FormText",
  components: {
    vInputText
  },
  props: {
    label: {
      required: false,
      default: "label"
    },
    inputId: {
      required: true
    },
    placeholder: {
      required: false
    },
    inputTagSize: {
      required: false,
      default: "col-sm-9"
    },
    value: {
      required: true
    }
  },
  computed: {
    updateValue: {
      get() {
        return this.value;
      },
      set(val) {
        this.$emit("update:value", val);
      }
    }
  }
};
</script>
