# Використовуємо офіційний Python образ з версією, яка вам потрібна
FROM python:3.11

# Встановлюємо робочий каталог у контейнері
WORKDIR /app

# Копіюємо файли з вашого поточного каталогу до /app у контейнері
COPY . /app

# Встановлюємо Poetry та виконуємо команду для інсталяції залежностей з pyproject.toml
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Встановлюємо необхідність установити порт 8080 доступним для зовнішніх клієнтів
EXPOSE 3000

# Команда для запуску вашого додатку при старті контейнера
CMD ["python", "main.py"]
