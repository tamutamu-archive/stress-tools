### 擬似負荷ツール

#### 制約事項

  - Centos7.2環境以外では使用しないこと。

#### セットアップ

  - `./setup.sh`

#### CPU使用率
  - CPU使用率81%近辺でフォアグラウンド起動
    ```
    ./stress-cpu.sh 81
    ```
  
#### MEMORY
  - メモリ使用率81%近辺でフォアグラウンド起動
    ```
    ./stress-memory.sh 81
    ```
  
#### DISK使用率
  - ディスク使用率が81%になるようにスクリプトと同階層に`./tempfile`を作成。
    ```
    ./stress-disk-space.sh.sh 81`
    
    ls tempfile
    -------------
    tempfile
    --------
    ```
