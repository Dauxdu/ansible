# Сборник ролей для Ansible

Автоматизация базовой настройки серверов на дистрибутивах Debian и Ubuntu.

---

## Роли

| Роль                      | Назначение                                                                  | Ключевые переменные                                          |
| ------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `set_hostname`            | Имя хоста + запись в `/etc/hosts`                                           | `set_hostname_name`                                          |
| `set_timezone`            | Часовой пояс                                                                | `set_timezone_name`                                          |
| `set_motd`                | Кастомный MOTD с инфо о системе                                             | `set_motd_show`, `set_motd_disk_warning_threshold`           |
| `set_packages`            | Базовые пакеты через apt                                                    | `set_packages_apt`                                           |
| `set_repository`          | APT-репозитории (deb822)                                                    | `set_repository_repos`                                       |
| `set_unattended_upgrades` | Автообновления безопасности                                                 | `set_unattended_upgrades_*`                                  |
| `set_chrony`              | Синхронизация времени (chrony ≥ 4.0)                                        | `set_chrony_ntp_servers`                                     |
| `set_users`               | Пользователи, sudo, SSH-ключи                                               | `set_users_accounts`                                         |
| `set_ssh`                 | Харденинг SSH (drop-in, Debian 11+/Ubuntu 20.04+)                           | `set_ssh_options`                                            |
| `set_ufw`                 | Файрвол UFW; порт SSH наследуется из `set_ssh_options.Port`                 | `set_ufw_rules_allow`                                        |
| `set_netplan`             | Сеть через netplan с rescue-откатом                                         | `set_netplan_config`                                         |
| `set_docker_repository`   | APT-репозиторий Docker CE (GPG-ключ + deb822)                               | `set_docker_repository_url`                                  |
| `set_docker`              | Установка Docker Engine + daemon.json + авторизация в реестрах; запускать после `set_docker_repository` | `set_docker_registries`, `set_docker_log_*` |
| `set_docker_swarm`        | Инициализация и join Docker Swarm (группы `swarm_managers`/`swarm_workers`) | `set_docker_swarm_primary`                                   |
| `set_docker_network`      | Overlay-сети Swarm                                                          | `set_docker_network_overlay`                                 |
| `deploy_docker_stack`     | Генерация compose-файла и `docker stack deploy`                             | `deploy_docker_stack_name`, `deploy_docker_stack_definition` |

> **Docker и UFW:** Docker управляет iptables напрямую и обходит ufw —
> опубликованные порты контейнеров открыты независимо от правил ufw.

Переменные со значениями по умолчанию и примеры — в `roles/<роль>/defaults/main.yml`.

---

## Требования к качеству кода

Проект использует статический анализ кода для предотвращения ошибок перед развертыванием. Для локальной проверки запустите команды из корня репозитория.

### 1. Проверка YAML-форматирования

Конфигурация `.yamllint` настроена на работу по правилам `ansible-lint`.

```bash
# Установка линтера
pip install yamllint

# Запуск проверки
yamllint .
```

### 2. Проверка Ansible-кода

```bash
# Установка линтера
pip install ansible-lint

# Запуск статического анализа
ansible-lint
```
