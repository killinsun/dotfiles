<template>
  <div id="app">
    <ApiBrowser />
  </div>
</template>

<script>
import ApiBrowser from "./components/templates/ApiBrowser.vue";

export default {
  name: "app",
  components: {
    ApiBrowser
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
