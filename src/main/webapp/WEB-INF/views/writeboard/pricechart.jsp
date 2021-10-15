<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>부트스트랩 차트그리기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>
    <div class="container">
        <div class="row my-3">
            <div class="col">
                <h4>Bootstrap 4 Chart.js - Chart</h4>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body"> <canvas class="myChart"></canvas> </div>
                    <div class="card-body text-center text-align-center">
                        <h3>Multi</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body"> <canvas class="myChart"></canvas> </div>
                    <div class="card-body text- text-">
                        <h3>Pie</h3>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- 부트스트랩 -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script> <!-- 차트 -->
    <script> const mydata = [10, 20, 30, 40]; const mydataHalf = [5, 10, 20, 7]; // var ctx = document.getElementById("myChart"); var ctx = document.getElementsByClassName("myChart"); var mixedChart = { type: 'bar', labels: ['1', '2', '3', '4'], datasets : [ { label: 'Bar Dataset', data : mydata, backgroundColor: 'rgba(256, 0, 0, 0.1)' }, { label: 'Line Dataset', data: mydataHalf, backgroundColor: 'transparent', borderColor: 'skyblue', type: 'line' } ] }; var myChart = new Chart(ctx, { type: 'bar', data: mixedChart, options: { legend: { display: true } } }); // var myChart = new Chart(ctx, { // type: 'bar', // data: mixedChart, // options: { // legend: { // display: true // } // } // }); </script>
</body>

</html>