import co2meter as co2
import os

# 現在のスクリプトが置かれているディレクトリを取得
script_dir = os.path.dirname(os.path.abspath(__file__))

# CO2.txtの出力先ディレクトリを指定（相対パスで ..\Env に設定）
output_dir = os.path.join(script_dir, '..', '..', '..', 'Env')

# 出力ディレクトリが存在しない場合は作成
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# 出力ファイルのパスを指定
output_file = os.path.join(output_dir, 'CO2.txt')

# CO2データを読み取る
mon = co2.CO2monitor()
data = mon.read_data()

# CO2値（データの2番目の値）を取得
co2_value = data[1]

# CO2値のみをファイルに出力する
with open(output_file, 'w') as f:
    f.write(str(co2_value))