# Terraform Import Demo

`terraform import` を使って、手動作成したAWSリソースをTerraformの管理下に置くデモリポジトリです。

## 構成

```
terraform/
├── main.tf          # provider 設定
├── backend.tf       # バックエンド設定
├── vpc.tf           # VPC（自動生成を使う方法でインポート）
└── vpc_subnet.tf    # サブネット（手動で書く方法でインポート）
```

## 手順

### 1. 初期化

```bash
cd terraform
terraform init
```

### 2. VPCをインポート【自動生成を使う方法】

```bash
# imports.tf に import ブロックを書いてから実行
terraform plan "-generate-config-out=vpc.tf"

# vpc.tf を整理したあと apply
terraform apply

# インポート完了後は imports.tf を削除
rm imports.tf
```

### 3. サブネットをインポート【手動で書く方法】

```bash
# vpc_subnet.tf にスケルトンを書いてから実行
terraform import aws_subnet.public <subnet-id>

# state の内容を確認して vpc_subnet.tf を書き直す
terraform show

# 差分ゼロを確認
terraform plan
```

## 参考

詳細な手順・解説は [Qiita記事](https://qiita.com/) を参照してください。
