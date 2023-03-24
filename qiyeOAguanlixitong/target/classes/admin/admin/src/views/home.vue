<template>
<div class="content">
  <div class="home">
    <el-row>
      <el-col :span="24">
        <el-card :shadow="shadow"  >
          <div class="block-text-center" m="t-4">
            <div class="demonstration" >欢迎使用TANSCI-CRM客户关系管理系统</div>
            <el-carousel trigger="click" height="280px">
              <el-carousel-item v-for="item in  carouselList" :key="item">
                <el-image :src="item"  fit="fill"></el-image>
              </el-carousel-item>
            </el-carousel>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6">
        <div class="home-header" :shadow="shadow" style="margin-top: 10px">
          <el-card class="home-header-greetings" >
            <div class="greetings-text">您好 {{username}} ！祝您新的一天工作愉快。</div>
            <div class="greetings-weather">今天阴天，-8~10° 较冷，注意加衣</div>
          </el-card>
          <el-card class="home-header-todo">
            <div v-for="todo in todoList" :key="todo">
              <div class="todo-title">
                <el-icon :color="todo.color" style="vertical-align: middle;">
                  <component :is="todo.icon"></component>
                </el-icon>
                <span style="vertical-align: center">{{todo.name}}</span>
              </div>
              <div class="todo-num">{{todo.untreated}}/{{todo.total}}</div>
            </div>
          </el-card>
        </div>
      </el-col>
      <el-col :span="18">
        <div class="home-main-card">
          <el-card v-for="(card,index) in cards" :key="index" :shadow="shadow" :style="{marginTop:'6px', padding: '2rem 0'}">
            <div class="main-card-value">
              <el-icon :color="card.color" >
                <component :is="card.icon"></component>
              </el-icon>
              <span class="card-value-num">{{card.total}}</span>
              <span class="card-value-ratio">, {{card.ratio}}%</span>
            </div>
            <div class="main-card-text">{{card.name}}</div>
          </el-card>
        </div>
      </el-col>
    </el-row>
      <div class="home-main-chart" style="margin-top: 10px">
        <div class="chart-left" >
          <el-card :shadow="shadow" >
            <div id="myColumnar" style="height:500px;"></div>
          </el-card>
        </div>
        <div class="chart-right" >
          <el-card :shadow="shadow">
            <div id="myPie" style="height:500px;"></div>
          </el-card>
        </div>
      </div>
  </div>
</div>
</template>
<script>
import router from '@/router/router-static'
import * as echarts from 'echarts'
export default {
  data(){

    return{
      todoList : [
        {name:'待办事项',total:100,untreated:28,icon:'Bell',color:'#f56c6c'},
        {name:'待办事项',total:84,untreated:78,icon:'ChatDotSquare',color:'#0084ff'},
        {name:'待办事项',total:25,untreated:21,icon:'Warning',color:'#63ba4d'},
        {name:'待办事项',total:12,untreated:5,icon:'Edit',color:'#006000'},
      ],
      cards : [
        {name:'待确定指标一',total:1542,ratio:98,icon:'AddLocation',color:'#006000'},
        {name:'待确定指标二',total:542,ratio:88,icon:'Coin',color:'#f56c6c'},
        {name:'待确定指标三',total:8562,ratio:86,icon:'Collection',color:'#0084ff'},
        {name:'待确定指标四',total:1458,ratio:54,icon:'HelpFilled',color:'#63ba4d'},
        {name:'待确定指标无',total:2561,ratio:90,icon:'Histogram',color:'#67C23A'},
        {name:'待确定指标六',total:5782,ratio:87,icon:'Microphone',color:'#E6A23C'},
      ],

    }
  },
  mounted(){
    this.init();
    const noColumnar = () =>{
      let myColumnar = echarts.init(document.getElementById("myColumnar"));
      myColumnar.setOption({
        legend: {},
        tooltip: {},
        color: ['#bdc3c7', '#2c3e50', '#242e42'],
        dataset: {
          dimensions: ['product', '2021', '2020', '2019'],
          source: [
            ['1月', 43.3, 85.8, 93.7 ],
            ['2月', 83.1, 73.4, 55.1 ],
            ['3月', 86.4, 65.2, 82.5 ],
            ['4月', 72.4, 53.9, 39.1 ],
            ['5月', 72.4, 53.9, 39.1 ],
            ['6月', 72.4, 53.9, 39.1 ],
            ['7月', 72.4, 53.9, 39.1 ],
            ['8月', 72.4, 53.9, 39.1 ],
            ['9月', 72.4, 53.9, 39.1 ],
            ['10月', 72.4, 53.9, 39.1 ],
            ['11月', 72.4, 53.9, 39.1 ],
            ['12月', 72.4, 53.9, 39.1 ],
          ]
        },
        xAxis: {
          type: 'category',
          axisTick: {
            show: false // 不显示坐标轴刻度线
          },
        },
        yAxis: {
          show: true, // 不显示坐标轴线、坐标轴刻度线和坐标轴上的文字
          axisTick: {
            show: false // 不显示坐标轴刻度线
          },
          axisLine: {
            show: false // 不显示坐标轴线
          },
          splitLine: {
            show: true // 不显示网格线
          },
        },
        series: [
          {type: 'bar'},
          {type: 'bar'},
          {type: 'bar'}
        ]
      });
      window.onresize = function () {
        myColumnar.resize();
      };
    }
    const noPie = () =>{
      let myPie = echarts.init(document.getElementById("myPie"));
      myPie.setOption({
        title: {},
        legend: {},
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c}￥ ({d}%)'
        },
        color: ['#94716B', '#6C5B7B', '#355C7D'],
        series: [
          {
            name: '渠道',
            type: 'pie',
            radius: '90%',
            avoidLabelOverlap: false,
            roseType: 'radius',
            center: ['50%', '50%'],
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label:{
              show: true,
              position: 'inner'
            },
            labelLine: {
              show:false
            },
            data: [
              {value: 335, name: '指标一'},
              {value: 310, name: '指标二'},
              {value: 274, name: '指标三'},
            ].sort(function (a, b) {
              return a.value - b.value;
            })
          }
        ]
      });
      window.onresize = function () {
        myPie.resize();
      };
    }

  },
  methods:{
    init(){
        if(this.$storage.get('Token')){
        this.$http({
            url: `${this.$storage.get('sessionTable')}/session`,
            method: "get"
        }).then(({ data }) => {
            if (data && data.code != 0) {
            router.push({ name: 'login' })
            }
        });
        }else{
            router.push({ name: 'login' })
        }
    }
  }
};
</script>

<style lang="scss" scoped>
.content {
  flex-direction: column;
  width: 100%;
  height: 100%;
  min-height: 500px;
  text-align: center;
  .home{
    .home-header-greetings{
      height: 100%;
      margin-right: auto;
    }
  }
  .main-text{
    font-size: 38px;
    font-weight: bold;
    margin-top: 15%;
  }
  .text {
    font-size: 24px;
    font-weight: bold;
    color: #333;
  }
}
</style>