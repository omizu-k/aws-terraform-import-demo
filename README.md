# Terraform Import Demo

## 概要

`terraform import` コマンドの実践を目的としたデモリポジトリです。

AWS 上に手動で作成したリソースを Terraform の管理下に取り込む手順を、実際の環境を使って確認します。

## このリポジトリで学べること

- `terraform import` の基本的な使い方
- インポート対象リソースに対応する `.tf` ファイルの書き方
- インポート後の `terraform plan` で差分をゼロにするまでの調整プロセス

## 構成リソース

| リソース | 役割 |
|---|---|
| VPC / サブネット | ネットワーク基盤 |
| Internet Gateway (IGW) | パブリックサブネットのインターネット接続 |
| NAT Gateway | プライベートサブネットからの外向き通信 |
| Application Load Balancer (ALB) | EC2 へのトラフィック振り分け |
| EC2 インスタンス | アプリケーションサーバー（インポート対象） |

## ハンズオンの流れ

1. Terraform で IGW / NAT Gateway / ALB / VPC まわりを作成する
2. EC2 インスタンスは **AWS コンソール（またはCLI）で手動作成** する
3. `terraform import` を使って EC2 を Terraform 管理下に取り込む
4. `terraform plan` の差分をゼロにするよう `.tf` を調整する

## ディレクトリ構成

```
.
├── terraform/          # Terraform コード
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
└── README.md
```

## 前提条件

- Terraform v1.x
- AWS CLI が設定済み（`aws configure` 済み）
- 適切な IAM 権限（EC2 / ELB / VPC 操作権限）

## 注意事項

このリポジトリは学習・デモ目的です。作成したリソースは動作確認後、必ず `terraform destroy` で削除してください（AWS の料金が発生します）。
