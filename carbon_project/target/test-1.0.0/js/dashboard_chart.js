function dashboard_linechart(area_id) { // 대시보드 첫번째 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ["2015년", "2016년", "2017년", "2018년", "2019년", "2020년"],
			datasets: [{
				label: '총배출량',
				data: [1028080, 1802883, 5642567, 4526465, 4342225, 1111129],
				backgroundColor: '#11c4d450',
				borderColor: '#11c4d4',
				borderWidth: 1,
				fill: true, // 3: no fill
				tension: 0,
				datalabels: {
					align: '-115',
					anchor: 'start'
				}
			}],
		},
		options: {
			legend: {
            	display: true,
            	position:'bottom'
        	},
			plugins: {
				datalabels: {
					color: '#D5D5D5',
					font: {
						weight: 'bold'
					},
					padding: 5,
					formatter: function(value, context) {
						let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						return result
					},
				}
			},
			scales: {
				yAxes: [{
					ticks: {
						min: 0,
						maxTicksLimit: 5,
						padding: 20,
						
					},
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
				}],
				xAxes: [{
					ticks: {
						right: 30,
					},
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
				}]
			}
		},
	});
}

function dashboard_barchart(area_id) { // 대시보드 2번째 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["2015년", "2016년", "2017년", "2018년", "2019년", "2020년"],
			datasets: [{
				label: '직접배출',
				data: [917254, 972529, 951253, 1064555, 1032352, 1032323],
				backgroundColor: '#4f11d450',
				borderColor: '#4f11d4',
				borderWidth: 1,
				fill: false,
				barPercentage: 0.5,
			}, {
				label: '간접배출',
				data: [601254, 712529, 751253, 864555, 902352, 962323],
				backgroundColor: '#11d4b750',
				borderColor: '#11d4b7',
				borderWidth: 1,
				fill: false,
				barPercentage: 0.5, // bar 굵기 조절
			}],
		},
		options: {
			legend: {
				display: true,
				position: 'bottom'
			},
			plugins: {
				datalabels: {
					color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 150000;
					},
					font: {
						weight: 'bold'
					},
					formatter: function(value, context) {
						let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						return result
					},
				}
			},
			scales: {
				yAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
					ticks: {
						min: 0,
						maxTicksLimit: 5,
					},
				}],
				xAxes: [{
					stacked: true,
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
				}]
			}
		},
	});
}


function dashboard_d_barchart(area_id) { // 대시보드 3번째 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			labels: ["에너지", "AFOLU", "전력", "페기물"],
			datasets: [
			/*{
				label: '사용량',
				data: [419121, 16606, 27505, 2741112, 20699],
				backgroundColor: 'rgba(255, 99, 132, 0.2)',
				borderColor: 'rgba(255,99,132,1)',
				borderWidth: 1.2,
				fill: false,
				barPercentage: 0.5,
			},*/ 
			{
				label: '배출량',
				data: [837254, 33212, 55010, 548225, 59200],
				backgroundColor: ['#113bd450','#f6c74e50','#113bd450','#f6c74e50'],
				borderColor: ['#113bd4','#f6c74e','#113bd4','#f6c74e'],
				borderWidth: 1.2,
				fill: false,
				barPercentage: 0.5, // bar 굵기 조절
			}],
		},
		options: {
			legend: {
				display: false,
			},
			plugins: {
				datalabels: {
					color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 400000;
					},
					font: {
						weight: 'bold'
					},
					formatter: function(value, context) {
						let result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						return result
					},
				}
			},
			scales: {
				yAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
					ticks: {
						min: 0,
						maxTicksLimit: 3,
					},

				}],
				xAxes: [{
					gridLines: {
						color: "rgba(204, 204, 204,0.1)"
					},
						ticks: {
						min: 0,
						maxTicksLimit: 4,
					},
				}]
			}
		},
	});
}

function dashboard_pie_chart(area_id) { // 대시보드 파이 차트

	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	var ctx = document.getElementById(area_id);
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ["직접배출량", "간접배출량"],
			datasets: [{
				data: [61, 39], //58,42
				backgroundColor: ['#4f11d450', '#11d4b750'],
				borderColor: ['#4f11d4', '#11d4b7'],
			}],
		},
		options: {
			cutoutPercentage: 85,
			legend: {
				//display: false,
			},
			plugins: {
				doughnutlabel: {
					labels: [
						{
							text: 'The title4433434',
							font: {
								size: '60'
							},
							color: 'red'
						},
					]
				},
				datalabels: {
					//display: false,
					color: '#D5D5D5',
					display: function(context) {
						return context.dataset.data[context.dataIndex] > 15;
					},
					font: {
						weight: 'bold'
					},
					formatter: function(value, context) {
						let result = value + "%";
						return result
					},
				},
		
			},
/*			elements: {
				center: {
					text: '12313123131',
					color: 'white',
					fontStyle: 'Helvetica', //Default Arial 
					//sidePadding: 15 //Default 20 (as a percentage) 
				}
			},*/
		},
	});
}