$(function(){
	pieChart();
})

function pieChart(){
	
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('chartmain'));
	function fetchData(cb) {
	    // 通过 setTimeout 模拟异步加载
	    setTimeout(function () {
	        cb({
	            categories: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"],
	            data: [5, 20, 36, 10, 10, 20]
	        });
	    }, 1000);
	}

	// 初始 option
	option = {
	    title: {
	        text: '类型销售统计'
	    },
	    tooltip: {},
	    legend: {
	        data:['销量']
	    },
	    xAxis: {
	        data: []
	    },
	    yAxis: {},
	    series: [{
	        name: '销量',
	        type: 'bar',
	        data: []
	    }]
	};
	
	var url = "../record/pieChart.action";
	var date = null;
	$.post(url,date,function(mes){
			myChart.setOption({
		        xAxis: {
		            data: mes.name
		        },
		        series: [{
		            // 根据名字对应到相应的系列
		            name: '销量',
		            data: mes.count
		        }]
		    });
	},"json")


	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
}
