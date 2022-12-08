import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../data.dart';

class IntervalPage extends StatelessWidget {
  IntervalPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Rectangle Interval Element'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Interactive Bar Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- A tooltip and crosshair on selection.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bar colors and shadow elevations change with selection state.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Double tap to clear the selection.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: basicData,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                    ),
                  },
                  elements: [
                    IntervalElement(
                      label: LabelAttr(
                          encoder: (tuple) => Label(tuple['sold'].toString())),
                      elevation: ElevationAttr(value: 0, updaters: {
                        'tap': {true: (_) => 5}
                      }),
                      color: ColorAttr(value: Defaults.primaryColor, updaters: {
                        'tap': {false: (color) => color.withAlpha(100)}
                      }),
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                  selections: {'tap': PointSelection(dim: Dim.x)},
                  tooltip: TooltipGuide(),
                  crosshair: CrosshairGuide(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Transposed Bar Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Uses gradient attribute instead of color.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: basicData,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                    ),
                  },
                  elements: [
                    IntervalElement(
                      label: LabelAttr(
                          encoder: (tuple) => Label(tuple['sold'].toString())),
                      gradient: GradientAttr(
                          value: const LinearGradient(colors: [
                            Color(0x8883bff6),
                            Color(0x88188df0),
                            Color(0xcc188df0),
                          ], stops: [
                            0,
                            0.5,
                            1
                          ]),
                          updaters: {
                            'tap': {
                              true: (_) => const LinearGradient(colors: [
                                    Color(0xee83bff6),
                                    Color(0xee3f78f7),
                                    Color(0xff3f78f7),
                                  ], stops: [
                                    0,
                                    0.7,
                                    1
                                  ])
                            }
                          }),
                    )
                  ],
                  coord: RectCoord(transposed: true),
                  axes: [
                    Defaults.verticalAxis
                      ..line = Defaults.strokeStyle
                      ..grid = null,
                    Defaults.horizontalAxis
                      ..line = null
                      ..grid = Defaults.strokeStyle,
                  ],
                  selections: {'tap': PointSelection(dim: Dim.x)},
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Interval Bar Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Make sure to specify a same scale for all variables in a same dimension.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- With corner radius.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: intervalData,
                  variables: {
                    'id': Variable(
                      accessor: (Map map) => map['id'] as String,
                    ),
                    'min': Variable(
                      accessor: (Map map) => map['min'] as num,
                      scale: LinearScale(min: 0, max: 160),
                    ),
                    'max': Variable(
                      accessor: (Map map) => map['max'] as num,
                      scale: LinearScale(min: 0, max: 160),
                    ),
                  },
                  elements: [
                    IntervalElement(
                      position: Varset('id') * (Varset('min') + Varset('max')),
                      shape: ShapeAttr(
                          value: RectShape(
                              borderRadius: BorderRadius.circular(2))),
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Stacked Bar Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Nested by type.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- With a label in middle of each bar.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Selects tuples with same index but different types.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- A multiple variabes tooltip.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: adjustData,
                  variables: {
                    'index': Variable(
                      accessor: (Map map) => map['index'].toString(),
                    ),
                    'type': Variable(
                      accessor: (Map map) => map['type'] as String,
                    ),
                    'value': Variable(
                      accessor: (Map map) => map['value'] as num,
                      scale: LinearScale(min: 0, max: 1800),
                    ),
                  },
                  elements: [
                    IntervalElement(
                      position:
                          Varset('index') * Varset('value') / Varset('type'),
                      shape: ShapeAttr(value: RectShape(labelPosition: 0.5)),
                      color: ColorAttr(
                          variable: 'type', values: Defaults.colors10),
                      label: LabelAttr(
                          encoder: (tuple) => Label(
                                tuple['value'].toString(),
                                LabelStyle(style: const TextStyle(fontSize: 6)),
                              )),
                      modifiers: [StackModifier()],
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                  selections: {
                    'tap': PointSelection(
                      variable: 'index',
                    )
                  },
                  tooltip: TooltipGuide(),
                  crosshair: CrosshairGuide(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Funnel Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  padding: (_) => const EdgeInsets.all(10),
                  data: basicData,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                      scale: LinearScale(min: -200, max: 200),
                    ),
                  },
                  transforms: [
                    Sort(
                      compare: (a, b) =>
                          ((b['sold'] as num) - (a['sold'] as num)).toInt(),
                    )
                  ],
                  elements: [
                    IntervalElement(
                      label: LabelAttr(
                          encoder: (tuple) => Label(
                                tuple['sold'].toString(),
                                LabelStyle(style: Defaults.runeStyle),
                              )),
                      shape: ShapeAttr(value: FunnelShape()),
                      color: ColorAttr(
                          variable: 'genre', values: Defaults.colors10),
                      modifiers: [SymmetricModifier()],
                    )
                  ],
                  coord: RectCoord(transposed: true, verticalRange: [1, 0]),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Pie Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: basicData,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                    ),
                  },
                  transforms: [
                    Proportion(
                      variable: 'sold',
                      as: 'percent',
                    )
                  ],
                  elements: [
                    IntervalElement(
                      position: Varset('percent') / Varset('genre'),
                      label: LabelAttr(
                          encoder: (tuple) => Label(
                                tuple['sold'].toString(),
                                LabelStyle(style: Defaults.runeStyle),
                              )),
                      color: ColorAttr(
                          variable: 'genre', values: Defaults.colors10),
                      modifiers: [StackModifier()],
                    )
                  ],
                  coord: PolarCoord(transposed: true, dimCount: 1),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Rose Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- With corner radius and shadow elevation.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: roseData,
                  variables: {
                    'name': Variable(
                      accessor: (Map map) => map['name'] as String,
                    ),
                    'value': Variable(
                      accessor: (Map map) => map['value'] as num,
                      scale: LinearScale(min: 0, marginMax: 0.1),
                    ),
                  },
                  elements: [
                    IntervalElement(
                      label: LabelAttr(
                          encoder: (tuple) => Label(tuple['name'].toString())),
                      shape: ShapeAttr(
                          value: RectShape(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      )),
                      color: ColorAttr(
                          variable: 'name', values: Defaults.colors10),
                      elevation: ElevationAttr(value: 5),
                    )
                  ],
                  coord: PolarCoord(startRadius: 0.15),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Stacked Rose Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- A multiple variabes tooltip anchord top-left.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: adjustData,
                  variables: {
                    'index': Variable(
                      accessor: (Map map) => map['index'].toString(),
                    ),
                    'type': Variable(
                      accessor: (Map map) => map['type'] as String,
                    ),
                    'value': Variable(
                      accessor: (Map map) => map['value'] as num,
                      scale: LinearScale(min: 0, max: 1800),
                    ),
                  },
                  elements: [
                    IntervalElement(
                      position:
                          Varset('index') * Varset('value') / Varset('type'),
                      color: ColorAttr(
                          variable: 'type', values: Defaults.colors10),
                      modifiers: [StackModifier()],
                    )
                  ],
                  coord: PolarCoord(),
                  axes: [
                    Defaults.circularAxis,
                    Defaults.radialAxis..label = null,
                  ],
                  selections: {
                    'tap': PointSelection(
                      variable: 'index',
                    )
                  },
                  tooltip: TooltipGuide(
                    anchor: (_) => Offset.zero,
                    align: Alignment.bottomRight,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Race Chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: basicData,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                      scale: LinearScale(min: 0),
                    ),
                  },
                  elements: [
                    IntervalElement(
                      label: LabelAttr(
                          encoder: (tuple) => Label(tuple['sold'].toString())),
                      color: ColorAttr(
                        variable: 'genre',
                        values: Defaults.colors10,
                      ),
                    )
                  ],
                  coord: PolarCoord(transposed: true),
                  axes: [
                    Defaults.radialAxis..label = null,
                    Defaults.circularAxis,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
