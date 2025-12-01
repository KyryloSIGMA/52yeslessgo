#!/bin/bash
# Варіант 2: Обробка Вмісту Цільової Директорії

TARGET_DIR="./test_directory"

echo "--- Починаю обробку директорії: $TARGET_DIR ---"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "ПОМИЛКА: Директорія $TARGET_DIR не знайдена."
    exit 1
fi

for item in "$TARGET_DIR"/*; do

    if [[ -d "$item" ]]; then
        echo "Знайдено директорію: $(basename "$item") - пропускаю."

    elif [[ -f "$item" ]]; then

        FILENAME=$(basename "$item")
        NEW_DIR_NAME="${FILENAME}_dir"

        # Створюємо нову папку
        mkdir -p "$TARGET_DIR/$NEW_DIR_NAME"

        # Переміщуємо файл
        mv "$item" "$TARGET_DIR/$NEW_DIR_NAME/"

        echo "Файл '$FILENAME' переміщено до '$NEW_DIR_NAME/'"
    fi
done

echo "--- Обробку завершено. ---"
