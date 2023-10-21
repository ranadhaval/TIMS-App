import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';

class EvaluationProgressIndicator extends StatelessWidget {
  EvaluationProgressIndicator(
      {required this.height,
      required this.value,
      super.key,
      required this.rf,
      required this.startColor,
      required this.endColor});
  double height;
  double value;
  double rf;
  Color startColor;
  Color endColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .2,
      child: SfRadialGauge(axes: [
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: rf,
          canScaleToFit: false,
          axisLineStyle: AxisLineStyle(
            thickness: 0.15,
            color: AppTheme.colorProgressBg,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothFlat,
          ),
          pointers: <GaugePointer>[
            RangePointer(
                value: value,
                width: 0.15,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
                gradient: SweepGradient(
                    colors: <Color>[startColor, endColor],
                    stops: const <double>[0.25, 0.75])),
          ],
          annotations: [
            GaugeAnnotation(
                positionFactor: 0.0,
                angle: 90,
                widget: Text(
                  '${value.round()}%',
                  style:
                      TextStyle(fontSize: Constant.TRAININGLEADINGTEXTSIZE.sp),
                ))
          ],
        ),
      ]),
    );
  }
}
