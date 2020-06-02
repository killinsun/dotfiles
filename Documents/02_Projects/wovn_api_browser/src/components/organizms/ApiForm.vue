<template>
  <div class="container">
    <form>
      <FormText
        inputId="projectToken"
        label="Project Token"
        inputTagSize="col-md-3"
        :value.sync="projectToken"
        placeholder="Project Token"
      />
      <FormText
        inputId="apiToken"
        label="API Token"
        :value.sync="apiToken"
        placeholder="API Token"
      />
      <fieldset class="form-group">
        <div class="row">
          <legend class="col-form-label col-md-2 pt-0">Methods</legend>
          <div class="col-md-1 col-sm-12">
            <select v-model="methods">
              <option disabled value>HTTP METHOD:</option>
              <option disabled>GET</option>
              <option>POST</option>
            </select>
          </div>
        </div>
      </fieldset>
      <FormText inputId="endpoint" label="Endpoint" :value.sync="endpoint" />
      <div class="form-group row">
        <div class="col-md-2">Request body</div>
        <div class="col-md-10 row">
          <FormText
            inputId="translationSetsId"
            label="translation_sets Id"
            inputTagSize="col-md-8"
            class="col-md-12 row"
            :value.sync="translationSetsId"
            placeholder="translation_sets Id"
          />
          <div class="row col-md-10">
            <div class="col-md-3">
              term pairs
              <br />[id,src]
            </div>
            <div class="col-md-9 row">
              <textarea
                v-model="termPairs"
                class="form-control"
                placeholder="example: id001,こんにちは"
              />
            </div>
          </div>
        </div>
      </div>
      <div class="form-group row">
        <div class="col-md-12">
          <button type="button" class="btn btn-primary" @click="runApi">Run API</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import FormText from "@/components/molecules/FormText.vue";
import axios from "axios";

export default {
  name: "ApiForm",
  components: {
    FormText
  },
  data: function() {
    return {
      response: "",
      projectToken: "",
      apiToken: "",
      endpoint: "/v0/translation_sets",
      translationSetsId: "",
      termPairs: "",
      methods: "POST"
    };
  },
  mounted() {
    if(localStorage.apiToken){
      this.apiToken = localStorage.apiToken
    }
    if(localStorage.projectToken){
      this.projectToken = localStorage.projectToken
    }
  },
  methods: {
    /*
    * parseCsvData
    * テキストエリアの値を[ { "id": foo, "src": bar}, {}, ...]のような形式に変換します
    * ダブルクォーテーション等の検査はしていない為、
    * カンマ区切りである事、改行されている事を期待値としています。
    */
    parseCsvData(){
      const termPairsArray = this.termPairs.split(/\r\n|\n/)
      const keyValueTermsArray = new Array(termPairsArray.length)
      for(let i=0; i <termPairsArray.length; i++){
        if(termPairsArray[i] === "") continue;

        const splitedTerms = termPairsArray[i].split(',')
        keyValueTermsArray[i] = {
          "id": splitedTerms[0],
          "src": splitedTerms[1]
        }
      }
      return keyValueTermsArray
    },

    /*
    * runAPI
    * this.endpoint へHTTPリクエストを送信します。
    * レスポンスを受け取って 親コンポーネントに投げます。
    * ついでに入力していたapiTokenとprojectTokenも保存します
    */
    runApi: async function() {

      const keyValueTermsArray = this.parseCsvData()
      localStorage.apiToken = this.apiToken
      localStorage.projectToken = this.projectToken

      console.log(this.projectToken, this.apiToken, this.endpoint)
      const headers = {
        "Authorization": `Token token=${this.apiToken}`,
        "Content-Type": "application/json; charset=utf-8"
      } 
      const data = {
        "project_token": this.projectToken,
        "translation_sets": [
          {
            "id": this.translationSetsId,
            "terms": keyValueTermsArray
          }
        ]
      }

      // send a http request
      try {
        this.response = await axios({
          method: this.methods,
          url: 'https://api.wovn.io' + this.endpoint,
          headers: headers,
          data: data
        })
      } catch (e) {
        this.response = e.response
      }
      this.termPairs = ''

      this.$emit("onCalledApi", this.response);
    }
  }
};
</script>

<style scoped>
container {
  text-align: left;
}

textarea {
  overflow: scroll;
  white-space: pre;
  overflow-wrap: normal;
  overflow-x: auto;
}
</style>