## Домашнее задание к занятию 15.3 "Контексты безопасности. Менеджеры секретов".


### Задание 1. Организация шифрования содержимого S3-бакета.

- Используя конфигурации, выполненные в рамках ДЗ на предыдущем занятии, добавить к созданному ранее bucket S3 возможность шифрования Server-Side, используя общий ключ;
- Включить шифрование SSE-S3 bucket S3 для шифрования всех вновь добавляемых объектов в данный bucket

Манифест с шифрованием SSE-S3: [bucket.tf](https://github.com/murzinvit/15.3_security/blob/8010328e9f21eea04ad77677345cdc2397c427a3/yandex/bucket.tf) </br>

![](https://github.com/murzinvit/screen_1/blob/46408a3cdc9300befac3fa1e73f1befdde9fcf0c/YC_key.jpg) </br>

![](https://github.com/murzinvit/screen_1/blob/7e24e0e93f8907ff7301989f366136a942c519e5/YC_encrypts_bucket.jpg) </br>

---

### Задание 2*. Создание сертификата SSL и применение его к ALB.

- Создать сертификат с подтверждением по email;
- Сделать запись в Route53 на собственный поддомен, указав адрес LB;
- Применить к HTTPS запросам на LB созданный ранее сертификат.

---
worknotes: </br>
https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket </br>
