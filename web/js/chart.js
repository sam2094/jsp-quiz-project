var data = [];
var labels = [];
var dataMaxCount = 0;
$(function () {
    $.ajax({
        url:"http://localhost:8080/quiz/chart",
        type:"POST",
        dataType:"json",
        success:function (response) {
            for(var i = 0; i<response.length;i++){
                data.push(response[i].data);
                labels.push(response[i].label);
                if(dataMaxCount<response[i].data){
                    dataMaxCount = response[i].data;
                }
            }
            dataMaxCount += 20;
            createChart();
        }
    })
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example

})
function createChart() {
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: data,
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 100,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });

}