<template>
  <div class="content">
    <el-card >
        <div class="block-text-center" m="t-4">
          <div class="demonstration" >欢迎使用TANSCI-CRM客户关系管理系统</div>
          <el-carousel trigger="click" height="280px">
            <el-carousel-item v-for="item in  4" :key="item">
              {{item}}
            </el-carousel-item>
          </el-carousel>
        </div>
      </el-card>
    <el-card style="margin-top: 10px;" >
      <div class="home-header" >
        <div class="home-header-greetings" >
          <svg-icon icon-class="date.svg" class="icon"></svg-icon>
          <div class="greetings-text">您好 {{username}} ！祝您新的一天工作愉快。</div>

          <div class="greetings-weather">今天阴天，-8~10° 较冷，注意加衣</div>
        </div>
        <div class="home-header-todo">
          <div v-for="todo in todoList" :key="todo">
            <div class="todo-title">
              <el-icon :color="todo.color" style="vertical-align: middle;">
                <component :is="todo.icon"></component>
              </el-icon>
              <span style="vertical-align: center">{{todo.name}}</span>
            </div>
            <div class="todo-num">{{todo.untreated}}/{{todo.total}}</div>

          </div>
        </div>
      </div>
    </el-card>
    <div class="home-main">
      <div class="home-main-card">
        <el-card v-for="(card,index) in cards" :key="index" :style="{marginTop:'6px', flex: 1,padding: '2rem 0', marginLeft: index==0?'0':'0.3rem'}">
          <div class="main-card-value">
            <el-icon :color="card.color" style="vertical-align: middle;">
              <component :is="card.icon"></component>
            </el-icon>
            <span class="card-value-num">{{card.total}}</span>
            <span class="card-value-ratio">, {{card.ratio}}%</span>
          </div>
          <div class="main-card-text">{{card.name}}</div>
        </el-card>
      </div>
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
  .block-text-center{
    .demonstration{
      font-size: 25px;
      text-align: center;
      font-weight: bold
    }
  }
  .home-header-greetings{
    .greetings-text{
      font-size: 18px;
      padding-bottom: 0.6rem;
    }
    .greetings-weather{
      font-size: 13px;
      color: var(--t6);
    }


  }
  .home-header{
    display: flex;
    justify-content: space-between;
    padding: 1rem 4rem;

    .home-header-greetings{
      .greetings-text{
        font-size: 18px;
        padding-bottom: 0.6rem;
      }
      .greetings-weather{
        font-size: 13px;
        color: var(--t6);
      }
    }
    .home-header-todo{
      display: flex;
      div{
        padding: 0 0.6rem;
        .todo-title{
          font-size: 14px;
          color: var(--t6);
          padding-bottom: 1rem;
          .el-icon{
            padding-right: 0.2rem;
          }
        }
        .todo-num{
          font-size: 18px;
          font-weight: 700;
          padding-left: 1.6rem;
        }
      }
    }
  }
  .home-main{
    .home-main-card{
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      text-align: center;
      padding: 0.3rem 0;
      .main-card-value{
        font-size: 20px;
        font-weight: 700;
        .card-value-num{
          padding: 0 0.4rem;
          vertical-align: middle;
        }
        .card-value-ratio{
          vertical-align: middle;
        }
      }
      .main-card-text{
        font-size: 14px;
        padding-top: 0.4rem;
        color: var(--t6);
      }
    }
    .home-main-chart{
      display: flex;
      justify-content: space-between;
      .chart-left{
        width: 70%;
        padding-right: 0.3rem;
      }
      .chart-right{
        width: 30%;
        padding-right: 0.3rem;
      }
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