<template>
  <div><!-- 반드시 최상위 div로 둘러싸여 있어야 한다. -->
    <h3>문자열 바인딩</h3>
    <input type="text" v-model="userId">
  </div>
  <br><hr>
  <h3>이벤트</h3>
  <!-- <button onclick="myFunction()"></button> -->
  <!-- <button v-on="click"></button> -->
  <button @click="myFunction">클릭</button> |
  <button @click="changeData">변경</button>
  <br><hr>
  <h3>숫자 바인딩</h3>
  <input type="text" v-model="num1"> +
  <input type="text" v-model="num2"> =
  <span>{{ num1 + num2 }}</span>
  <br><br>
  <input type="text" v-model.number="num3"> +
  <input type="text" v-model.number="num4"> =
  <span>{{ num3 + num4 }}</span><br>

</template>

<script>
export default {
  data() {
    return {
      userId: 'itwill',
      num1: 0,
      num2: 0,
      num3: 0,
      num4: 0
    }
  },
  methods: {
    myFunction() { // function 생략
      alert(this.userId)
    },
    changeData() {
      this.userId = 'Korea'
    }
  }
}
</script>
