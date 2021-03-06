renderCommitsByContributorsChart = (data) ->
    $("#contributors h3").html(data.length + ' ' + $("#contributors h3").html())
    i = 0
    source   = $("#contributor-template").html()
    template = Handlebars.compile(source)
    for contributor in data
        contributor.i = i
        $("#contributors .thumbnails").append template(contributor)

        $("#chart-" + i).highcharts
          colors: window.chartColors
          chart:
            type: "areaspline"
            zoomType: "x"
          title:
            text: ""
          plotOptions:
            series:
              lineWidth: 1
              marker:
                enabled: false
          xAxis:
            categories: contributor.data.x
            tickInterval: parseInt(contributor.data.x.length / 10)
            labels:
                rotation: -45
                y: 35
          yAxis:
            title:
              text: ""
          series: [
            name: "Commits"
            data: contributor.data.y
          ]
        i++
