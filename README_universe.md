# База данных "universe" (PostgreSQL)

База данных "universe" моделирует астрономические объекты: галактики, звёзды, планеты, типы планет и луны, а также их свойства и взаимосвязи.

## Структура базы данных

### Таблицы

- **galaxy** — галактики
  - `galaxy_id` SERIAL PRIMARY KEY
  - `name` VARCHAR(100) NOT NULL UNIQUE
  - `description` TEXT
  - `is_spherical` BOOLEAN NOT NULL
  - `age_in_millions_of_years` INTEGER NOT NULL
  - `distance_from_earth` NUMERIC
  - `has_life` BOOLEAN NOT NULL

- **star** — звёзды
  - `star_id` SERIAL PRIMARY KEY
  - `name` VARCHAR(100) NOT NULL UNIQUE
  - `galaxy_id` INT REFERENCES galaxy(galaxy_id)
  - `temperature` INTEGER NOT NULL
  - `mass` INTEGER
  - `is_visible` BOOLEAN NOT NULL
  - `distance_from_earth` NUMERIC
  - `description` TEXT

- **planet** — планеты
  - `planet_id` SERIAL PRIMARY KEY
  - `name` VARCHAR(100) NOT NULL UNIQUE
  - `star_id` INT REFERENCES star(star_id)
  - `has_life` BOOLEAN NOT NULL
  - `is_spherical` BOOLEAN NOT NULL
  - `age_in_millions_of_years` INTEGER NOT NULL
  - `distance_from_earth` NUMERIC
  - `population` INTEGER
  - `moon_count` INTEGER
  - `description` TEXT

- **planet_type** — типы планет
  - `planet_type_id` SERIAL PRIMARY KEY
  - `name` VARCHAR(100) NOT NULL UNIQUE
  - `description` TEXT
  - `average_mass` INTEGER
  - `is_habitable` BOOLEAN

- **moon** — луны
  - `moon_id` SERIAL PRIMARY KEY
  - `name` VARCHAR(100) NOT NULL UNIQUE
  - `planet_id` INT REFERENCES planet(planet_id)
  - `is_spherical` BOOLEAN NOT NULL
  - `age_in_millions_of_years` INTEGER NOT NULL
  - `distance_from_earth` NUMERIC
  - `temperature` INTEGER
  - `has_water` BOOLEAN NOT NULL
  - `description` TEXT

## Связи между таблицами

- Одна галактика содержит много звёзд (`star.galaxy_id`)
- Одна звезда содержит много планет (`planet.star_id`)
- Одна планета может иметь много лун (`moon.planet_id`)
- Типы планет хранятся отдельно, связь с планетами может быть реализована через дополнительную таблицу (не реализовано явно)

## Пример инициализации базы данных

```sql
CREATE DATABASE universe;
\c universe

-- Таблицы и последовательности создаются согласно дампу (см. выше)

-- Пример наполнения таблиц:
INSERT INTO galaxy (name, description, is_spherical, age_in_millions_of_years, distance_from_earth, has_life) VALUES
  ('Milky Way', 'Our home galaxy', true, 13600, 0, true),
  ('Andromeda', 'Closest spiral galaxy', true, 10000, 2537000, false);

INSERT INTO star (name, galaxy_id, temperature, mass, is_visible, distance_from_earth, description) VALUES
  ('Sun', 1, 5778, 1, true, 0, 'Our solar system''s star');

INSERT INTO planet (name, star_id, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, population, moon_count, description) VALUES
  ('Earth', 1, true, true, 4540, 0, NULL, 1, 'Our home planet');

INSERT INTO moon (name, planet_id, is_spherical, age_in_millions_of_years, distance_from_earth, temperature, has_water, description) VALUES
  ('Moon', 1, true, 4500, 0.00038, 25, true, 'Earth''s natural satellite');
```

## Примечания

- Все внешние ключи и уникальные ограничения уже настроены.
- Для расширения функционала можно добавить связи между планетами и их типами.
- Данные можно импортировать с помощью `psql` или `pg_restore` из дампа. 