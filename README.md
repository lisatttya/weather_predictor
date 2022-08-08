# Weather Predictor
It is an implementation of random forest model on FPGA. We created random forest model to estimate the weather
based on some information (precipitation, temperature, etc), then let FPGA guess the weather.
FPGA開発ボードを用いてランダムフォレストの計算処理を高速に行ったものです．入力にある日の天気パラメータ（最高気温、最低気温、降水量、風速）を、
出力はFPGAが推測した天気となっており、正解の天気との比較をFPGA上で行うことができます。

## Dependency
- Verilog HDL
- Python

## Authors
- Yuka Ikegami
- Lisa Zhai

## Further Information
この制作物は授業の一環で作成したものであり，授業スライドを参照しています。
