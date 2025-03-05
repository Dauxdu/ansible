# Базовая настройка серверов с Ansible

Автоматизация базовой настройки серверов на различных дистрибутивах Linux

---

## Основные функции

- **Создание пользователей**
- **Настройка SSH**
- **Настройка Firewall**
- **Настройка NTP**
- **Настройка MOTD**

---

## Поддерживаемые ОС

- Ubuntu
- Debian
- RHEL
- CentOS

---

## Требования

- **Ansible**: На управляющей машине установлен Ansible.
- **Python**: На целевых хостах установлен Python 3.
- **Доступ по SSH**: Доступ к целевым хостам по SSH.

---

## Установка

1. Клонируйте репозиторий:

   ```bash
   git clone https://github.com/dauxdu/ansible.git
   ```

2. Настройте файл `inventory` в корне проекта. Укажите хосты и/или группы.

3. Настройте переменные:

   - Создайте файлы в директории `host_vars` для каждого хоста, указанного в `inventory`, или для группы хостов.
   - Измените значения переменных в `group_vars/all.yml`.

   **Внимание**: Некоторые чувствительные переменные зашифрованы с помощью Ansible Vault. Подробнее о шифровании можно узнать в [официальной документации Ansible](https://docs.ansible.com/ansible/latest/vault_guide/vault_encrypting_content.html).

4. Установите необходимые зависимости:

   - На управляющей машине установите `passlib` для работы с хэшированными паролями:

     ```bash
     pip install passlib
     ```

---

## Использование

```bash
ansible-playbook playbook.yml --ask-vault-pass
```

## Структура проекта

```
ansible-project/
├── group_vars/
│   └── all.yml
├── host_vars/
│   ├── Daring-Bittern.yml
│   └── Fair-Bittern.yml
├── roles/
│   ├── common/
│   │   ├── tasks/
│   │   │   └── main.yml
│   ├── firewall/
│   │   └── tasks/
│   │       └── main.yml
│   ├── motd/
│   │   ├── tasks/
│   │   │   └── main.yml
│   ├── ntp/
│   │   ├── handlers/
│   │   │   └── main.yml
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   └── templates/
│   │       └── ntp.conf.j2
│   ├── ssh/
│   │   ├── handlers/
│   │   │   └── main.yml
│   │   └── tasks/
│   │       └── main.yml
│   └── users/
│       └── tasks/
│           └── main.yml
├── ansible.cfg
├── inventory
├── int_script.sh
└── playbook.yml
```

---

## Лицензия

Этот проект распространяется под лицензией MIT. Подробности см. в файле [LICENSE](LICENSE).
