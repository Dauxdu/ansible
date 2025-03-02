#!/bin/bash

install_python_debian() {
    echo "Обновление списка пакетов..."
    sudo apt update -y || {
        echo "Ошибка при обновлении списка пакетов"
        exit 1
    }

    echo "Установка Python..."
    sudo apt install -y python3 python3-pip || {
        echo "Ошибка при установке Python"
        exit 1
    }

    echo "Python установлен."
}

install_python_rhel() {
    echo "Обновление списка пакетов..."
    sudo yum check-update || {
        echo "Ошибка при обновлении списка пакетов"
        exit 1
    }

    echo "Установка Python..."
    sudo yum install -y python3 python3-pip || {
        echo "Ошибка при установке Python"
        exit 1
    }

    echo "Python установлен."
}

install_python_arch() {
    echo "Обновление списка пакетов..."
    sudo pacman -Sy || {
        echo "Ошибка при обновлении списка пакетов"
        exit 1
    }

    echo "Установка Python..."
    sudo pacman -S --noconfirm python3 python3-pip || {
        echo "Ошибка при установке Python"
        exit 1
    }

    echo "Python установлен."
}

# Определение дистрибутива
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ -f /etc/debian_version ]; then
        install_python_debian
        exit 0
    elif [ -f /etc/redhat-release ]; then
        install_python_rhel
        exit 0
    elif [[ "$ID" == "arch" || "$ID" == "manjaro" ]]; then
        install_python_arch
        exit 0
    else
        echo "Дистрибутив не поддерживается..."
        exit 1
    fi
else
    echo "Не удалось определить дистрибутив..."
    exit 1
fi
