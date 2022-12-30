<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <hr>
  <!-- 1) 데이터 바인딩 -->
  <div>
    <h4 style="color: blue;">**원룸</h4>
    <p>{{ price1 }}만원</p>
  </div>
  <div>
    <h4 :style="style1">**원룸</h4>
    <p>{{ price2 }}만원</p>
  </div>
  <hr>
  <!-- 2) 데이터 바인딩 ( 배열 ) -->
  <div>
    <h4>{{ products[0] }}</h4>
    <p>10 만원</p>
  </div>
  <div>
    <h4>{{ products[1] }}</h4>
    <p>30 만원</p>
  </div>
  <div>
    <h4>{{ products[2] }}</h4>
    <p>50 만원</p>
  </div>
  <hr>
  <!-- 3) 반복문 -->
  <div class="menu">
    <a>Home</a>
    <a>products</a>
    <a>About</a>
  </div>
  <hr>
  <div class="menu">
    <a v-for="m in 3" :key="m">ITWILL</a>
  </div>
  <hr>
  <div class="menu">
    <a v-for="(m,i) in 3" :key="i">{{ i }}</a>
  </div>
  <hr>
  <div class="menu">
    <a v-for="m in menus" :key="m">{{ m }}</a>
  </div>
  <hr>
  <!-- 4) products를 반복문으로 해보자 -->
  <div v-for="(p, i) in products" :key="i">
    <h4>{{ p }}</h4>
    <p>10 만원</p>
  </div>
  <!-- 5) 이벤트 핸들러 -->
  <div>
    <h4>{{ products[0] }}</h4>
    <p>10 만원</p>
    <!-- <button v-on:click="함수명">허위매물신고</button> -->
    <button @click="lieCount++">허위매물신고</button>
    <span>신고수 : {{ lieCount }}</span>
  </div>
  <hr>
  <div>
    <h4>{{ products[1] }}</h4>
    <p>20 만원</p>
    <button @mouseover="lieCount++">허위매물신고</button>
    <span>신고수 : {{ lieCount }}</span>
  </div>
  <hr>
  <!-- 6) 이벤트와 함수 -->
  <div>
    <h4>{{ products[2] }}</h4>
    <p>30 만원</p>
    <button @click="increase">허위매물신고</button>
    <span>신고수 : {{ lieCount }}</span>
  </div>
  <hr>
  <!-- 7) 허위매물신고 각각 동작하기 -->
  <div v-for="(p, i) in products" :key="i">
    <h4>{{ products[i] }}</h4>
    <p>{{i+1}}0 만원</p>
    <button @click="lieCounts[i]++">허위매물신고</button>
    <span>신고수 : {{ lieCounts[i] }}</span>
  </div>
  <hr>
  <!-- 8) 모달창 만들기 -->
  <div>
    <h4 @click="modalwin=true">논현동 원룸</h4>
    <p>300 만원</p>
  </div>
  <div class="black_bg" v-if="modalwin==true">
    <div class="white_bg">
      <h4>상세페이지</h4>
      <p>상세페이지 내용</p>
      <button @click="modalwin=false">닫기</button>
    </div>
  </div>
  <hr>
  <div>
    {{ a }}<br>{{ b }}
  </div>
</template>

<script>
//document.getElementById('아이디명').innerHTML=?? 순수 자바스크립트로 값을 주고나 받는 방식
//$("#아이디명").html(??) jQuery로 값을 주고나 받는 방식

import {apple, apple2} from './assets/oneroom.js'

export default { //내보내는 문법
  name: 'App',
  components: {
  },
  data(){ //변수선언 함수
    return { //json형식으로 key:value
      a : apple,
      b : apple2,
      price1 : 60,
      price2 : 70,
      style1 : 'color:red',
      products : ['역삼동 원룸','천호동 원룸','서초동 원룸'],
      menus : ['HOME','SHOP','ABOUT'],
      lieCount : 0,
      lieCounts : [0, 0, 0],
      modalwin : false
    }
  },
  methods: {
    increase(){
      this.lieCount+=1;
    }
  }
}

</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.menu{
  background: darkslateblue;
  padding: 15px;
  border-radius: 5px;
}

.menu a {
  color: white;
  padding: 10px;
}

body {
  margin: 0;
}

div {
  box-sizing: border-box;
}

.black_bg {
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  --position: fixed;
  padding: 20px;
}

.white_bg {
  width: 100%;
  background: white;
  border-radius: 8px;
  padding: 20px;
}
</style>
