<template>
  <main>
    <h1>API Browser</h1>
    <p>Translation sets APIをブラウザから実行します。</p>
    <div id="manual" class="container">
      <div class="row">
        <h3>使い方</h3>
        <button
          class="btn btn-primary"
          type="button"
          data-toggle="collapse"
          data-target="#collapse"
          aria-expanded="false"
          aria-controls="collapseExample"
        >使い方を見る</button>
      </div>
      <div id="collapse" class="row collapse">
        <div class="alert alert-warning" role="alert">
          <span class="badge badge-secondary">Notice</span>
          取り急ぎPOSTだけです。GETは未実装です。
        </div>
        <ol>
          <li>Project Tokenを入れてください</li>
          <li>
            API Tokenを入れてください
            <br />
            <span class="badge badge-secondary">Tips</span>
            事前に
            <code>Generate API token</code>を有効にし、WOVNプロジェクト設定の「セキュリティ」より生成します
          </li>
          <li>
            Methos、Endpointを入力します。デフォルトではPOST、
            <code>/v0/translation_sets</code>がセットされています
          </li>
          <li>
            Request bodyの
            <code>translation_sets_id</code>に
            <b>好きなID</b>を入力します
          </li>
          <li>
            Request bodyの
            <code>term pairs</code>にIDと元言語テキストをカンマ区切りで入れます
            <p>例</p>
            <pre>
              <code>
                id001,テスト
                hoge001,こんにちは
              </code>
            </pre>
            <span class="badge badge-secondary">Tips</span>
            idは好きな値を入力します。適当に生成してください。
          </li>
          <li>
            <code>Run API</code>でAPIを実行します。右側のエリアにステータスコードとメッセージが出力されます。
          </li>
        </ol>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <ApiForm class="col-md-7 col-sm-12" v-on:onCalledApi="onCalledApi" />
        <div id="output" class="col-md-5 col-sm-12">{{ output }}</div>
      </div>
    </div>
    <div class="alert alert-warning" role="alert">
      <span class="badge badge-secondary">CAUTION</span>
      ChromeはCORS制約が厳しい為、Safariをサポートしています。
      <br />Safariで必要な事前準備は
      <a href="https://qiita.com/kai_kou/items/54b61a274b77977add54">こちら</a>を参照
    </div>
  </main>
</template>

<script>
import ApiForm from "@/components/organizms/ApiForm.vue";
export default {
  name: "ApiBrowser",
  data: function() {
    return {
      output: ""
    };
  },
  props: {
    msg: String
  },
  components: {
    ApiForm
  },
  methods: {
    onCalledApi(response) {
      if (response == null || response === undefined) return;
      console.log(response);
      this.output = [`status code: ${response.status}`, response.data];
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
a {
  color: #42b983;
}
h3 {
  margin-right: 2em;
}

#manual {
  text-align: left;
  margin-bottom: 2em;
}
#manual pre {
  background-color: #dfdfdf;
  border-radius: 10px;
}

#output {
  background-color: #dddddd;
  border-radius: 10px;
  overflow: auto;
  text-align: left;
}
</style>