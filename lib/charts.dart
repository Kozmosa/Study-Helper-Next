/// Horizontal bar chart with bar label renderer example and hidden domain axis.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ScoresHorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  ScoresHorizontalBarLabelChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }
}

class ScorePieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ScorePieChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList, animate: animate);
  }
}

/// Sample ordinal data type.
class SubjectScores {
  final String subjectName;
  final double realScore;
  final double fullScore;

  SubjectScores(this.subjectName, this.realScore, this.fullScore);
}

List<charts.Series<SubjectScores, String>> CreateSeries(
    List<SubjectScores> data) {
  return [
    new charts.Series<SubjectScores, String>(
        id: 'Scores',
        domainFn: (SubjectScores scores, _) => scores.subjectName,
        measureFn: (SubjectScores scores, _) =>
        (scores.realScore / scores.fullScore * 100).round(),
        data: data,
        labelAccessorFn: (SubjectScores scores, _) =>
            '${scores.subjectName}: ${(scores.realScore / scores.fullScore * 100).toStringAsFixed(2)}')
  ];
}
// Addtional Functions
CreateChart(type, series) {
  var chart;
  if(type == 'Bar') {
    chart = new charts.BarChart(
      series,
      animate: true,
    );
    chart = new ScoresHorizontalBarLabelChart(
      series,
      animate: true,
    );
  }else if(type == 'Pie') {
    chart = new charts.PieChart(
      series,
      animate: true,
    );
  } else {}
  var chartWidget = new Padding(
    padding: new EdgeInsets.all(32.0),
    child: new SizedBox(
      height: 500.0,
      child: chart,
    ),
  );
  return chartWidget;
}